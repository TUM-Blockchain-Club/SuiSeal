// code was adopted from https://github.com/MystenLabs/sui/blob/main/sui_programmability/examples/nfts/sources/devnet_nft.move

// Copyright (c) Mysten Labs, Inc.

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ---

// Modifications by Alexander Semenov:

// - Renamed variables, module names and descriptions
//  for clarity and consistency.

module nft::nft {
    use sui::url::{Self, Url};
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::event;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    // todo access control!
    struct NFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        url: Url,
    }

    struct NFTMintEvent has copy, drop {
        object_id: ID,
        creator: address,
        name: string::String,
    }

    public entry fun mint(
        name: vector<u8>,
        description: vector<u8>,
        url: vector<u8>,
        ctx: &mut TxContext
    ) {
        let nft = NFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            url: url::new_unsafe_from_bytes(url)
        };
        let sender = tx_context::sender(ctx);
        event::emit(NFTMintEvent {
            object_id: object::uid_to_inner(&nft.id),
            creator: sender,
            name: nft.name,
        });
        transfer::public_transfer(nft, sender);
    }

    public entry fun update_description(
        nft: &mut NFT,
        new_description: vector<u8>,
    ) {
        nft.description = string::utf8(new_description)
    }

    public entry fun burn(nft: NFT) {
        let NFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id)
    }

    public fun name(nft: &NFT): &string::String {
        &nft.name
    }

    public fun description(nft: &NFT): &string::String {
        &nft.description
    }

    public fun url(nft: &NFT): &Url {
        &nft.url
    }

    public fun id(nft: &NFT): &UID {
        &nft.id
    }
}

#[test_only]
module nft::nft_test {
    use nft::nft::{Self, NFT};
    use sui::test_scenario as ts;
    use sui::transfer;
    use std::string;

    #[test]
    fun mint_transfer_update() {
        let addr1 = @0xA;
        let addr2 = @0xB;
        
        // nft mint
        let scenario = ts::begin(addr1);
        {
            nft::mint(b"TBC NFT", b"This is my NFT on the SUI blockchain", b"https://www.tum-blockchain.com", ts::ctx(&mut scenario))
        };

        // nft transfer from @0xA to @0xB
        ts::next_tx(&mut scenario, addr1);
        {
            let nft = ts::take_from_sender<NFT>(&mut scenario);
            transfer::public_transfer(nft, addr2);
        };

        // update of description
        ts::next_tx(&mut scenario, addr2); 
        {
            let nft = ts::take_from_sender<NFT>(&mut scenario);
            nft::update_description(&mut nft, b"This is our NFT on the SUI blockchain") ;
            assert!(*string::bytes(nft::description(&nft)) == b"This is our NFT on the SUI blockchain", 0);
            ts::return_to_sender(&mut scenario, nft);
        };

        // nft destruction
        ts::next_tx(&mut scenario, addr2);
        {
            let nft = ts::take_from_sender<NFT>(&mut scenario);
            nft::burn(nft)
        };
        ts::end(scenario);
    }
}
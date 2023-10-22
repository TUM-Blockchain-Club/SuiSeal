#[test_only]
module challenge_response_kiosk::challenge_response_kiosk_test {
    use challenge_response_kiosk::challenge_response_kiosk;
    use nft::nft::{Self, NFT};
    use sui::object::{Self, ID, UID};
    use sui::test_scenario as ts;
    use sui::transfer;
    use std::string;
    use sui::tx_context::{TxContext, sender};

    #[test]
    fun test_it() {
        let addr1 = @0xA;
        
        // nft mint
        let scenario = ts::begin(addr1);
        {
            nft::mint(b"TBC NFT", b"This is my NFT on the SUI blockchain", b"https://www.tum-blockchain.com", ts::ctx(&mut scenario))            
        };

        
        // nft transfer from @0xA to @0xB
        ts::next_tx(&mut scenario, addr1);
        {
            let nft = ts::take_from_sender<NFT>(&mut scenario);
            ts::next_tx(&mut scenario, addr1);
            let (k, k_cap) = challenge_response_kiosk::new(ts::ctx(&mut scenario));
            ts::next_tx(&mut scenario, addr1);
            challenge_response_kiosk::place_and_list<NFT>(&mut k, &k_cap, nft, 300, ts::ctx(&mut scenario));
            ts::next_tx(&mut scenario, addr1);
            let coins = challenge_response_kiosk::close_and_withdraw(k, k_cap, ts::ctx(&mut scenario));
            ts::next_tx(&mut scenario, addr1);
            //transfer::transfer(coins, sender(ts::ctx(&mut scenario)));
            transfer::public_transfer(coins, addr1);
        };
        ts::end(scenario);
    }
    
}
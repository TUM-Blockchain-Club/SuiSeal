#[test_only]
module challenge_response_kiosk::challenge_response_kiosk_test {
    use challenge_response_kiosk::challenge_response_kiosk;
    use nft::nft::{Self, NFT};
    use sui::object::{Self, ID, UID};
    use sui::test_scenario as ts;
    use sui::transfer;
    use std::string;
    use sui::tx_context::{TxContext, sender};
    use sui::coin::{Self, Coin, mint_for_testing as mint};

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
            let nft_id = object::id(&nft);
            //sell
            challenge_response_kiosk::place_and_list<NFT>(&mut k, &k_cap, nft, 300, ts::ctx(&mut scenario));
            assert!(challenge_response_kiosk::has_item(&k, nft_id), 10);
            //buy
            let rand: vector<u8> = x"181D402C293144636EE8A0E74F37FA3F565A5BAA8FE5A202DC66D28628CA084962D4911E6FBDCBF9BD8B7EB05325CFBE1CCBC9E871F71361488F145707123B07";
            let pk: vector<u8> = x"29528A5A7DE916DB8AE7A5854373B2ED3E47993F3AD49A75B7DF21136AEBE0BB";

            challenge_response_kiosk::purchase(rand, &mut k, nft_id, pk, 0);
            // end 
            ts::next_tx(&mut scenario, addr1);
            let coins = challenge_response_kiosk::close_and_withdraw(k, k_cap, ts::ctx(&mut scenario));
            ts::next_tx(&mut scenario, addr1);
            transfer::public_transfer(coins, addr1);
        };
        ts::end(scenario);
    }
    
}
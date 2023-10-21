module challenge_response_kiosk::drop {
    use std::option::{Self, Option};
    use sui::tx_context::{TxContext, sender};
    use sui::bag::{Self, Bag};
    use sui::kiosk::{Self, Kiosk, KioskOwnerCap};
    use sui::kiosk_extension::{Self, Extension};

    struct EXT has drop {}

    public fun new(ctx: &mut TxContext): (Kiosk, KioskOwnerCap){
        let (k, k_cap) = kiosk::new(ctx);
        kiosk::set_allow_extensions(&mut k, &k_cap, true);
        let ext = EXT {};
        kiosk_extension::add(ext, &mut k, &k_cap, 00, ctx);
        
        (k,k_cap)
    }
    
    public fun challenge(rand : vector<u8>) {
        // emit event for seller
    }

    public fun withdraw() {
        // withdraw money from buyer
    }

    public fun submit_sig(sig: vector<u8>) {

    }

    fun verify_sig(sig: vector<u8>) : bool {
        false
    }
}
module challenge_response_kiosk::drop {
    use std::option::{Self, Option};
    use sui::tx_context::{TxContext, sender};
    use sui::table::{Table, Self};
    use sui::bag::{Self, Bag};
    use sui::dynamic_field as df;
    use sui::kiosk::{Self, Kiosk, KioskOwnerCap, PurchaseCap, Borrow};
    use sui::kiosk_extension::{Self, Extension};
    use sui::object::{Self, ID, UID};
    use sui::dynamic_object_field as dof;
    use sui::transfer_policy::{
        Self,
        TransferPolicy,
        TransferRequest
    };
    use sui::balance::{Self, Balance};
    use sui::coin::{Self, Coin};
    use sui::sui::SUI;
    use sui::event;

    struct EXT has drop {}

    const TABLE_ID : u8 = 0;

    public fun new(ctx: &mut TxContext): (Kiosk, KioskOwnerCap){
        let (k, k_cap) = kiosk::new(ctx);
        kiosk::set_allow_extensions(&mut k, &k_cap, true);
        kiosk_extension::add(EXT {}, &mut k, &k_cap, 00, ctx);
        //bag to store value pairs: <(address-from buyer, UID-object in kiosk), (coins, rand)>
        let ext_bag = kiosk_extension::storage_mut<EXT>(EXT {}, &mut k);
        //let addr : address = sender(ctx);        
        (k,k_cap)
    }

    //owner

    public fun list<T: key + store>(
        self: &mut Kiosk, cap: &KioskOwnerCap, id: ID, price: u64
    ) {
        kiosk::list<T>(self, cap, id, price);
        let ext_bag = kiosk_extension::storage_mut<EXT>(EXT {}, self);
        bag::add(ext_bag, k, v);
    }
    
    public fun submit_sig(sig: vector<u8>) {

    }

    public fun close_and_withdraw(
        self: Kiosk, cap: KioskOwnerCap, ctx: &mut TxContext
    ): Coin<SUI> {
        kiosk::close_and_withdraw(self, cap, ctx)
        //TODO
    }

    public fun set_owner(
        self: &mut Kiosk, cap: &KioskOwnerCap, ctx: &TxContext
    ) {
        kiosk::set_owner(self, cap, ctx)
    }

    public fun set_owner_custom(
        self: &mut Kiosk, cap: &KioskOwnerCap, owner: address
    ) {
        kiosk::set_owner_custom(self, cap, owner)
    }

    public fun place<T: key + store>(
        self: &mut Kiosk, cap: &KioskOwnerCap, item: T
    ) {
        kiosk::place<T>(self, cap, item)
    }

    public fun lock<T: key + store>(
        self: &mut Kiosk, cap: &KioskOwnerCap, _policy: &TransferPolicy<T>, item: T
    ) {
        kiosk::lock<T>(self, cap, _policy, item)
    }

    public fun take<T: key + store>(
        self: &mut Kiosk, cap: &KioskOwnerCap, id: ID
    ): T {
        kiosk::take<T>(self, cap, id)
        //TODO look into
    }

    public fun place_and_list<T: key + store>(
        self: &mut Kiosk, cap: &KioskOwnerCap, item: T, price: u64
    ) {
        let id = object::id(&item);
        place(self, cap, item);
        list<T>(self, cap, id, price)
    }

    public fun delist<T: key + store>(
        self: &mut Kiosk, cap: &KioskOwnerCap, id: ID
    ) {
        kiosk::delist<T>(self,cap,id)
        //TODO
    }

    public fun list_with_purchase_cap<T: key + store>(
        self: &mut Kiosk, cap: &KioskOwnerCap, id: ID, min_price: u64, ctx: &mut TxContext
    ): kiosk::PurchaseCap<T> {
        kiosk::list_with_purchase_cap<T>(self,cap,id,min_price,ctx)
    }

    
    public fun return_purchase_cap<T: key + store>(
        self: &mut Kiosk, purchase_cap: kiosk::PurchaseCap<T>
    ) {
        //TODO even owner?
        kiosk::return_purchase_cap<T>(self, purchase_cap)
    }

    public fun withdraw(
        self: &mut Kiosk, cap: &KioskOwnerCap, amount: Option<u64>, ctx: &mut TxContext
    ): Coin<SUI> {
        kiosk::withdraw(self, cap,amount,ctx)
        //TODO
    }

    
    //buyer

    public fun challenge(rand : vector<u8>) {
        // emit event for seller
    }

    public fun purchase<T: key + store>(
        self: &mut Kiosk, id: ID, payment: Coin<SUI>
    ): (T, TransferRequest<T>) {
        //TODO
        kiosk::purchase<T>(self,id,payment)
    }

    public fun purchase_with_cap<T: key + store>(
        self: &mut Kiosk, purchase_cap: kiosk::PurchaseCap<T>, payment: Coin<SUI>
    ): (T, TransferRequest<T>) {
        //TODO
        kiosk::purchase_with_cap<T>(self, purchase_cap, payment)
    }

    fun verify_sig(sig: vector<u8>) : bool {
        false
    }

    // ------------------------------------------------------------
    // FIELD ACCESS
    // ------------------------------------------------------------

    public fun has_item(self: &Kiosk, id: ID): bool {
        kiosk::has_item(self, id)
    }

    /// Check whether the `item` is present in the `Kiosk` and has type T.
    public fun has_item_with_type<T: key + store>(self: &Kiosk, id: ID): bool {
        kiosk::has_item_with_type<T>(self,id)
    }

    /// Check whether an item with the `id` is locked in the `Kiosk`. Meaning
    /// that the only two actions that can be performed on it are `list` and
    /// `list_with_purchase_cap`, it cannot be `take`n out of the `Kiosk`.
    public fun is_locked(self: &Kiosk, id: ID): bool {
        kiosk::is_locked(self, id)
    }

    /// Check whether an `item` is listed (exclusively or non exclusively).
    public fun is_listed(self: &Kiosk, id: ID): bool {
        kiosk::is_listed(self, id)
    }

    /// Check whether there's a `PurchaseCap` issued for an item.
    public fun is_listed_exclusively(self: &Kiosk, id: ID): bool {
        kiosk::is_listed_exclusively(self,id)
    }

    /// Check whether the `KioskOwnerCap` matches the `Kiosk`.
    public fun has_access(self: &mut Kiosk, cap: &KioskOwnerCap): bool {
        kiosk::has_access(self,cap)
    }

    /// Access the `UID` using the `KioskOwnerCap`.
    public fun uid_mut_as_owner(
        self: &mut Kiosk, cap: &KioskOwnerCap
    ): &mut UID {
        kiosk::uid_mut_as_owner(self,cap)
    }

    /// Get the immutable `UID` for dynamic field access.
    /// Always enabled.
    ///
    /// Given the &UID can be used for reading keys and authorization,
    /// its access
    public fun uid(self: &Kiosk): &UID {
        kiosk::uid(self)
    }

    /// Get the mutable `UID` for dynamic field access and extensions.
    /// Aborts if `allow_extensions` set to `false`.
    public fun uid_mut(self: &mut Kiosk): &mut UID {
        kiosk::uid_mut(self)
    }

    /// Get the owner of the Kiosk.
    public fun owner(self: &Kiosk): address {
        kiosk::owner(self)
    }

    /// Get the number of items stored in a Kiosk.
    public fun item_count(self: &Kiosk): u32 {
        kiosk::item_count(self)
    }

    /// Get the amount of profits collected by selling items.
    public fun profits_amount(self: &Kiosk): u64 {
        kiosk::profits_amount(self)
    }

    /// Get mutable access to `profits` - owner only action.
    public fun profits_mut(self: &mut Kiosk, cap: &KioskOwnerCap): &mut Balance<SUI> {
        kiosk::profits_mut(self,cap)
    }

    // === Item borrowing ===

    /// Immutably borrow an item from the `Kiosk`. Any item can be `borrow`ed
    /// at any time.
    public fun borrow<T: key + store>(
        self: &Kiosk, cap: &KioskOwnerCap, id: ID
    ): &T {
        kiosk::borrow<T>(self,cap,id)
    }

    /// Mutably borrow an item from the `Kiosk`.
    /// Item can be `borrow_mut`ed only if it's not `is_listed`.
    public fun borrow_mut<T: key + store>(
        self: &mut Kiosk, cap: &KioskOwnerCap, id: ID
    ): &mut T {
        kiosk::borrow_mut<T>(self,cap,id)
    }

    /// Take the item from the `Kiosk` with a guarantee that it will be returned.
    /// Item can be `borrow_val`-ed only if it's not `is_listed`.
    public fun borrow_val<T: key + store>(
        self: &mut Kiosk, cap: &KioskOwnerCap, id: ID
    ): (T, Borrow) {
        kiosk::borrow_val<T>(self,cap,id)
    }

    /// Return the borrowed item to the `Kiosk`. This method cannot be avoided
    /// if `borrow_val` is used.
    public fun return_val<T: key + store>(
        self: &mut Kiosk, item: T, borrow: Borrow
    ) {
        kiosk::return_val<T>(self,item,borrow)
    }

    // === KioskOwnerCap fields access ===

    /// Get the `for` field of the `KioskOwnerCap`.
    public fun kiosk_owner_cap_for(cap: &KioskOwnerCap): ID {
        kiosk::kiosk_owner_cap_for(cap)
    }

    // === PurchaseCap fields access ===

    /// Get the `kiosk_id` from the `PurchaseCap`.
    public fun purchase_cap_kiosk<T: key + store>(self: &PurchaseCap<T>): ID {
        kiosk::purchase_cap_kiosk<T>(self)
    }

    /// Get the `Item_id` from the `PurchaseCap`.
    public fun purchase_cap_item<T: key + store>(self: &PurchaseCap<T>): ID {
        kiosk::purchase_cap_item<T>(self)
    }

    /// Get the `min_price` from the `PurchaseCap`.
    public fun purchase_cap_min_price<T: key + store>(self: &PurchaseCap<T>): u64 {
        kiosk::purchase_cap_min_price<T>(self)
    }
}
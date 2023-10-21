module verificator::verificator {

   use sui::object::{Self, UID};
   use sui::transfer;
   use sui::tx_context::{Self, TxContext};
   use sui::ed25519;


  struct VerifyObj has key, store{
    id: UID,
    text: bool
  }

  public entry fun verify_sig(ctx: &mut TxContext) {
    let msg: vector<u8> = x"181D402C293144636EE8A0E74F37FA3F565A5BAA8FE5A202DC66D28628CA084962D4911E6FBDCBF9BD8B7EB05325CFBE1CCBC9E871F71361488F145707123B07";
    let pk: vector<u8> = x"29528A5A7DE916DB8AE7A5854373B2ED3E47993F3AD49A75B7DF21136AEBE0BB";
    let sig: vector<u8> = x"AA2DD8AA6082F270ECF0FDF478283A73FE09A13B2F8960B9548CA9252542F0EE1B459AB17431CDDCFCB973560BC8AA9D738DBF2E889B61833C579109C83BA808";
    let verify: bool = ed25519::ed25519_verify(&sig, &pk, &msg);

    // Specify the type of the object.
    let object: VerifyObj = VerifyObj {
       id: object::new(ctx),
       text: verify
       };
        transfer::transfer(object, tx_context::sender(ctx));
   }
}
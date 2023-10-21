module verificator::verificator {

  use sui::ed25519;

  public entry fun verify_sig(pk: vector<u8>, sig: vector<u8>, msg: vector<u8>): bool {
    let isvalid: bool = ed25519::ed25519_verify(&sig, &pk, &msg);
    isvalid
   }
  
  #[test]
  fun test_verify_sig() {
    let msg: vector<u8> = x"181D402C293144636EE8A0E74F37FA3F565A5BAA8FE5A202DC66D28628CA084962D4911E6FBDCBF9BD8B7EB05325CFBE1CCBC9E871F71361488F145707123B07";
    let pk: vector<u8> = x"29528A5A7DE916DB8AE7A5854373B2ED3E47993F3AD49A75B7DF21136AEBE0BB";
    let sig: vector<u8> = x"AA2DD8AA6082F270ECF0FDF478283A73FE09A13B2F8960B9548CA9252542F0EE1B459AB17431CDDCFCB973560BC8AA9D738DBF2E889B61833C579109C83BA808";
    let verify: bool = ed25519::ed25519_verify(&sig, &pk, &msg);
    assert!(verify, 0);
  }
}
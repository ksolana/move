// signers 0xcafe

module 0x10::bcs {
  native public fun to_bytes<MoveValue>(v: &MoveValue): vector<u8>;
  native public fun test_from_bytes<MoveValue>(v: &vector<u8>): MoveValue;
}

module 0x10::vector {
  native public fun empty<Element>(): vector<Element>;
  native public fun push_back<Element>(v: &mut vector<Element>, e: Element);
  native public fun pop_back<Element>(v: &mut vector<Element>): Element;
  native public fun length<Element>(v: &vector<Element>): u64;
}

module 0x10::debug {
  native public fun print<T>(x: &T);
}

module 0x10::tests {
  use 0x10::bcs;
  use 0x10::vector;
  use 0x10::debug;

  public fun test_bool() {
    let v: bool = true;
    let vs: vector<u8> = bcs::to_bytes(&v);
    let vv: bool = bcs::test_from_bytes(&vs);
    assert!(v == vv, 11);
  }

  public fun test_u8() {
    let v: u8 = 50;
    let vs: vector<u8> = bcs::to_bytes(&v);
    let vv: u8 = bcs::test_from_bytes(&vs);
    assert!(v == vv, 11);
  }

  public fun test_u16() {
    let v: u16 = 50;
    let vs: vector<u8> = bcs::to_bytes(&v);
    let vv: u16 = bcs::test_from_bytes(&vs);
    assert!(v == vv, 11);
  }

  public fun test_u32() {
    let v: u32 = 50;
    let vs: vector<u8> = bcs::to_bytes(&v);
    let vv: u32 = bcs::test_from_bytes(&vs);
    assert!(v == vv, 11);
  }

  public fun test_u64() {
    let v: u64 = 50;
    let vs: vector<u8> = bcs::to_bytes(&v);
    let vv: u64 = bcs::test_from_bytes(&vs);
    assert!(v == vv, 11);
  }

  public fun test_u128() {
    let v: u128 = 50;
    let vs: vector<u8> = bcs::to_bytes(&v);
    let vv: u128 = bcs::test_from_bytes(&vs);
    assert!(v == vv, 11);
  }

  public fun test_u256() {
    let v: u256 = 50;
    let vs: vector<u8> = bcs::to_bytes(&v);
    let vv: u256 = bcs::test_from_bytes(&vs);
    assert!(v == vv, 11);
  }

  public fun test_address() {
    let v: address = @50;
    let vs: vector<u8> = bcs::to_bytes(&v);
    let vv: address = bcs::test_from_bytes(&vs);
    assert!(v == vv, 11);
  }

  public fun test_signer(v: signer) {
    let vs: vector<u8> = bcs::to_bytes(&v);
    let vv: signer = bcs::test_from_bytes(&vs);
    assert!(v == vv, 11);
  }

  struct TestStruct has drop {
    a: u8,
    b: u8,
  }

  public fun test_struct() {
    let v: TestStruct = TestStruct { a: 1, b: 2 };
    let vs: vector<u8> = bcs::to_bytes(&v);
    let vv: TestStruct = bcs::test_from_bytes(&vs);
    assert!(v == vv, 11);
  }

  public fun test_vec_bool() {
    let v: vector<bool> = vector::empty();
    vector::push_back(&mut v, true);
    vector::push_back(&mut v, false);
    let vs: vector<u8> = bcs::to_bytes(&v);
    let vv: vector<bool> = bcs::test_from_bytes(&vs);
    assert!(v == vv, 11);
  }

  public fun test_vec_u8() {
    let v: vector<u8> = vector::empty();
    vector::push_back(&mut v, 1);
    vector::push_back(&mut v, 2);
    let vs: vector<u8> = bcs::to_bytes(&v);
    let vv: vector<u8> = bcs::test_from_bytes(&vs);
    assert!(v == vv, 11);
  }

  public fun test_vec_u16() {
    let v: vector<u16> = vector::empty();
    vector::push_back(&mut v, 1);
    vector::push_back(&mut v, 2);
    let vs: vector<u8> = bcs::to_bytes(&v);
    let vv: vector<u16> = bcs::test_from_bytes(&vs);
    assert!(v == vv, 11);
  }

  public fun test_vec_u32() {
    let v: vector<u32> = vector::empty();
    vector::push_back(&mut v, 1);
    vector::push_back(&mut v, 2);
    let vs: vector<u8> = bcs::to_bytes(&v);
    let vv: vector<u32> = bcs::test_from_bytes(&vs);
    assert!(v == vv, 11);
  }

  public fun test_vec_u64() {
    let v: vector<u64> = vector::empty();
    vector::push_back(&mut v, 1);
    vector::push_back(&mut v, 2);
    let vs: vector<u8> = bcs::to_bytes(&v);
    let vv: vector<u64> = bcs::test_from_bytes(&vs);
    assert!(v == vv, 11);
  }

  public fun test_vec_u128() {
    let v: vector<u128> = vector::empty();
    vector::push_back(&mut v, 1);
    vector::push_back(&mut v, 2);
    let vs: vector<u8> = bcs::to_bytes(&v);
    let vv: vector<u128> = bcs::test_from_bytes(&vs);
    assert!(v == vv, 11);
  }

  public fun test_vec_u256() {
    let v: vector<u256> = vector::empty();
    vector::push_back(&mut v, 1);
    vector::push_back(&mut v, 2);
    let vs: vector<u8> = bcs::to_bytes(&v);
    let vv: vector<u256> = bcs::test_from_bytes(&vs);
    assert!(v == vv, 11);
  }

  public fun test_vec_address() {
    let v: vector<address> = vector::empty();
    vector::push_back(&mut v, @1);
    vector::push_back(&mut v, @2);
    let vs: vector<u8> = bcs::to_bytes(&v);
    let vv: vector<address> = bcs::test_from_bytes(&vs);
    assert!(v == vv, 11);
  }

  public fun test_vec_vec_bool() {
    let v: vector<vector<bool>> = vector::empty();
    {
      let velt: vector<bool> = vector::empty();
      vector::push_back(&mut velt, true);
      vector::push_back(&mut velt, false);
      vector::push_back(&mut v, velt);
      let velt: vector<bool> = vector::empty();
      vector::push_back(&mut velt, false);
      vector::push_back(&mut velt, true);
      vector::push_back(&mut v, velt);
    };
    let vs: vector<u8> = bcs::to_bytes(&v);
    let vv: vector<vector<bool>> = bcs::test_from_bytes(&vs);
    assert!(v == vv, 11);
  }

  struct TestVecStruct has drop {
    a: u8,
    b: u8,
  }

  public fun test_vec_struct() {
    let v: vector<TestVecStruct> = vector::empty();
    vector::push_back(&mut v, TestVecStruct { a: 1, b: 2 });
    vector::push_back(&mut v, TestVecStruct { a: 3, b: 4 });
    let vs: vector<u8> = bcs::to_bytes(&v);
    let vv: vector<TestVecStruct> = bcs::test_from_bytes(&vs);
    // fixme this asserts in the compiler
    //assert!(&v == &vv, 11);
  }
}

script {
  use 0x10::tests;

  fun main(s: signer) {
    tests::test_bool();
    tests::test_u8();
    tests::test_u16();
    tests::test_u32();
    tests::test_u64();
    tests::test_u128();
    tests::test_u256();
    tests::test_address();
    tests::test_struct();
    tests::test_signer(s);
    tests::test_vec_bool();
    tests::test_vec_u8();
    tests::test_vec_u16();
    tests::test_vec_u32();
    tests::test_vec_u64();
    tests::test_vec_u128();
    tests::test_vec_u256();
    tests::test_vec_address();
    //tests::test_vec_signer(); // fixme
    tests::test_vec_vec_bool();
    //tests::test_vec_struct(); // fixme
  }
}

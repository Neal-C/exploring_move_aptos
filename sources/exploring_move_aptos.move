module exploring_move_aptos::message {
    use std::error;
    use std::signer;
    use std::string;
    use aptos_framework::event;
    #[test_only]
    use std::debug;

    //:!:>resource
    struct MessageHolder has key {
        message: string::String,
    }
    //<:!:resource

    #[event]
    struct MessageChange has drop, store {
        account: address,
        from_message: string::String,
        to_message: string::String,
    }

    /// There is no message present
    const ENO_MESSAGE: u64 = 0;

    #[view]
    public fun get_message(addr: address): string::String acquires MessageHolder {
        assert!(exists<MessageHolder>(addr), error::not_found(ENO_MESSAGE));
        borrow_global<MessageHolder>(addr).message
    }

    public entry fun set_message(account: signer, message: string::String)
    acquires MessageHolder {
        let account_addr = signer::address_of(&account);
        if (!exists<MessageHolder>(account_addr)) {
            move_to(&account, MessageHolder {
                message,
            })
        } else {
            let old_message_holder = borrow_global_mut<MessageHolder>(account_addr);
            let from_message = old_message_holder.message;
            event::emit(MessageChange {
                account: account_addr,
                from_message,
                to_message: copy message,
            });
            old_message_holder.message = message;
        }
    }

    #[test(account = @0x1)]
    public entry fun sender_can_set_message(account: signer) acquires MessageHolder {
        let msg: string::String = string::utf8(b"Running test for sender_can_set_message...");
        debug::print(&msg);

        let addr = signer::address_of(&account);
        aptos_framework::account::create_account_for_test(addr);
        set_message(account, string::utf8(b"Hello, Blockchain"));

        assert!(
            get_message(addr) == string::utf8(b"Hello, Blockchain"),
            ENO_MESSAGE
        );
    }
}

module 0x1::exploring_aptos_tests {
 
  struct MyCoin has key { value: u64 }
 
  public fun make_sure_non_zero_coin(coin: MyCoin): MyCoin {
    assert!(coin.value > 0, 0);
    coin
  }
 
  public fun has_coin(addr: address): bool {
    exists<MyCoin>(addr)
  }
 
  #[test]
  fun make_sure_non_zero_coin_passes() {
    let coin = MyCoin { value: 1 };
    let MyCoin { value: _ } = make_sure_non_zero_coin(coin);
  }
 
  #[test]
  // Or #[expected_failure] if we don't care about the abort code
  #[expected_failure(abort_code = 0, location = Self)]
  fun make_sure_zero_coin_fails() {
    let coin = MyCoin { value: 0 };
    let MyCoin { value: _ } = make_sure_non_zero_coin(coin);
  }
 
  #[test_only] // test only helper function
  fun publish_coin(account: &signer) {
    move_to(account, MyCoin { value: 1 })
  }
 
  #[test(a = @0x1, b = @0x2)]
  fun test_has_coin(a: signer, b: signer) {
    publish_coin(&a);
    publish_coin(&b);
    assert!(has_coin(@0x1), 0);
    assert!(has_coin(@0x2), 1);
    assert!(!has_coin(@0x3), 1);
  }
}
#[starknet::contract]
mod Math {
    #[storage]
    struct Storage{
        balance: u128,
        }
    fn sum(x: u128, y: u128) -> u128 {
        return x + y;
    }

    // return with expression implicitly
    fn sum_expression(x: u128, y: u128) -> u128 {
        x + y
    }

    // view function: can read but not write storage variables.
    #[external(v0)]
    fn read_balance(self: @ContractState) -> u128 {
        return self.balance.read();
    }

    // external: can read and write storage variables.
    #[external(v0)]
    fn write_balance(ref self: ContractState, new_balance: u128) {
        self.balance.write(new_balance);
    }
}

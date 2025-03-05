pragma solidity ^0.8.20;

contract MappingExample {
    mapping(address => uint256) public balances;

    function update(uint256 newBalance) public {
        balances[msg.sender] = newBalance;
    }
}

contract MappingUser {
    function f() public returns (uint256) {
        MappingExample m = new MappingExample();
        m.update(100);
        return m.balances(address(this));
    }
}

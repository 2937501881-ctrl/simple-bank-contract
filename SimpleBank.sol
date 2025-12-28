// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleBank {
    mapping(address => uint256) private balances;

    // 存钱
    function deposit() public payable {
        require(msg.value > 0, "Must deposit more than 0");
        balances[msg.sender] += msg.value;
    }

    // 取钱
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    // 查询余额
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}

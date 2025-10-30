// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Power of Blockchain
 * @dev A simple example smart contract demonstrating core blockchain principles:
 * transparency, immutability, and decentralization.
 */

contract Project {
    address public owner;
    string public projectName = "Power of Blockchain";

    // A mapping to store user balances (simulating a mini ledger)
    mapping(address => uint256) private balances;

    // Events for transparency
    event Deposit(address indexed user, uint256 amount);
    event Transfer(address indexed from, address indexed to, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    /**
     * @notice Deposit Ether into the contract.
     */
    function deposit() public payable {
        require(msg.value > 0, "Deposit must be greater than 0");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    /**
     * @notice Transfer funds between users (within the contract balance).
     * @param _to Recipient address
     * @param _amount Amount to transfer
     */
    function transfer(address _to, uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        require(_to != address(0), "Invalid recipient");

        balances[msg.sender] -= _amount;
        balances[_to] += _amount;

        emit Transfer(msg.sender, _to, _amount);
    }

    /**
     * @notice Check user balance stored in the contract.
     * @param _user Address to check
     * @return Balance of the user
     */
    function getBalance(address _user) public view returns (uint256) {
        return balances[_user];
    }
}


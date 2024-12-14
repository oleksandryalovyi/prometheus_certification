// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

interface IVault {
    function deposit() external payable;

    function withdrawSafe(address payable holder) external;

    function withdrawUnsafe(address payable holder) external;
}

contract Vault is IVault {
    mapping(address => uint256) public balance;

    function deposit() external payable {
        balance[msg.sender] += msg.value;
    }

    function withdrawSafe(address payable holder) external {
        uint256 amount = balance[holder];

        if (amount<= 0) {
            revert("Insufficient balance");
        }

        balance[holder] = 0;

        (bool success, ) = msg.sender.call{value: amount}("");

        if (!success) {
            balance[holder] += amount;
            revert("Ether transfer failed");
        }
    }

    function withdrawUnsafe(address payable holder) external {
        uint256 amount = 0.0001 ether;

        (bool success, ) = msg.sender.call{value: amount}("");

        balance[holder] = 0;

        if (!success) {
            balance[holder] += amount;
            revert("Ether transfer failed");
        }
    }
}
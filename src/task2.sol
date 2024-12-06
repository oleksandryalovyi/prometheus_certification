/**
 *Submitted for verification at Etherscan.io on 2024-12-06
*/

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

interface IDataTypesPractice {
    function getInt256() external view returns (int256);

    function getUint256() external view returns (uint256);

    function getInt8() external view returns (int8);

    function getUint8() external view returns (uint8);

    function getBool() external view returns (bool);

    function getAddress() external view returns (address);

    function getBytes32() external view returns (bytes32);

    function getArrayUint5() external view returns (uint256[5] memory);

    function getArrayUint() external view returns (uint256[] memory);

    function getString() external view returns (string memory);

    function getBigUint() external pure returns (uint256);
}

contract Task2 is IDataTypesPractice {

    int256 public int256Value = 2 ** 255 - 1;
    uint256 public uint256Value = 2 ** 256 - 1;
    int8 public int8Value = 2 ** 7 - 1;
    uint8 public uint8Value = 2 ** 8 - 1;
    bool public boolValue = true;
    address public addressValue = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    bytes32 public bytes32Value = bytes32(uint256(uint160(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4)));
    uint256[5] public arrayUint5 = [1, 2, 3, 4, 5];
    uint256[] public arrayUint = [1, 2, 3, 4, 5];
    string public stringValue = "Hello World!";

    function getInt256() external view override returns (int256) {
        return int256Value;
    }

    function getUint256() external view override returns (uint256) {
        return uint256Value;
    }

    function getInt8() external view override returns (int8) {
        return int8Value;
    }

    function getUint8() external view override returns (uint8) {
        return uint8Value;
    }

    function getBool() external view override returns (bool) {
        return boolValue;
    }

    function getAddress() external view override returns (address) {
        return addressValue;
    }

    function getBytes32() external view override returns (bytes32) {
        return bytes32Value;
    }

    function getArrayUint5() external view override returns (uint256[5] memory) {
        return arrayUint5;
    }

    function getArrayUint() external view override returns (uint256[] memory) {
        return arrayUint;
    }

    function getString() external view override returns (string memory) {
        return stringValue;
    }

    function getBigUint() external pure returns (uint256) {
        uint256 v1 = 1;
        uint256 v2 = 2;

        return ~v2 + v1;
    }

}
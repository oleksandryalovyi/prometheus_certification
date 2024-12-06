// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract HelloWorld {

   string public greet;

   constructor(string memory name) {

       require(bytes(name).length > 0, "name can't be empty");

       greet = string.concat("Hello world, my name is ", name);

   }

}
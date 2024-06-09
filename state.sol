// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract state
{
    uint public  age;
    uint public num;
    function setage() public
    {
    age=10;
    num=999;
    }
}
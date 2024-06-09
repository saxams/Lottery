// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract gett
{
    uint age=100;
function getter() public view returns(uint)
{
    return age;
}
function setter(uint newage) public 
{
age=newage;
}
}
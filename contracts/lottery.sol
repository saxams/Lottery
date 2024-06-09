// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract Lottery {
    address public manager;
    address payable[] public p;
    uint private counter;

    constructor() {
        manager = msg.sender;
        counter = 0;
    }

    receive() external payable {
        require(msg.value >= 0.15 ether, "Minimum 0.15 ether required");
        p.push(payable(msg.sender));
    }

    function getBalance() public view returns(uint) {
        require(msg.sender == manager, "Only manager can check balance");
        return address(this).balance;
    }

    function incrementCounter() private {
        counter++;
    }

    function random() public returns(uint) {
        incrementCounter();
        return uint(keccak256(abi.encodePacked(counter)));
    }

    function selectWinner() public returns(address) {
        require(msg.sender == manager, "Only manager can select winner");
        require(p.length >= 2, "Not enough participants");

        uint r = random();
        address payable winner;
        uint index = r % p.length;
        winner = p[index];
        winner.transfer(getBalance());
        delete p;
        return winner;
    }
}

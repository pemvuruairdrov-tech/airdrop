// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CronCounter {
    address public owner;
    uint256 public counter;
    uint256 public lastCalled;

    event Ticked(address indexed caller, uint256 newCounter, uint256 timestamp);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function tick() public onlyOwner {
        counter += 1;
        lastCalled = block.timestamp;
        emit Ticked(msg.sender, counter, lastCalled);
    }

    function getInfo() public view returns (uint256, uint256) {
        return (counter, lastCalled);
    }
}

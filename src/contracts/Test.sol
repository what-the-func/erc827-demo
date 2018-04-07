pragma solidity ^0.4.19;

contract Test {
    uint public counter = 0;

    event NewCount(uint);

    function increaseCount() public returns (bool) {
        counter++;
        NewCount(counter);
        return true;
    }
}
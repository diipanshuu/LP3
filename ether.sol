// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract SendEther {
    constructor() payable{}

    receive() external payable {}

    fallback() external payable {}
 
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(10);
    }

    function sendViaSend(address payable _to) public payable {
        bool sent = _to.send(40);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        (bool sent, ) = _to.call{value: 40}("");
        require(sent, "Failed to send Ether");
    }
}

contract ReceiveEther {

    receive() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
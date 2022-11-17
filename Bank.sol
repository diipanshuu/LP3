// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Bank {
    uint totalBalanceOfContract = 0;

    function getContractBalance() public view returns(uint){
        return totalBalanceOfContract;
    }

    mapping(address => uint) public balances;
    mapping(address => uint) depositeTimeStamp;

    function addBalance() public payable{
        balances[msg.sender] = msg.value;
        totalBalanceOfContract = totalBalanceOfContract + msg.value;
        depositeTimeStamp[msg.sender] = block.timestamp;
    }

    function getBalance(address userAddress) public view returns(uint){
        uint principal = balances[userAddress];
        uint timeElapsed = block.timestamp - depositeTimeStamp[userAddress];
        return principal + uint((principal * 7 * timeElapsed)/(100*365*24*60*60))+1;
    }

    function withdraw(uint ammount) public payable{
        address payable withdrawto = payable(msg.sender);
        withdrawto.transfer(ammount);
        totalBalanceOfContract = totalBalanceOfContract - ammount;
        balances[msg.sender] = totalBalanceOfContract;
    }
}
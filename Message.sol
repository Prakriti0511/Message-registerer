// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract MessageRegister{
    struct Message{
        address sender;
        string data;
        uint256 timestamp; 
    }
    Message[] public messages;

    event MessageRegistered(address indexed sender, string data, uint256 timestamp);

    function registerMessage(string calldata data) external{
        require(bytes(data).length>0, "Message is empty!");
        messages.push(Message(msg.sender, data, block.timestamp));
        emit MessageRegistered(msg.sender, data, block.timestamp);
    }
    function getAllMessages() public returns (Message[] memory){
        return messages;
    }
}
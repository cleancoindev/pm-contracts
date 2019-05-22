pragma solidity ^0.4.25;

import 'openzeppelin-solidity/contracts/ownership/Ownable.sol'; 

contract Whitelist is Ownable {

  event UsersAddedToWhitelist(address[] users);
  event UsersRemovedFromWhitelist(address[] users);

  mapping(address => bool) public userWhitelist;

  function addToWhitelist(address[] users) onlyOwner external {
    for (uint i=0; i< users.length; i++) {
      userWhitelist[users[i]] = true;
    }
    emit UsersAddedToWhitelist(users);
  }

  function removeFromWhitelist(address[] users) onlyOwner external {
    for (uint i=0; i< users.length; i++) {
      userWhitelist[users[i]] = false;
    }
    emit UsersRemovedFromWhitelist(users);
  }

  function isWhitelisted(address user) view public returns (bool) {
    return userWhitelist[user];
  }
}

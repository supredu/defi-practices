// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/interfaces/IERC20.sol";

contract Vault {
  IERC20 public immutable token;

  uint public totalSupply;//shares
  mapping(address => uint) public balanceOf;//shares

  constructor(address _token) {
    token = IERC20(_token);
  }

  function _mint(address _to, uint _amount) private {
      balanceOf[_to]+=_amount;
      totalSupply += _amount;
  }

  function _burn(address _from, uint _amount) private {
      balanceOf[_from] -= _amount;
      totalSupply -= _amount;
  }

  function deposit(uint _amount) external {
      require(_amount>0,"amount below than zero");
      token.transferFrom(msg.sender, address(this), _amount);
      _mint(msg.sender, _amount);
  }

  function withdraw(uint _shares) external {
      require(_shares <= balanceOf[msg.sender],"insuffient balance");
      uint256 _amount = _shares*token.balanceOf(address(this))/totalSupply;
      _burn(msg.sender, _shares);
      token.transfer(msg.sender,_amount);
  }


}
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DHL is ERC20, Ownable, ERC20Burnable {
    constructor() ERC20("DHL", "DHL") {
    }
    function mint(address reciever, uint256 amount) public onlyOwner {
        _mint(reciever, amount);
    }
    function _burn(uint256 amount) public onlyOwner {
        burn(amount);
    }
}
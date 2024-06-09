// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GameToken is ERC20, Ownable {

    constructor()
        ERC20("Nikhil", "NK")
    {
        transferOwnership(msg.sender);
    }

    function decimals() public view virtual override returns (uint8) {
        return 0;
    }

    function recharge(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function redeem(address from, uint256 amount) public {
        require(amount <= balanceOf(from), "Insufficient balance to redeem");
        _burn(from, amount);
    }

    function transferFrom(address from, address to, uint256 amount) public override returns (bool) {
        return super.transferFrom(from, to, amount);
    }
}

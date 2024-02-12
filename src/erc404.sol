//SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import {ERC404} from "erc404/ERC404.sol";

contract SampleERC404 is Ownable, ERC404 {
  constructor(
    string memory name_,
    string memory symbol_,
    uint8 decimals_,
    uint256 maxTotalSupplyERC721_,
    address initialOwner_
  ) ERC404(name_, symbol_, decimals_) Ownable(initialOwner_) {
    _setERC721TransferExempt(initialOwner_, true);
    _mintERC20(initialOwner_, maxTotalSupplyERC721_ * units, false);
  }

  function tokenURI(uint256 id_) public pure override returns (string memory) {
    return string.concat("https://example.com/token/", Strings.toString(id_));
  }

  function setERC721TransferExempt(address account_, bool value_) external onlyOwner {
    _setERC721TransferExempt(account_, value_);
  }
}

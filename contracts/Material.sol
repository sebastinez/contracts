// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract Material is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() public ERC721("GameItem", "ITM") {}

    function createItem(address participant)
        public
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(participant, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }

    function checkOwner(uint256 _itemId) public view returns (address) {
        return ownerOf(_itemId);
    }

    function ownerBalance(address _owner) public view returns (uint256) {
        return balanceOf(_owner);
    }
}
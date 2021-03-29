//SPDX-License-Identifier: Unlicense
pragma solidity ^0.7.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFTExample is ERC721, Ownable {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721Full("NFT Name", "SYMBOL")
        public
    {
        //
    }

    function mintNFT(address recipient_, string memory tokenURI_)
        public
        onlyOwner
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient_, newItemId);
        _setTokenURI(newItemId, tokenURI_);

        return newItemId;
    }
}


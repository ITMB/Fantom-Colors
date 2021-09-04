// Contract based on [https://docs.openzeppelin.com/contracts/3.x/erc721](https://docs.openzeppelin.com/contracts/3.x/erc721)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
*/
import "./ERC721.sol";
import "./Counters.sol";
import "./Ownable.sol";
import "./ERC721URIStorage.sol";
import "./ERC721PresetMinterPauserAutoId.sol";

contract fantomColors is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    ///@dev name and shortname can be changed.
    constructor() public ERC721("Fantom Colors", "FTMC") {}

    function mintNFT(address recipient, string memory tokenURI)
        public payable onlyOwner
        returns (uint256)
    {
        ///@dev balance of can be changed so that each address may mint more than one $NFT
        require(balanceOf(msg.sender) == 0, 'Each address may only mint one color');

        ///@dev require that the mint costs something, the amount can be changed. 
        

        ///@dev require that the tokenId is less than number of NFTs to be minted, or else mint will fail. This amount may be changed.
        require(uint256(_tokenIds) <= 100, 'Sorry, all NFTs has been minted' );
       
       ///@dev this increments the token ID, so that each NFT has a unique ID
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}

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
import "./IERC20";

contract fantomColors is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    ///@dev decalre variables
    address private sender = msg.sender;
    address private devWallet = "0x3922B6380867f275d5b49Bb8e2868AB2aF34d358";
    uint256 private nftAmount = 100;
    bool private hasMintingStarted;

    }


    ///@dev name and shortname can be changed.
    constructor() public ERC721("Fantom Colors", "FTMC") {}

    ///@dev structure of being able to call mint function is if all require functions are true they are allowed to mint one.
    function mintNFT(address recipient, string memory tokenURI)
        public payable
        returns (uint256)
    {
        
        ///@dev require that minting has started
        require(hasMintingStarted = true, "Minting has not started")

        ///@dev check that we are not minting more NFTs thant there is in existance
        if(_tokensIds >= nftAmount) {
            pause();
        } 

        ///@dev require that the mint costs something, the amount can be changed. 
        require(transferFrom(msg.sender, devWallet, 10^7 ether))
        if(transferFrom() returns true) {
       
       ///@dev this increments the token ID, so that each NFT has a unique ID
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
        }
    }
}

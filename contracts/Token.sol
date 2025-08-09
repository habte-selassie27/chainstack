// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

import { ERC721URIStorage, ERC721} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
//import { Counter } from "@openzeppelin/contracts/utils/";
import { ERC721Enumerable } from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import { ERC721URIStorage } from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import { Pausable } from "@openzeppelin/contracts/utils/Pausable.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import { ERC721Burnable } from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";


contract EventTicket is ERC721, ERC721Enumerable, ERC721URIStorage, ERC721Burnable, Ownable, Pausable {

   // using Counter for Counters.Counter;

    address public owner;
    uint public maxSupply;
    uint public  totalSupply;
    string public symbol;
    string public name;
    string public eventDetails;
    uint256 public eventDate;
    uint256 public eventTime;

    uint256 public _nextEventTokenId;
    uint256 public currentEventTokenId;

    string public eventURI;
    string public tokenLink;

    constructor (string storage _name, string storage _symbol,uint256 _maxSupply, uint256 _totalSupply) 
     ERC721 ("EventTicket", "ET") {
        symbol = _symbol;
        owner = msg.sender;
        currentEventTokenId = 0;
        _nextEventTokenId = currentEventTokenId + 1;
        totalSupply = _totalSupply;
        maxSupply = _maxSupply;
     }

     function pause() public onlyOwner () {
      _pause();
     }

     function unpause() public onlyOwner {
      _unpause();
     }

     function mint (uint256 _totalSupply) external {
      uint256 tokenId = currentEventTokenId;
      currentEventTokenId++;
      totalSupply = totalSupply + 1;
      _safeMint(msg.sender, tokenId, bytes);
    //   _setTokenURI(tokenId, tokenLink);
      setTokenURI(tokenId,tokenLink);

     }

     function baseURI(string memory tokenLink) public onlyOwner {
        _baseURI(tokenLink);
     }

     function setTokenURI(uint256 tokenId, string memory tokenLink) public onlyOwner {
      _setTokenURI(tokenId, tokenLink);
     }

    //  function tokenURI(uint256 tokenId) public override(ERC721, ERC721URIStorage) onlyOwner {
        
    //  }

      function tokenURINew(uint256 tokenId) 
      public view virtual override(ERC721, ERC721URIStorage)returns (string memory)
    {
        
        return super.tokenURI(tokenId);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
      super._burn(tokenId);
      
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
    internal
    override(ERC721, ERC721Enumerable)  // Declare you're overriding both
    whenNotPaused                       // Pausable modifier - will revert if contract is paused
{
    super._beforeTokenTransfer(from, to, tokenId, batchSize);
}



}
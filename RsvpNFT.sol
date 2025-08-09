// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

import {IERC721Receiver} from '@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol';
import {ERC721} from '@openzeppelin/contracts/token/ERC721/ERC721.sol';

contract Ticket is ERC721 {

    address public owner;
    string public symbol;
    string public name;
    uint256 public nextEventTokenIdToMint;
    uint256 public currentEventTokenId;

    uint public maxSupply;
    // uint public  totalSupply;
    string public eventDetails;
    uint256 public eventDate;
    uint256 public eventTime;

  
    string public eventURI;
    string public tokenLink;

    // token id to owners
    mapping (uint256 => address ) internal _owners;
    // owner to token count
    mapping (address => uint) internal _balances;
    // token id to approved address
    mapping (uint256 => address) internal _tokenApproval;
    // owner to operator approval yes / no 
    mapping (address => mapping (address => bool)) internal _operatorApprovals;
    // token id to token uri
    mapping(uint256 => string) internal _tokenURIs;      
     // to get balance of the contract owner

     constructor() ERC721(string memory _name, string memory _symbol){
        owner = msg.sender;
        name = _name;
        symbol = _symbol;
        nextEventTokenIdToMint = 1;
     }

    event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);
    event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId);
    event ApprovalForAll(address indexed _owner, address indexed _operator, bool _approved);


    function balanceOf(address _owner) external view returns (uint256){
        require(_owner != address(0),"owner address must be non zero address");
        return _balances[_owner];
    }
    // to get the owner of specfic token id
    function ownerOf(uint256 _tokenId) public view returns (address){
        require(_tokenId != 0,"token id must be non zero");
        return _owners[_tokenId];
    }

    // Internal Functions
    function _checkOnERC721Received(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) private returns (bool) {
        // check if it to is an contract , if yes , to.code.length will always > 0
       if(to.code.length > 0) {
          try IERC721Receiver(to).onERC721Received(msg.sender,from,tokenId,data) returns(bytes4 retval) {
            return retval == IERC721Receiver.onERC721Received.selector;
          } catch(bytes memory reason)  {
            if(reason.length == 0){
                revert("ERC721: transfer to non ERC721Receiver implementer");
            } else {
                // @solidity memory-safe-assembly
                assembly {
                    revert(add(32,reason),mload(reason)) 
                }
            }
          }
          
       } else {
        return true;
       }
    }

     // Unsafe transfer
     function _transfer(address from , address to, uint256 tokenId) override virtual internal {
        require(from != address(0),"sender address must be non zero");
        require(to != address(0),"receiver address must be non zero");
        //require(_tokenId != 0,"token id must be positive");
        require(_balances[from] != 0,"sender must have a token to transfer");
        require(_owners[tokenId] == from,"sender must be token owner");
        delete _tokenApproval[tokenId];
        _balances[from] -= 1;
        _balances[to] += 1;
        _owners[tokenId] = to;
        emit Transfer(from, to, tokenId);
     } 

    // to safely transfer token and its metadata to receiver address
    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes memory data) public payable {
        require(_balances[_from] != 0,"sender must have at least one token");
        require(ownerOf(_tokenId) == msg.sender || _tokenApproval[_tokenId] == msg.sender || _operatorApprovals[ownerOf(_tokenId)][msg.sender] ,"!auth problems");
        _transfer(_from, _to, _tokenId);
        require(_checkOnERC721Received(_from,_to,_tokenId,data));


        payable(_from).transfer(_tokenId);
    }
     // to safely transfer token to receiver address
    function safeTransferFrom(address _from, address _to, uint256 _tokenId) public payable {
        safeTransferFrom(_from,_to,_tokenId,"");
    }
   
    // to normally transfer token from owner to receiver address
    function transferFrom(address _from, address _to, uint256 _tokenId) public payable {
        require(ownerOf(_tokenId) == msg.sender || _tokenApproval[_tokenId] == msg.sender || _operatorApprovals[ownerOf(_tokenId)][msg.sender],"!Auth");
        _transfer(_from,_to,_tokenId);
    }
    
    function approve(address _approved, uint256 _tokenId) public payable{
        // frit check if the owner of the token is  the contract holder
        require(ownerOf(_tokenId) == msg.sender,"!owner");
        // then change the address of token approval given to approved address to make it approved 
        //by the owner to sell , burn and transfer the tokken on the behalf of the owner
        _tokenApproval[_tokenId] = _approved;
        emit Approval(msg.sender, _approved, _tokenId);
    }

    function setApprovalForAll(address _operator, bool _approved) public {
        _operatorApprovals[msg.sender][_operator] = _approved;
        emit ApprovalForAll(msg.sender, _operator,_approved);
    }

    function getApproved(uint256 _tokenId) external view returns (address){
        return _tokenApproval[_tokenId];
    }

    function isApprovedForAll(address _owner, address _operator) external view returns (bool){
       return _operatorApprovals[_owner][_operator]; 
    }

    function mintTo(address _to,string memory _tokenUri) public {
        require(owner == msg.sender,"Only Owner can mint");
        _owners[nextEventTokenIdToMint] = _to;
        _balances[_to] += 1;
        _tokenURIs[nextEventTokenIdToMint] = _tokenUri;
        emit Transfer(msg.sender, _to,nextEventTokenIdToMint); 
        nextEventTokenIdToMint += 1; 
    }

    function tokenUri(uint256 _tokenId) public view override  returns(string memory) {
        return _tokenURIs[_tokenId];
    }

    function totalSupply() public view returns(uint256){
        return nextEventTokenIdToMint;
    }

}
// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

 contract Tet {
     string public name = "Tet Toen";
     string public symbol = "Tet";
     uint256 public ecim = 10**18;
     uint256 public  totalSupply;

     address owner;

     bool  paused;


     constructor() {
        owner = msg.sender;
        paused = false;
        balanceOf[owner] = 2000;
     }

     mapping (address => mapping (address => uint256 )) public allowance;
     mapping (address => uint256) public balanceOf;
     mapping(address => bool) public blacklist;
     mapping(address => bool) public whitelist;

     event Transfer(address indexed from, address indexed to,uint256 value);
     event Approval(address indexed owner, address indexed spender,uint256 value);

      modifier onlyOwner () {
        require(msg.sender == owner,"only owner can call This Function");
        _;
     }

     modifier whenNotPaused() {
        require(!paused , "paused state");
        _;
     }

    //  modifier _NotOnBlacklist(address _peron){
    //    require(_peron != blacklist[_peron]);
    //    _;
    //  }
    //  function getownceOfUser(address _user) public view returns (uint256) {
    //   uint totalallowance += allowance[msg.sender][_user];
    // }
    
    // function balanceOfUser(address _user) public returns (uint256) {
    //   return  balanceOf[_user] ;
    // }

    //  function balanceOfOwner() public view returns (uint256) {
    //   return  balanceOf[owner] ;
    // }

    // function balanceOfOwner1() public view returns (uint256) {
    //   return balanceOf[msg.sender] ;
    // }

    // function balanceOfOwner2() public view returns (uint256) {
    //   return owner.balance / ecim;
    // }


    // function Owner1() public view returns (address) {
    //   return msg.sender;
    // }

    // function Owner2() public view returns (address) {
    //   return owner;
    // }


    //  function transfer(address to, uint value)  public returns (bool)  {
    //     require(balanceOf[msg.sender] > value,"ow bnce");
    //     require(blacklist[to] == false,"no not on blacklist");
    //     require(paused ==false,"is not pused");
    //     require(whitelist[to] == true,"Not On The White List To Recieve The Token");
    //     balanceOf[to] += value;
    //     balanceOf[msg.sender] -= value;
    //     emit Transfer(msg.sender,to,value);
    //     return true;
    //  }

//      function approve(address _spender,uint256 value) external returns (bool){
//       require(msg.sender != _spender,"cant be same");
//       require( balanceOf[msg.sender] > value,"No Bnce");
//       allowance[msg.sender][_spender] = value;
//       balanceOf[msg.sender] -= value;
//       emit Approval(msg.sender,_spender,value);
//        return true;
//      }

// function allowance2(address _spender,uint256 value) external view  returns (uint256){
//       //allowance[msg.sender][_spender] = value;
//       uint256 _allowance = allowance[msg.sender][_spender];
     
//        return _allowance;
//      }

// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
// 100000000000000000

    //  function transferFrom(address from, address to, uint value) public returns (bool) {
    //    require(balanceOf[from] > value,"ow bnce");
    //    require(whitelist[to] == true,"Not On The White List To Recieve The Token");
    //    require(!blacklist[from]  && !blacklist[to] ,"no not on blck");
    //    require(value > 0,"value mut be potive");
    //    require(paused ==false,"is not pused");
    //    require(allowance[from][to] > value,"mount mut be greter thn vue");
    //    allowance[from][to] -= value;
    //    balanceOf[from] -= value;
    //    balanceOf[to] += value;
    //    emit Transfer(from,to,value);
    //  } 

    //  function mint(address to, uint value) public {
    //     require(msg.sender == owner,"ony owner cn mint");
    //    // require(balanceOf[msg.sender] > value,"No Bnce");  
    //    balanceOf[msg.sender] -= value;
    //     totalSupply += value;
    //     balanceOf[to] += value;
    //     emit Transfer(address(0), to, value);
    //  }

    //  function burn ( uint value) public {
    //    require(balanceOf[msg.sender] > value,"Not Enough Bnce");
    //    require(totalSupply > value ,"can not  be zero");
    //    totalSupply -= value;
    //    balanceOf[msg.sender] -= value;
    //    emit Transfer(msg.sender, address(0), value);  
    //  }

    

    //  function pause() public onlyOwner returns(bool){
    //     paused = true;
    //  }

    //  function unpause() public onlyOwner returns(bool){
    //     paused = false;
    //  }

//      ✅ 1️⃣ Pausing
// Concept:

// Add a paused state variable (true or false).

// Before allowing transfers, check that paused is false.

// Add functions to set paused to true/false, callable only by the owner or admin.


// ✅ 2️⃣ Blacklisting
// Concept:

// Use a mapping to keep track of blacklisted addresses (address => bool).

// Before transfers, check that neither the sender nor receiver is blacklisted.

// Add admin functions to add/remove addresses from the blacklist.

//mapping(address => bool) public blacklist;

/*
address[] public blackListedAddresses;

function addBlacklist(address _user) external  returns(address[] memory) {
   blacklist[_user] = true;
   blackListedAddresses.push(_user); 
   return blackListedAddresses;
}

function removeBlacklist(address _user) external returns(address[] memory) {
    blacklist[_user] = false;
    delete blackListedAddresses[blackListedAddresses.length-1];
    //blackListedAddresses.pop();
    return blackListedAddresses;
}

function isBlacklisted(address _user) external view returns(bool) {
  return blacklist[_user];
}
function getBlackListedUsers() external view returns(address[] memory) {
  return blackListedAddresses;
}


*/
// ✅ 3️⃣ Whitelisting
// Concept:

// Similar to blacklist, but opposite: track allowed addresses only.

// Before transfers or certain actions, ensure the address is in the whitelist.

// Add admin functions to manage the list.

//mapping(address => bool) public whitelist;
/*address[] public whiteListedAddresses;

function addToWhitelist(address _user) public onlyOwner returns(address[] memory) {
   whitelist[_user] = true;
   whiteListedAddresses.push(_user); 
   return whiteListedAddresses;
}

function removeFromWhitelist(address _user) public onlyOwner returns(address[] memory) {
   whitelist[_user] = false;
   delete whiteListedAddresses[whiteListedAddresses.length-1];
   //whiteListedAddresses.pop(_user); 
   return whiteListedAddresses;
}

function isWhitelisted(address _user) external view returns(bool) {
  return whitelist[_user];
}

*/
//🚀 WOW! Love the enthusiasm — let’s make this a supercharged learning list.

//You asked to extend the list to 15 advanced ERC token features, so you can deeply understand all the possibilities and build a strong foundation.

//Here we go!

//💎 🔥 Advanced ERC token features — Full conceptual list (15 features!)
// ✅ 1️⃣ Pausing
// Concept:

// Temporarily stop all transfers or certain actions (for emergencies).

// Controlled by an admin or owner.


// ✅ 4️⃣ Roles & permissions
// Concept:

// Create multiple roles (Minter, Pauser, Admin, etc.).

// Give each role different powers.

// Use OpenZeppelin's AccessControl.

// 🟣 3️⃣ Decide the data structure to store roles
// 💡 Conceptually
// You need to map addresses to roles.

// In Solidity, this is usually done using mappings or a special access structure.

// Example conceptual data structure:

// scss
// Copy
// Edit
// mapping(address => set of roles)
// or

// pgsql
// Copy
// Edit
// mapping(bytes32 role => mapping(address => bool))
// Each role is a unique identifier (like a badge or tag).

// Each role points to a list of addresses that "own" that badge.

//address[] addresses;

enum Role {Admin, Minter , Pauser}

struct RoleData{
//  bytes32 role;
   address user;
   bool isGranted;
   bool isRevoked;
   Role roleType;
   string roleName;
}

RoleData roledata;
//Role public userRole;
//address[] public addresses;

mapping(address => mapping(Role => bool)) public _hasRole;
mapping(address => Role) public _roles;
mapping(address => mapping(address => uint)) public _role;
mapping(address => RoleData) public _userRoleData; 
address[] public userroles;


modifier onlyAdmin(address _admin, Role role)  {
  require(_roles[_admin] == Role.Admin,"Ony administrator can call");
  require(_hasRole[_admin][Role.Admin],"Only Admins Can Call This Function");
  _;
} 

modifier  onlyMinter(address _minter, Role role) {
  require(_roles[_minter] == Role.Admin,"Ony administrator can call");
  require(_hasRole[_minter][Role.Minter] != false,"Only Role Holder Can Mint The Tokens");
  _;
} 

modifier onlyPauser (address _pauser, Role role) {
  require(_roles[_pauser] == Role.Admin,"Ony administrator can call");
  require(_hasRole[_pauser][Role.Pauser]);
  _;
} 

function setAdmin99(address _admin) public  {
  _roles[_admin] = Role.Admin;
  _hasRole[_admin][_roles[_admin]] = true;
   roledata.roleName = "Admin";
  //return  (_roles[_admin] , _admin);
}

function getAdmin99(address _admin) public view returns(Role,address,bool,string memory) {
  return  (_roles[_admin] , _admin, _hasRole[_admin][_roles[_admin]],roledata.roleName);
}
// 🔵 4️⃣ Design functions needed
// ✨ Grant role function
// Purpose: Allow an admin to give a role to an address.
//0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
//0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
//0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
 
 //Role role, Role role1

// Concept: "Give this badge to this person."
function grantRole(address _admin, address _minter,address _pauser,Role role ) 
 public onlyAdmin(_admin,role ) returns(address,Role,bool)
 {
  require(_roles[_admin] == Role.Admin,"Only administrator can call");
  require(_roles[_minter] != Role.Minter,"Minter Can Not Grant Himself role");
  require(_roles[_pauser] != Role.Pauser,"Pauser Can Not Grant Himself Role");
  require(roledata.isGranted == false,"Already Granted This Role");
  _userRoleData[_minter].user = _minter;
  _userRoleData[_pauser].user = _pauser;

 // if (_userRoleData[_minter].user ==_minter) {
   _roles[_minter] = role;
   _hasRole[_admin][_roles[_minter]] = true;
   _userRoleData[_minter].isGranted = true;
   _userRoleData[_minter].roleName = "Minter";
   _userRoleData[_minter].roleType =  role;
   

  //  if(_userRoleData[_pauser].user ==_pauser) {
   //_roles[_pauser] = Role.Pauser;
   _hasRole[_admin][_roles[_pauser]] = true;
   _userRoleData[_pauser].isGranted = true;
   _userRoleData[_pauser].roleName = "Pauser";
    _userRoleData[_pauser].roleType = Role.Pauser;

   return (_userRoleData[_pauser].user,_userRoleData[_pauser].roleType ,_hasRole[_admin][_roles[_pauser]]);
  //return (_userRoleData[_minter].user,_userRoleData[_minter].role ,_hasRole[_admin][_roles[_minter]]);
  
/*
// _roles[_minter] = Role.Minter;
  //_role[_admin][_minter] = Role.Minter;
 // _userRoleData[_minter] = Role.Minter;
  // _hasRole[_minter][_roles[_minter]] = true;
  // _userRoleData[_minter].isGranted = true;
  //roledata.user
  //_userRoleData[_minter].user
*/
 }



// function grantRoleToPauser(address _admin,address _pauser, Role _role ) 
//  public onlyAdmin(_admin, _role) returns(address,Role,bool)
//  {
//   require(_roles[_admin] == Role.Admin,"Ony administrator can call");
//   //require(_roles[_minter] != Role.Minter,"Minter Can Not Grant Himself role");
//   require(_roles[_pauser] != Role.Pauser,"Pauser Can Not Grant Himself Role");
//   require(roledata.isGranted == false,"Already Granted This Role");
 
//  // _userRoleData[_minter].user = _minter;
//   _userRoleData[_pauser].user = _pauser;

//  if(_userRoleData[_pauser].user ==_pauser) {
//    _roles[_pauser] = Role.Pauser;
//    _hasRole[ _admin][_roles[_pauser]] = true;
//    _userRoleData[_pauser].isGranted = true;
//    _userRoleData[_pauser].roleName = "Pauser";
//     _userRoleData[_pauser].role = Role.Pauser;
//    return (_userRoleData[_pauser].user,_userRoleData[_pauser].role ,_hasRole[_admin][_roles[_pauser]]);
//   }

//  }


// ✨ Revoke role function
// Purpose: Allow an admin to remove a badge from an address.

// Concept: "Take away this badge if they misbehave or no longer need it."
function revokeRole(address _admin , address _minter, address _pauser, Role role)
 public returns(address,Role, bool) {
  
   require(_roles[_admin] == Role.Admin,"Only administrator can call"); 
   // first check if the user role is not revoked
   _userRoleData[_minter].user = _minter;
  _userRoleData[_pauser].user = _pauser;

   if (roledata.isRevoked) {
    _roles[_minter] = Role.Minter;
    _hasRole[_admin][_roles[_minter]] = true;
   _userRoleData[_minter].isGranted = true;
   _userRoleData[_minter].isRevoked = false;
   _userRoleData[_minter].roleName = "Minter";
   _userRoleData[_minter].roleType =  Role.Minter;
   } else {
   delete _roles[_minter] = Role.Minter;
    _hasRole[_admin][_roles[_minter]] = false;
   _userRoleData[_minter].isGranted = false;
   _userRoleData[_minter].isRevoked = true;
   _userRoleData[_minter].roleName = "None";
   _userRoleData[_minter].roleType =  Role.None;
   }

 }

// ✨ Renounce role function
// Purpose: Allow an address to give up their own role voluntarily.

// Concept: "I don’t want this badge anymore (e.g., for safety reasons)."

// ✨ Check role function
// Purpose: Check if a given address has a specific role.

// Concept: "Verify if someone has the badge before they do an action."

// ✨ Restrict access in other functions
// Purpose: Before executing sensitive logic (like minting), check that msg.sender has the required role.

// Concept: "Show badge before entering a restricted area."



// struct roleInfo {
//   mapping(address => bool) hasRole;
// }


// ✅ 5️⃣ Governance & voting
// Concept:

// Token holders can vote on proposals, upgrades, or community decisions.

// Votes often weighted by token balance.

// ✅ 6️⃣ Transfer fees / tax
// Concept:

// Deduct % fees on transfers.

// Funds can go to treasury, rewards, or be burned to reduce supply.

// ✅ 7️⃣ Redemptions & utility burns
// Concept:

// Users burn tokens to redeem perks (e.g., NFTs, physical items, game items).

// Creates demand and reduces supply.

// ✅ 8️⃣ Staking & rewards
// Concept:

// Lock tokens for a period to earn rewards (yield farming, governance power, etc.).

// Encourages holding and community loyalty.

// ✅ 9️⃣ Snapshot voting power
// Concept:

// Capture token balances at a certain block.

// Prevents manipulation by moving tokens right before a vote.

// ✅ 🔟 Bridging & cross-chain support
// Concept:

// Move tokens between blockchains (e.g., Ethereum ↔ Polygon).

// Involves locking & minting or burning & minting mechanisms.

// ✅ 1️⃣1️⃣ Upgradability (Proxy patterns)
// Concept:

// Let you upgrade your contract logic without losing data.

// Useful for fixing bugs or adding features after deployment.

// Often done using proxies (e.g., OpenZeppelin Transparent Proxy).

// ✅ 1️⃣2️⃣ Meta-transactions (gasless UX)
// Concept:

// Users sign messages off-chain, and a relayer submits them on-chain (pays gas).

// Improves user experience (users don’t need ETH to pay gas).

// Popular in games and social apps.

// ✅ 1️⃣3️⃣ Permit (EIP-2612)
// Concept:

// Allow approvals (ERC-20 approve) to be done with a signed message (without on-chain transaction).

// Saves gas and simplifies UX.

// ✅ 1️⃣4️⃣ Time-locks
// Concept:

// Restrict when certain tokens can be transferred or withdrawn (e.g., team vesting, investor lockups).

// Prevent early dumping.

// ✅ 1️⃣5️⃣ Dividend distribution
// Concept:

// Automatically distribute ETH, stablecoins, or other tokens to holders based on their balances.

// Similar to shares paying dividends.

// Often called "reflection tokens" when dividends are paid in same token.



 }
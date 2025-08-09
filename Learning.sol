// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

//import hardhat/console.sol 

 contract Learning  {
    //  string public name = "Tet Toen";
    //  string public symbol = "Tet";
    //  uint256 public ecim = 10**18;
    //  uint256 public  totalSupply;

    //  address owner;

    //  bool  paused;


    //  constructor() {
    //     owner = msg.sender;
    //     paused = false;
    //     balanceOf[owner] = 2000;
    //  }

    //  mapping (address => mapping (address => uint256 )) public allowance;
    //  mapping (address => uint256) public balanceOf;
    //  mapping(address => bool) public blacklist;
    //  mapping(address => bool) public whitelist;

    //  event Transfer(address indexed from, address indexed to,uint256 value);
    //  event Approval(address indexed owner, address indexed spender,uint256 value);

    //   modifier onlyOwner () {
    //     require(msg.sender == owner,"only owner can call This Function");
    //     _;
    //  }

    //  modifier whenNotPaused() {
    //     require(!paused , "paused state");
    //     _;
    //  }

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

enum Role {None,Admin, Minter , Pauser}

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

mapping(address => bool) public _checkole;
mapping(address => mapping(Role => bool)) public _hasRoleGivenByAdmin;
mapping(address => Role) public _roles;
//(address => mapping(address => uint)) public _role;
mapping(address => RoleData) public _userRoleData; 
address[] public userroles;


modifier onlyAdmin(address _admin, Role role)  {
  require(_roles[_admin] == Role.Admin,"Ony administrator can call");
  //require(_hasRoleGivenByAdmin[_admin][Role.Admin],"Only Admins Can Call This Function");
  require(_checkole[ _admin],"Only Admins Can Call This Function");
  _;
} 

modifier  onlyMinter(address _minter, Role role) {
  require(_roles[_minter] == Role.Minter,"Caller is not a minter");
  require(_hasRoleGivenByAdmin[_minter][Role.Minter] != false,"Caller does not have minter role granted by admin");
  require(_checkole[_minter] ,"Caller does not have minter role granted by admin");
  _;
} 

modifier onlyPauser (address _pauser, Role role) {
  require(_roles[_pauser] == _userRoleData[_pauser].roleType,"Caller is not a pauser");
 // require(_hasRoleGivenByAdmin[_pauser][_roles[_pauser]],"Caller does not have pauser role granted by admin");
  require(_checkole[_pauser],"Caller does not have pauser role granted by admin");

  _;
} 

// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4

function setAdmin99(address _admin, Role role) public 
//onlyAdmin(_admin,role )
 returns(address,Role,bool)  {
    require(role == Role.Admin,"Role must be admin only");
    require(role != Role.Minter,"The role cannot be assigned as Minter");
    require(role != Role.Pauser,"The role cannot be assigned as Pauser");
    require(_userRoleData[_admin].roleType != role,"admin have an already assigned role");
    //require(uint8(role) < 4 || uint8(role) >= 0,"There is No Role Type for this Type of role number" );
    require(role >= Role.None && role <= Role.Pauser  ,"There is No Role Type for this Type of role number" );

//   _roles[_admin] = Role.Admin;
  if (role == Role.Admin) {
    _roles[_admin] = role;
   _checkole[_admin] = true;
   _hasRoleGivenByAdmin[_admin][_roles[_admin]] = true;
    // roledata.roleName = "Admin";
    // roledata.roleType = role;
   _userRoleData[_admin].isGranted = true;
   _userRoleData[_admin].roleName = "Admin";
   _userRoleData[_admin].roleType =  role;
   _userRoleData[_admin].user = _admin;
  //return  (_roles[_admin] , _admin);
  } else {
    return (_userRoleData[_admin].user,_userRoleData[_admin].roleType ,_hasRoleGivenByAdmin[_admin][_roles[_admin]]);
  }
   
  
  // _hasRoleGivenByAdmin[_admin][_roles[_minter]] = true;
//    _userRoleData[_minter].isGranted = true;
//    _userRoleData[_minter].roleName = "Minter";
//    _userRoleData[_minter].roleType =  role;
}

function getAdmin99(address _admin) public view returns(Role,address,bool,string memory) {
  return  (_roles[_admin] , _admin, _hasRoleGivenByAdmin[_admin][_roles[_admin]],roledata.roleName);
}
// 🔵 4️⃣ Design functions needed
// ✨ Grant role function
// Purpose: Allow an admin to give a role to an address.
//0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
//0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
//0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
 
 //Role role, Role role1


// Concept: "Give this badge to this person."
// address _minter,
//Role role,
//Role role,
function grantRole(address _admin,address _pauser, Role role1 ) 
 public onlyAdmin(_admin,role1 ) returns(address,Role,bool)
 {
  require(_roles[_admin] == Role.Admin,"Only administrator can call");
  //require(_roles[_minter] != Role.Minter,"Minter Can Not Grant Himself role");
  require(_roles[_pauser] != Role.Pauser,"Pauser Can Not Grant Himself Role");
  require(roledata.isGranted == false,"Already Granted This Role");
  require(!_userRoleData[_pauser].isGranted ,"Grant has already been given; it can only be granted once");
  //_userRoleData[_minter].user = _minter;
  _userRoleData[_pauser].user = _pauser;

 // if (_userRoleData[_minter].user ==_minter) {
  //  _roles[_minter] = role;
  //  _checkole[_minter] = true;
  //  _hasRoleGivenByAdmin[_admin][_roles[_minter]] = true;
  //  _userRoleData[_minter].isGranted = true;
  //  _userRoleData[_minter].roleName = "Minter";
  //  _userRoleData[_minter].roleType =  role;
   

  //  if(_userRoleData[_pauser].user ==_pauser) {
  // _roles[_minter] = role;
   _roles[_pauser] = role1;
   _checkole[_pauser] = true;
   _hasRoleGivenByAdmin[_admin][_roles[_pauser]] = true;
   _userRoleData[_pauser].isGranted = true;
   _userRoleData[_pauser].roleName = "Pauser";
   _userRoleData[_pauser].roleType = role1;

   return (_userRoleData[_pauser].user ,_userRoleData[_pauser].roleType,_hasRoleGivenByAdmin[_admin][_roles[_pauser]]);
 // _userRoleData[_minter].roleType
  //return (_userRoleData[_minter].user,_userRoleData[_minter].role ,_hasRole[_admin][_roles[_minter]]);

 }
// ✨ Revoke role function
// Purpose: Allow an admin to remove a badge from an address.
 //address _minter,
// Concept: "Take away this badge if they misbehave or no longer need it."
function revokeRole(address _admin , address _pauser,Role role)
 public onlyAdmin(_admin ,role) returns(address,Role, bool) {
  
   require(_roles[_admin] == Role.Admin,"Only administrator can call"); 
  // require(_hasRoleGivenByAdmin[ _admin][_roles[_minter]] == true,"No Role Is Given To Minter To Revoke it" );
   // first check if the user role is not revoked
   require(_hasRoleGivenByAdmin[ _admin][_roles[_pauser]] ==true,"No Role Is Given To Pauser To Revoke it" );
  // require(!_checkole[_minter],"Minter Has Not Granted  Role");
   //require(!_checkole[_pauser],"Pauser Has Not Granted  Role");
  // require(_userRoleData[_minter].isGranted == true,"The minter role has never been granted");
   require(_userRoleData[_pauser].isGranted == true,"The minter role has never been granted");
  
   //require(_userRoleData[_minter].isRevoked == false,"The minter role has already been revoked");
   require(_userRoleData[_pauser].isRevoked == false,"The pauser role has already been revoked");


  //_userRoleData[_minter].user = _minter;
  _userRoleData[_pauser].user = _pauser;

//    if (roledata.isRevoked) {
//     _roles[_minter] = Role.Minter;
//    _hasRoleGivenByAdmin[_admin][_roles[_minter]] = true;
//    _userRoleData[_minter].isGranted = true;
//    _userRoleData[_minter].isRevoked = false;
//    _userRoleData[_minter].roleName = "Minter";
//    _userRoleData[_minter].roleType =  Role.Minter;
//    } else {
  //   delete _roles[_minter]; 
  //  _hasRoleGivenByAdmin[_admin][_roles[_minter]] = false;
  //  _userRoleData[_minter].isGranted = false;
  //  _userRoleData[_minter].isRevoked = true;
  //  _userRoleData[_minter].roleName = "None";
  //  _checkole[_minter] = false;
  //  delete _userRoleData[_minter].roleType ;
   
   // for pauser
    delete _roles[_pauser]; 
   _hasRoleGivenByAdmin[_admin][_roles[_pauser]] = false;
   _userRoleData[_pauser].isGranted = false;
   _userRoleData[_pauser].isRevoked = true;
   _userRoleData[_pauser].roleName = "None";
     _checkole[_pauser] = false;
   delete _userRoleData[_pauser].roleType ;
   

 }


/*
// _roles[_minter] = Role.Minter;
  //_role[_admin][_minter] = Role.Minter;
 // _userRoleData[_minter] = Role.Minter;
  // _hasRole[_minter][_roles[_minter]] = true;
  // _userRoleData[_minter].isGranted = true;
  //roledata.user
  //_userRoleData[_minter].user
*/
 



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



// ✨ Renounce role function
// Purpose: Allow an address to give up their own role voluntarily.
// Concept: "I don’t want this badge anymore (e.g., for safety reasons)."

// function renounceMinterRole(address _minter,Role role)
//  public onlyMinter(_minter ,role) returns(address,Role, bool) {
//    require(_roles[_minter] == Role.Minter,"Only administrator can call"); 
//    require(_hasRoleGivenByAdmin[ _minter][_roles[_minter]] == true,"No Role Is Given To Minter To Revoke it" );
//    // first check if the user role is not revoked
//   // require(_hasRoleGivenByAdmin[_minter][_roles[_pauser]] ==true,"No Role Is Given To Pauser To Revoke it" );
//   // require(!_checkole[_minter],"Minter Has Not Granted  Role");
//    //require(!_checkole[_pauser],"Pauser Has Not Granted  Role");
//    require(_userRoleData[_minter].isGranted == true,"The minter role has never been granted");
// //    require(_userRoleData[_pauser].isGranted == true,"The minter role has never been granted");
//    require(_userRoleData[_minter].isRevoked == false,"The minter role has already been revoked");
//    //require(_userRoleData[_pauser].isRevoked == false,"The pauser role has already been revoked");


//   _userRoleData[_minter].user = _minter;
 
//     delete _roles[_minter]; 
//    _hasRoleGivenByAdmin[_minter][_roles[_minter]] = false;
//    _userRoleData[_minter].isGranted = false;
//    _userRoleData[_minter].isRevoked = true;
//    _userRoleData[_minter].roleName = "None";
//    _checkole[_minter] = false;
//    delete _userRoleData[_minter].roleType ;
   
   
 // _userRoleData[_pauser].user = _pauser;

//    if (roledata.isRevoked) {
//     _roles[_minter] = Role.Minter;
//    _hasRoleGivenByAdmin[_admin][_roles[_minter]] = true;
//    _userRoleData[_minter].isGranted = true;
//    _userRoleData[_minter].isRevoked = false;
//    _userRoleData[_minter].roleName = "Minter";
//    _userRoleData[_minter].roleType =  Role.Minter;
//    } else {  

 //}

//0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
//0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
//0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
 

function renouncePauserRole(address _pauser,Role role)
 public onlyPauser(_pauser ,role) returns(address,Role, bool) {
  
  // require(_roles[_pauser] ==_userRoleData[_pauser].roleType ,"Only pauser can call"); 
  // require(_hasRoleGivenByAdmin[_pauser][_roles[_pauser]] == true,"No Role Is Given To Minter To Revoke it" );
   // first check if the user role is not revoked
  // require(_hasRoleGivenByAdmin[_pauser][_roles[_pauser]] == true,"No Role Is Given To Pauser To Revoke it" );
  // require(!_checkole[_minter],"Minter Has Not Granted  Role");
   //require(!_checkole[_pauser],"Pauser Has Not Granted  Role");
  // require(_userRoleData[_minter].isGranted == true,"The minter role has never been granted");
   require(_userRoleData[_pauser].isGranted == true,"The pauser role has never been granted");
   //require(_userRoleData[_minter].isRevoked == false,"The minter role has already been revoked");
   require(_userRoleData[_pauser].isRevoked == false,"The pauser role has already been revoked");
//  _userRoleData[_minter].user = _minter;
   _userRoleData[_pauser].user = _pauser;
   // for pauser
    delete _roles[_pauser]; 
   _hasRoleGivenByAdmin[_pauser][_roles[_pauser]] = false;
   _userRoleData[_pauser].isGranted = false;
   _userRoleData[_pauser].isRevoked = true;
   _userRoleData[_pauser].roleName = "None";
   _checkole[_pauser] = false;
   delete _userRoleData[_pauser].roleType;

 }








// ✨ Check role function
// Purpose: Check if a given address has a specific role.

// Concept: "Verify if someone has the badge before they do an action."

function checkRole(address _user) public view returns(address, bool,bool,Role,string memory ) {
    if (_checkole[_user]) {
      return (_userRoleData[_user].user,_userRoleData[_user].isGranted ,
       _hasRoleGivenByAdmin[_user][_roles[_user]],
       _userRoleData[_user].roleType , _userRoleData[_user].roleName);
    } else {
      return (_userRoleData[_user].user,_userRoleData[_user].isGranted ,
       _hasRoleGivenByAdmin[_user][_roles[_user]],
       _userRoleData[_user].roleType , _userRoleData[_user].roleName);
    }
}



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

///// propojklasjklsal
// upgrades
// community decisions
// vote 
// vote status 
// 
function stringToBytes(string calldata _string) public pure returns(bytes memory){
  return abi.encodePacked(_string);
}
mapping(uint256 => string) public statusDescription;

// struct Task {
//   bytes32 state;
// }

struct Task {
 string state;
}

mapping(uint => Task) public tasks;

// uint[] public _tasks;

// Task public taskData;

// taskData[] public tasks;

//Task[] public tasks;

uint[] public taskIDs;

function createTask(uint _taskId, string memory newState) public returns(Task memory,uint){
 // require( tasks[_taskId].state.length  == 0 ,"Task Already Exists");
  tasks[_taskId] = Task({
    state : newState
  });
  taskIDs.push(_taskId);
 return (tasks[_taskId],taskIDs.length);
}

function getTotalTask() public view returns(uint) {
  return taskIDs.length;
}
// function setTaskState(uint taskId,string memory newState) external {
//   tasks[taskId].state = newState;
// }

// function setStatusDescription(string memory _status,uint _id) public returns(string memory){
//   statusDescription[_id] = _status;
// }

// hadvancellocalstate
// approveOrder
// getStatusInt
// getLocalStateInt

enum Status { Pending, Approved, Rejected }

struct Order {
  uint256 id;
  // uint enum LocalState { Created, Paid, Shipped }
  // LocalState localState;
  Status status;
}

Order public order;

constructor() {
  order.id = 1;
  //order.localState = Order.LocalState.Created;
  order.status = Status.Pending;
}


// function advanceLocalState() external {
//   require(order.localState == order.LocalState.Shipped,"Already Shipped");
//   if (order.localState == order.LocalState.Created) {
//     order.localState = order.LocalState.Paid;
//   } else if(order.localState == order.LocalState.Paid) {
//     order.localState = order.LocalState.Shipped;
//   }
// }

function approveOrder() external {
  order.status = Status.Approved;
}

function getStatusInt() external view returns(uint){
  return uint(Status.Approved);
}

function getStatus() external view returns(Status){
  return order.status;
}
// function getLocalStateInt() external view returns(uint){
//  return uint(order.localState);
// }

// ✅ 6️⃣ Transfer fees / tax
// Concept:

// Deduct % fees on transfers.

// Funds can go to treasury, rewards, or be burned to reduce supply.

// ✅ 7️⃣ uint enum LocalState { Created, Paid, Shipped }uint enum LocalState { Created, Paid, Shipped }Redemptions & utility burns
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
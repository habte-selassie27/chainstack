// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Vote {
    address owner;

    constructor() {
      owner = msg.sender; 
    }

    enum Status{None, Open, Closed}

    struct Proposal {
        uint id;
        string name;
        string desc;
        uint deadline;
        uint voteCount;
        bool yes;
        bool no;
        Status status;   
    }

    Status public status;

    Proposal public proposal;
    // to track proposals we can use two types of mehod
    // first array if we want our proposal to be iterated for data retrival or or sequential
    Proposal[] public proposals;
    // second we can use single mappings to track or find proposals based on user address or id 
    // or other things
    mapping(address => Proposal) proposalPerUser;

    mapping(uint => Proposal) proposalPerId;
    // to check if the user has a voting activity for specfic proposal
      // user => proposal id => vote
     mapping(address => mapping(uint => bool) ) hasVoted;
     // voter can vote only once per proposal
     // user => vote type => vote frequency
     mapping(address => mapping(bool => uint)) votesPerUser;
     // vote is either yes or no 
     // //get voting status , has voter voted? what did they vote?

     /// user => proposal => what they vote yes/no bool
     mapping(address => mapping(uint => Proposal)) userVote;

     modifier beforeDeadline(){
        require(proposal.deadline < block.timestamp,"Voting is already closed");
        _;
     }

     modifier onlyOwner(address _user){
        require(_user == msg.sender,"only owner can perform the tasks" );
        _;
     }

uint[] public op;



     function timeStampToDateTimeStamp(uint timeStamp) private 
       returns(uint year, uint month, uint date,uint hour,uint minute,uint second) {
         second = timeStamp * 86400;
         minute = 60 * second;
         hour = 60 * minute;
         date = 24 * hour;
         month = 30 * date;
         year = 12 * month;
       return(year,month,date,hour,minute,second);
     }

    function createProposals( uint _id,string memory _name,string memory _desc, uint _deadline) 
        external onlyOwner(owner)  returns(Proposal memory){
            // unique id for each proposal but at first must be zero before creating the first proposal
            require(_id != 0,"proposal id is zero and invalid");
            require(_id != proposal.id,"Proposal ID Already Exists");
            // check the deadline not to pass some criterias or late before current time
            require(_deadline > block.timestamp,"deadline cannot be in past time passed");
            // voteCount must  be zero for new proposals
            require(proposal.voteCount == 0, "already voted");
            // i think it is cool for the proposal status to be different than that of open or closed
            require(proposal.status == Status.None,"proposal already exists");
            // user must not have voting activity for specfic proposal
           // require(hasVoted[msg.sender][_id] == false,"user already vote");

            Proposal memory newProposal = Proposal({
                id : _id,
                name : _name,
                desc :_desc,
                deadline : _deadline,
                voteCount:0,
                yes : false,
                no: false,
               status: Status.Open
            });
           proposals.push(newProposal);
            return newProposal;
       }
        
       // to extend or shorten proposal deadlines 1 using utily function 
       // but we can also create it before depolyment but since that is permanent it is not feasible
       function extendProposals(uint _newDeadLineTime) external onlyOwner(owner) returns(uint) {
          require(_newDeadLineTime > block.timestamp,"the deadline can not be in past time");
          proposal.deadline = _newDeadLineTime;
          return proposal.deadline;
       }

       function closeProposals() external returns(bool){
         proposal.status = Status.Closed;
        return true;
       }

       // get total number of proposals
       function getTotalNumberOfProposal() external view returns(uint){
        return proposals.length;   
       }

       // get all data of a specfic proposal by ID
       function getProposalDataById(uint _id) external view returns(Proposal memory) {
         return proposalPerId[_id];
       }

       function voteByAddress(address user, uint proposalID, bool choice) external {
        // check address for zero address
        require(user != address(0),"zero address can not be able to vote");
        // check for double voting not to happen
        require(votesPerUser[user][choice] < 2,"double voting is not allowed");
        require(userVote[user][proposalID].voteCount < 2,"double voting is not allowed");
        // check for proposal existence
        //require(proposalPerId[proposalID] != 0,"proposal does not exist");
        require(proposals.length > 0 ,"proposal does not exist");
        // check for choice either yes or no both is not allowed
        require(!hasVoted[user][proposalID],"uer rey vote");
        // 
       userVote[user][proposalID] = Proposal({
         id : proposal.id,
         name : proposal.name,
         desc : proposal. desc,
         deadline : proposal. deadline,  
         voteCount : 1,
         yes : choice,
         no : choice,
         status :Status.Closed  
       });
    // proposals[].length;
      }
     
     

       //get voting status , has voter voted? what did they vote?
       function getVoteStatus(uint _id) external view returns(bool,uint){
         hasVoted[msg.sender][_id];
         votesPerUser[msg.sender][proposal.yes];
         votesPerUser[msg.sender][proposal.no];
         proposalPerUser[msg.sender];
         userVote[msg.sender][_id];
         //
       }
       //get current proposal results e.g yes vs no

}

contract LearningConcepts {
  struct Voters {
    uint weight;
    bool voted;
    address delegate;
    uint vote;
  }
  // when single data type is not enough for representing a user profile or product
  // details
  // to keep together related data

  struct Product {
    string name;
    uint price;
  }
  Product[] public products;

  function addProduct(string memory name,uint price) public {
    Product memory newProduct = Product({
      name : name,
      price : price
    });
    products.push(newProduct);
  }
  // relation Types in Structs There are mainly 4 different types of struct relation

  // concept 

  // 1. One To One 
  // struct a has exactlt one struct b

  struct AddressInfo {
    string street;
    string city;
  }

  struct User {
    string name;
    AddressInfo addr;
  }

  // this means each struct or each
  // user has 1 addressInfo struct or address data
  //useful for reusable and maintainable codebase

  // 2. One To Many 1:N
  // means one struct has mutliple structs of other struct data
  // for example a store can have multiple products 
  // or a single user can have multiple accounts

  struct singleProduct {
    string name;
    uint price;
  }

  struct Store {
    string name;
    singleProduct[] products;
  }


// 3. Many To One or N:1 
// means Many Struct A Point to One Struct B
// many sttudent can exist in school

 struct Students {
  string[] name;
  address[] students;
 }

 struct School {
  string name;
  string location;
  Students bunchOfStudents;
 }

 struct Team {
  uint id;
  string name;
 }
 
 mapping(uint => Team) public teams;
 
 struct User {
  string username;
  uint teamId; // reference to single teamId
 }
  Team memory newTeam = teams[user.teamId];
// 4. Mny to mny N M
// mny b rete to mny c
// mny tuent enroe in mny coure
  struct Course {
    string name;
    mapping(address => bool) enrolledStudents;
  }

  struct Student {
    string name;
    mapping(string => bool) enrolledCourses;
  }

// Bettter design than the above model of N to M
  struct CourseBetter {
    string name;
    address[] studentList;
    mapping(address => bool) enrolled;
  }
// use mapping for fast checks
// use array for listing students if needed

struct Group {
  string name;
  address[] members;
   
}



// Direct Embedding or Composition

struct Car {
  string brand;
}

struct Driver {
  string name;
  Car car;
}

// using storage pointers 
// when storages are large you can store them in mappings or arrays 
// and reference by ID or index

struct Car1 {
  string brand;
}

mapping(uint => Car1) public cars1;

struct Driver1 {
  string name;
  uint carId;
}
Car1[] public multiCars;

multiCars[0] = Car1("Toyota");

cars1[cardId] = Car1("Toyota");

 //CarType("Toyota");
DriverData memory d = Driver1("Ali",0);


/// with mpping or mny to mny
 struct Group {
  string name;
  mapping(address => bool) members;
 } 

 mapping(uint => Group) public groups;
 function joinGroup(uint groupId) public {
  groups[groupId].members[msg.sender] = true;
 }

 // mrte pce with sellers and products 
 // using 1 to many relationship

 struct Product {
  string name;
  uint price;
  uint id;
 }

 struct Seller {
  address user;
  string name;
  uint[] productIds; //reference by id
 }

 mapping(uint => Product) products;
 mapping(address => Seller) sellers;

 function addProduct(address _seller, string memory _name, uint _price, uint _productId) public {
  products[_productId] = Product({
    name: _name,
    price : _price,
    id : _productId
  });
  sellers[_seller].productIds.push(_productId);
 }
}
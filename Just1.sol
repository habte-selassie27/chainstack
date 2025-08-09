// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Just{

// about structs
 struct Team {
   string name;
 }

 struct User {
    string username;
    Team team;
 }
// each User struct has a copy of Team
// when you do this , every user owns thier own Team Data in full even if it's the same logically
// like the User David and Solomon are in one team so they will hold 100 team data if thier team 
// consist of 100 memebers

// imagie two users Alice and Bob and we want both to be on the same Team ,
// called "TeamA" But If You define 
User alice = User("Alice",Team("TeamA"));
User bob = User("Bob",Team("TeamA"));
// each user has a separate copy of Team("TeamA")
// if later we want to change the team Name to "NewName" you must change it in both copies
// separately
// in solidity this is costly and inefficent

// many to one means Many Users A are associated with one Team B
// Users must to point to the same shared team not to copy the team total data
// Database analogy 
// it i ie uing orign ey in retion Database
// The Uer Tbe h tem_i cooumn reerencing the Tem Tbe You chnge the tem once in the tem tve n uer re
// n uer re utomticy upte to recet it


struct Team1 {
  uint iD;
  string name;
}

mapping(uint => Team1) public teams;
mapping(address => User1) public users;

struct User1{
  string username;
  uint teamiD; // pointer to teams
}

// 
teams[1] = Team1(1,"Team1");
users[bobAddress] = User1("Bob",1);
users[aliceAddress] = User1("Alice",1);

// only one Team object sstored in teams
// Update teams[1].name = "newName" - all users see new name . save gas and storage

struct Team {
  string name;
}

struct User {
  string username;
  Team team; // embedded directly
}

// What happens here?
// when you do this each User Gets Thier own copy of the Team Struct so if you have 100 users in the same team
// you actually store 100 copies of that team's data
User user1 = User("Ali",Team("Avengers"));
User user2 = User("Aarhus",Team("Avengers"));
User user3 = User("Aalborg",Team("Avengers"));

// Now if you want to change the team name to "New Avengers"
// we have to loop and update every user's team copy
// like this 
user1.team.name = "New Avengers";
user2.team.name = "New Avengers"
user3.team.name = "New Avengers"
// problem costly you pay gas for every write
// easy to miss and jump some user and wasteful storage since each user has a full copy of team data

// solution 

// When You Reference by ID or pointer
struct Team {
  string name;
}

mapping(uint => Team) public teams;

struct User {
  string username;
  uint teamId; // reference to teams mapping
}

teams[1] = Team("Avengers");
User user1 = User("Alice",1);
User user2 = User("Sara",1);
User user3 = User("John",1);

// how it works internally 
teams[1].name => "Avengers"
user1.teamId = 1
user2.teamId = 1
user3.teamId = 1



}
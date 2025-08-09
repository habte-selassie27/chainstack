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
// Database analllo

}
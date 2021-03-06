<p align="center">
 <a href =  "https://backend.turing.io/module1/projects/mastermind">
  <img src="https://i.imgur.com/bWQsBh1.png">
 </a>
</p> 

Created by George Ho and Joe Ray, this is the classic game Mastermind.

## Introduction

To run this program on your computer, please run:

##### Clone Repo
```cli
git clone https://github.com/georgehwho/mastermind
```
##### Change into Directory 
```cli
cd mastermind
```
##### Install Gems
```cli
bundle
```

##### Run Game on Command Line
```cli
ruby mastermind_runner.rb
```

##### Run Test Suite on Command Line

```cli 
rake
```
_will run all test files and show coverage_

### Game Structure:

* Game
  * Turn
    * Player
      * Pin
      * Ball

### Game State Flow:

#### Main Menu Flow

* Game starts and shows the welcome text
* Game then presents the intro prompt and lists options to choose from and depending on the user's input:
  * (p) Game shows the pick difficulty prompt and list options to choose from:
    * (b) Game starts a beginner level game
    * (i) Game starts a intermediate level game
    * (a) Game starts a intermediate level game
  * (i) Game shows the instructions and lists options to choose from:
    * (any key) Game shows the intro prompt again
    * (p) Game quits and shows the quit text
  * (q) Game quits and shows the quit text

#### Playing the Game Flow

* Once a difficulty has been selected, the game will automatically generate a random secret answer.
* Game asks the player to guess an answer or to quit
* If the player guesses correctly, the game will return the player's results and ask if they want to play again
* If the player wishes to play again, they will be brought back to the menu that lets them select a difficulty.

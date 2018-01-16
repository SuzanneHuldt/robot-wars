# Robot Wars
## Makers Academy Final Project

[Intro](#intro) | [Quickstart](#quickstart) | [Setup](#setup) | [Approach](#approach) | [Challenges](#challenges) | [Tech Stack](#tech-stack)

## Intro
For our final project at Makers Academy we chose to build a game-playing bot.
The choice of project was motivated primarily by the technical challenge involved, as well as a shared interest among members of the group in artificial intelligence and machine learning topics.


## Quickstart



## Setup
Given our goals for the project (pushing ourselves technically and learning about machine learning and artificial intelligence) our choice of implementation was governed by two central considerations:
  1. Providing an appropriately challenging project to both consolidate and stretch the knowledge and skills acquired during the Makers Academy course. In particular, to ensure that the project involves writing a good deal of code (as opposed to simply connecting existing technologies and libraries).
  2. Finding a suitable way to assess the performance of our project as a bot, rather than code that merely passes tests.

As such, we chose to tackle the Game of Life and Death (GOLAD) from [Riddles.io](https://www.riddles.io/). Riddles.io provides puzzles that satisfy all of our requirements: the games are sufficiently challenging, the website is popular meaning there are lots of other bots to benchmark against, and the website provides some starter bots, allowing us to take inspiration for our code from bots written in other languages. It also gave us the advantage of playing a pre-created game, meaning we would be able to dedicate our energies to developing our bot, rather than building and visualising a game and game board. We chose to tackle GOLAD as the rules for the game were simple and input was limited, yet the nature of the game (choosing between optimising for maximum benefit for your own cells vs destroying an opponent's) allow for different strategic approaches to be taken with the game.


## Approach

Our first step in this project was to establish what our MVP would be. Given that we would be working from scratch, we concluded that our MVP would be to build a bot that could play random (legal) moves in the game. Whilst Riddles.io provides starter bots in some languages, there was not yet one provided in Ruby, and so to build our starter bot we looked at those offered in other languages, such as Python, C, or JavaScript, and looked to replicate that functionality in Ruby whilst improving on the structure of the code. In practice, that led to us experimenting with spiked versions of the bot, in order to get to get familiar with new programming paradigms, such as dealing directly with streams and IO. A (heavily commented) example of one such spiked bot can be found [here](https://github.com/RobertClayton/ml-bot-prototype). Once we had got to grips with these new concepts, we began to recreate the bot using a test-driven approach and a more thoughtful and considered approach to the design and object-orientation of the bot (for more on this, see [below](#challenges)). An example of one of our diagrams for our MVP follows:

![MVP  diagram](/readme_images/robot-wars-diagram.jpg)


## Challenges

One interesting challenge that this project presented was the time restrictions on making a move that the game imposed a time limit on each move in the game. This led us to take some unfamiliar and intentional design decisions, such as preloading as much data as possible before `action` methods were called, and sacrificing some object-orientation in order to improve the speed of the program. (EXPLAIN THIS BETTER WITH CONCRETE EXAMPLES)


## Tech Stack
The technologies used for this project are as follows:
- Language(s): Ruby
  - We took the decision to use Ruby both to use a language we were comfortable with, given the type of challenge we were attempting, and to allow us to really push ourselves to the limit in a given language
- API (to connect with relevant competition &c) ...
- Testing frameworks ...

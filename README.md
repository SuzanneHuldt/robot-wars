# Robot Wars
## Francine: Makers Academy Final Project

[Demo](#demo) | [Intro](#intro) | [Quickstart](#quickstart) | [Setup](#setup) | [Approach](#approach) | [Challenges](#challenges) | [Tech Stack](#tech-stack)

## Demo  
Here is the final presentation and demo that was presented on the 19th January 2018.  
https://youtu.be/X7m_-w3S5W8

## Intro
Francine is a bot built to play a two-player variant of [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life), and is our final project at [Makers Academy](http://www.makersacademy.com/).
The choice of project was motivated primarily by the technical challenge involved, as well as a shared interest among members of the group in artificial intelligence and machine learning topics.


## Quickstart

A basic version of this bot, which plays with solely random moves, is available to download from the [Riddles.io page](https://starapple.riddles.io/competitions/game-of-life-and-death/how-to-play) for the Game of Life and Death (GOLAD). Alternatively, if you wish to tinker with and improve upon our logic, clone this repo, and the file `action.rb` will provide you with the outputs of each of the bot's different move choices. This logic is encapsulated within `birthpattern.rb`, `cell_checker.rb`, and `matcher.rb`.

To run the tests, first run `bundle install` from the project root directory, and then run `rspec`.

To play a game, you will need to download the game engine from Riddles.io; instructions for this can be found [here](https://starapple.riddles.io/competitions/game-of-life-and-death/how-to-play).



## Setup
Given our goals for the project (pushing ourselves technically and learning about machine learning and artificial intelligence) our choice of implementation was governed by two central considerations:
  1. Providing an appropriately challenging project to both consolidate and stretch the knowledge and skills acquired during the Makers Academy course. In particular, to ensure that the project involves writing a good deal of code (as opposed to simply connecting existing technologies and libraries).
  2. Finding a suitable way to assess the performance of our project as a bot, rather than code that merely passes tests.

As such, we chose to tackle the GOLAD from [Riddles.io](https://www.riddles.io/). Riddles.io provides puzzles that satisfy all of our requirements: the games are sufficiently challenging, the website is popular meaning there are lots of other bots to benchmark against, and the website provides some starter bots, allowing us to take inspiration for our code from bots written in other languages. It also gave us the advantage of playing a pre-created game, meaning we would be able to dedicate our energies to developing our bot, rather than building and visualising a game and game board. We chose to tackle GOLAD as the rules for the game were simple and input was limited, yet the nature of the game (choosing between optimising for maximum benefit for your own cells vs destroying an opponent's) allow for different strategic approaches to be taken with the game.


## Approach

It quickly became apparent that there would be two discrete phases to this project: the first would be to create a bot that could communicate with the game engine and play random moves (this would constitute our MVP), and the second would be to code logic into the bot, in order for it to play the game with a modicum of intelligence.

Whilst Riddles.io provides starter bots in some languages, there was not yet one provided in Ruby, and so to build our starter bot we first looked at those offered in other languages, such as Python, C, or JavaScript, so that we might understand the required functionality, before creating a Ruby version. In practice, that led to us experimenting with spiked versions of the bot, in order to get to get familiar with new programming paradigms, such as dealing directly with streams and IO. A (heavily commented) example of one such spiked bot can be found [here](https://github.com/RobertClayton/ml-bot-prototype). Once we had got to grips with these new concepts, we began to recreate the bot in a test-driven manner and a more thoughtful and considered approach to the design and object-orientation of the bot (for more on this, see [below](#challenges)). An example of one of our diagrams for our MVP follows:

![MVP  diagram](/readme_images/robot-wars-diagram.jpg)


The second stage was to code logic into the bot. We identified that certain patterns on the board would be self-sustaining (without external interference), and so represented a strong position on the board for the player that controlled them. More on these patterns is available [here](http://www.math.cornell.edu/~lipa/mec/lesson6.html). The classes `BirthPattern`, `Matcher`, `Fragment`, and the files in `pattern_libraries` contain the logic for this. Meanwhile, given that time was a consideration in terms of how long our bot was permitted for each move (see [below](#challenges) for more), we also implemented functionality that would allow our bot to skip over areas of the board that it could see, from surrounding cells, would not contain any of these patterns. We also created a system that would allow our bot, from a selection of possible moves, evaluate the board after the next generation of cells, and based on this decide which move would provide the greatest net benefit to itself in terms of the number of cells it controlled on the field.


## Challenges

One interesting challenge that this project presented was the time restrictions on making a move that the game imposed a time limit on each move in the game. This led us to take some unfamiliar and intentional design decisions, such as preloading as much data as possible before `action` methods were called, and sacrificing some object-orientation in order to improve the speed of the program. Another challenge that we had to contend with was getting used to using IO in Ruby and, specifically, ensuring a synchronous stream to ensure continuous communication with the game engine, rather than Ruby's default, asynchronous IO stream.

From a more human perspective, we also faced the challenge of working as a group of people each of whom have very different working styles. In order to ensure that this did not lead to breakdowns in work on the project, we made sure that, as a team, we were in constant communication so that each person was always aware of what everyone else was working on. This meant that those who preferred working or researching individually could do so, whilst those who worked better whilst pairing were also able to work in their preferred manner. 


## Tech Stack

We took an intentional decision early on to build this project from scratch, without the help of external machine learning libraries. In order to allow us to put maximum focus on this, we chose to use **Ruby** as a language we were familiar with, alongside the **RSpec** testing framework.

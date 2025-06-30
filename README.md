# hangman

This is a version of the classic Hangman game in the console. It was written to practice Ruby, more precisely IO class and to how to implement serialization and deserialization.

## Install

### Pre-requisites

* Check if you have ruby installed in your local machine
   ```bash
   ruby -v
   ```
   If Ruby is not installed, you can follow the instructions written on the [Ruby Documentation](https://www.ruby-lang.org/en/documentation/installation/) to install it.

### Installation

1. Clone this repository to your local machine
    ```bash
    git clone https://github.com/jlcarg/hangman.git
    ```
2. Use the 'cd' command to move to the cloned directory\
   Ex:
   ```bash
   cd ~/repos/hangman
   ```
3. Run the program using the command ruby
   ```bash
   ruby main.rb
   ```

## Usage

When you run the program:

* If no save file is found, the game will prompt you to enter your name and then begin a new game.
  
* If save files are present, you'll be asked if you want to load a previous game:

    * Just press enter to start a new game or
  
    * Type Y and press Enter to load a game:

      1. The program will display a list of available save files.

      2. Enter the number corresponding to the save file you'd like to load.

      3. The game will automatically resume after a brief pause.

### How to Play

* In the beginning each round, you'll be asked if you want to save and exit:

    - Type Y and press Enter to save and quit.

    - Just press Enter to continue playing.

* Guess one letter at a time by typing it and pressing Enter.

* After each guess, the program will:

  * Let you know if the letter was already guessed.

  * Tell you if it was a hit (correct) or miss (incorrect).

* Display your current progress, including:

  - Correctly guessed letters in their proper positions.

  - A list of incorrect guesses.

### Known issues

- The game loop feels clunky: players must press Enter or type SAVE every turn to continue or save, rather than simply allowing letter guesses or SAVE as input.
  
- If a player return to a save file and decides to save and quit again, instead of overwriting the save file, it creates a new one.
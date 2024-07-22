# Boggle Solver in Haskell

This is a Boggle solver implemented in Haskell. It finds all possible words on a given Boggle board using Lists and a Map to store the Boggle board and the found words respectively.

## How it works

The solver uses a depth-first search algorithm to traverse the Boggle board. It starts from each cell of the board and explores neighboring cells to find valid words.

## Code Overview

The main function is `boggle :: [String] -> [String] -> [(String, [(Int, Int)])]`. This function takes a Boggle board and a list of words as input, and returns a list of tuples where each tuple contains a word found on the board and its coordinates.

Here's a brief overview of the helper functions:

- `findWord :: Board -> FoundWords -> BoggleWord -> FoundWords`: This function finds a word on the board. It returns a map of words found so far along with their coordinates.
- `traverseBoard :: Board -> Position -> BoggleWord -> [Position] -> Maybe [Position]`: This function traverses the board from a given cell. It explores all valid directions and returns the path if the word is found.
- `isValid :: Board -> Position -> BoggleWord -> [Position] -> Bool`: This function checks if a position is valid (i.e., it is within the board boundaries, the character at the position matches the first character of the word, and the position is not already in the path).

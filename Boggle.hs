
{- 

   Student name: Nilin Reza
   Student ID: 501214241
   Student moon userid: nreza

-}

module Boggle (boggle) where

import Data.List
import Data.Maybe (catMaybes)
import qualified Data.Map as Map

type Board = [[Char]]
type BoggleWord = String
type Position = (Int, Int)
type FoundWords = Map.Map BoggleWord [Position]

boggle :: [String] -> [String] -> [(String, [(Int, Int)])]
boggle board words = Map.toList $ foldl' (findWord board) Map.empty words

findWord :: Board -> FoundWords -> BoggleWord -> FoundWords
findWord board found word =
  case catMaybes $ map (\pos -> traverseBoard board pos (tail word) [pos]) startingPositions of
    [] -> found
    (x:_) -> Map.insert word x found
  where
    startingPositions = [(i, j) | i <- [0..length board - 1], j <- [0..length (board !! 0) - 1], board !! i !! j == head word]

traverseBoard :: Board -> Position -> BoggleWord -> [Position] -> Maybe [Position]
traverseBoard _ _ "" _ = Just []
traverseBoard board (x, y) word path =
  case nextPositions of
    [] -> Nothing
    _ -> Just $ head nextPositions
  where
    nextPositions = catMaybes $ map (\pos -> traverseBoard board pos (tail word) (pos:path)) validNextPositions
    validNextPositions = [(nx, ny) | dx <- [-1..1], dy <- [-1..1], let nx = x + dx, let ny = y + dy, isValid board (nx, ny) word path]

isValid :: Board -> Position -> BoggleWord -> [Position] -> Bool
isValid board (x, y) word path =
  x >= 0 && y >= 0 && x < length board && y < length (head board) && board !! x !! y == head word && notElem (x, y) path

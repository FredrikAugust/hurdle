module Lib (solve) where

-- Data types
data Tile = Green Char | Yellow Char | Gray Char
  deriving (Eq)

instance Show Tile where
  show (Green c) = "\ESC[32m" ++ [c] ++ "\ESC[0m"
  show (Yellow c) = "\ESC[33m" ++ [c] ++ "\ESC[0m"
  show (Gray c) = [c]

removeFirst :: Eq a => [a] -> a -> Maybe [a]
removeFirst [] _ = Nothing
removeFirst (x : xs) a
  | x == a = Just xs
  | otherwise = case removeFirst xs a of
    Just ys -> Just (x : ys)
    Nothing -> Nothing

solve' :: ([Tile], [Char]) -> (Char, Char) -> ([Tile], [Char])
solve' (tiles, word) (g, c) = case removeFirst word g of
  Just ys -> (tiles ++ [constructor g], ys)
    where
      constructor = if g == c then Green else Yellow
  Nothing -> (tiles ++ [Gray g], word)

solve :: [Char] -> [Char] -> [Tile]
solve word guessed = fst $ foldl solve' ([], word) (zip guessed word)

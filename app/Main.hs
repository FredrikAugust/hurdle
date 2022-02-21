module Main where

import Control.Monad (forever)
import Lib
import System.IO (hFlush, stdout)

main :: IO ()
main = forever $ do
  line <- getLine
  print $ Lib.solve "other" line
  hFlush stdout

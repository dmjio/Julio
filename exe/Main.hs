{-# LANGUAGE OverloadedStrings #-}
module Main where

import Julia
import Foreign.C.String

main :: IO ()
main = do
  juliaInit
  evalJulia "print(sqrt(2.0))"
  exitJulia

{-# LANGUAGE OverloadedStrings #-}
module Main where

import Julia

main :: IO ()
main = do
  juliaInit
  evalJulia "print(sqrt(2.0))"
  exitJulia

-- [nix-shell:~/Desktop/julio]$ ./result/bin/main
-- 1.4142135623730951

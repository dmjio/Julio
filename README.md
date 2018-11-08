Julio
=====================

An example of [Julia](https://julialang.org/) embedded in [Haskell](https://haskell.org).

Per the instructions on Julia's website [on embedding](https://docs.julialang.org/en/v0.6.2/manual/embedding/).

## DSL
```haskell
{-# LANGUAGE OverloadedStrings #-}
module Main where

import Julia

main :: IO ()
main = do
  juliaInit
  evalJulia "print(sqrt(2.0))"
  exitJulia
```

## Build
```bash
nix-build
```

## Run
```haskell
-- [nix-shell:~/Desktop/julio]$ ./result/bin/main
-- 1.4142135623730951
```


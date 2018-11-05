module Julia where

import Control.Monad
import Foreign.C
import Foreign.C.String

#include "julia.h"

foreign import ccall safe "jl_init();"
  juliaInit :: IO ()

foreign import ccall safe "jl_eval_string($1);"
  evalJuliaCommand :: CString -> IO ()

foreign import ccall safe "jl_atexit_hook(0);"
  exitJulia :: IO ()

evalJulia :: String -> IO ()
evalJulia = evalJuliaCommand <=< newCString

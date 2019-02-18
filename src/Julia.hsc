{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE CPP #-}
module Julia where

import Control.Monad
import Foreign.C
import Foreign.C.String

foreign import ccall "jl_init__threading"
  jl_init__threading :: IO ()

foreign import ccall "jl_eval_string($1);"
  jl_eval_string :: CString -> IO ()

foreign import ccall "jl_atexit_hook(0);"
  jl_atexit_hook :: IO ()

foreign import ccall "jl_errorf($1);"
  jl_errorf :: CString -> IO ()

evalJulia :: String -> IO ()
evalJulia = jl_eval_string <=< newCString

juliaInit :: IO ()
juliaInit = jl_init__threading
exitJulia = jl_atexit_hook

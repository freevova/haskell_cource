{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_shawty (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/vova/Desktop/haskell_cource/19_applying_structures/shawty-prime/.stack-work/install/x86_64-linux-tinfo6/4399b77f7b976350f2449444b22b34699b299a50d360a89f87868778ef4e229d/8.6.3/bin"
libdir     = "/home/vova/Desktop/haskell_cource/19_applying_structures/shawty-prime/.stack-work/install/x86_64-linux-tinfo6/4399b77f7b976350f2449444b22b34699b299a50d360a89f87868778ef4e229d/8.6.3/lib/x86_64-linux-ghc-8.6.3/shawty-0.1.0.0-4P1V0WyhMYqL2OeAZQ1Mo7-shawty"
dynlibdir  = "/home/vova/Desktop/haskell_cource/19_applying_structures/shawty-prime/.stack-work/install/x86_64-linux-tinfo6/4399b77f7b976350f2449444b22b34699b299a50d360a89f87868778ef4e229d/8.6.3/lib/x86_64-linux-ghc-8.6.3"
datadir    = "/home/vova/Desktop/haskell_cource/19_applying_structures/shawty-prime/.stack-work/install/x86_64-linux-tinfo6/4399b77f7b976350f2449444b22b34699b299a50d360a89f87868778ef4e229d/8.6.3/share/x86_64-linux-ghc-8.6.3/shawty-0.1.0.0"
libexecdir = "/home/vova/Desktop/haskell_cource/19_applying_structures/shawty-prime/.stack-work/install/x86_64-linux-tinfo6/4399b77f7b976350f2449444b22b34699b299a50d360a89f87868778ef4e229d/8.6.3/libexec/x86_64-linux-ghc-8.6.3/shawty-0.1.0.0"
sysconfdir = "/home/vova/Desktop/haskell_cource/19_applying_structures/shawty-prime/.stack-work/install/x86_64-linux-tinfo6/4399b77f7b976350f2449444b22b34699b299a50d360a89f87868778ef4e229d/8.6.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "shawty_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "shawty_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "shawty_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "shawty_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "shawty_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "shawty_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)

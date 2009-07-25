{-# LANGUAGE DeriveDataTypeable #-}
{-# OPTIONS -fglasgow-exts #-}

module Main where

import Data.ByteString.Lazy.Char8 (pack)
import Data.Data
import Hack
import Hack.Contrib.Press
import Hack.Handler.Happstack
import Text.JSON.Generic

main = run $ \env -> do renderToResponse env "env.html" []

{-# LANGUAGE DeriveDataTypeable #-}
{-# OPTIONS -fglasgow-exts #-}

module Main where

import Hack
import Hack.Contrib.Press (renderToResponse)
import Hack.Handler.Happstack (run)
import Text.JSON.Generic

data Profile = Profile {
    name :: String,
    favoriteMusic :: [String]
} deriving (Data, Typeable)

main = run $ \env -> do renderToResponse env "small.html" context
    where aProfile = Profile "Brandon Bickford" ["Rock"]
          context = [toJSON aProfile]

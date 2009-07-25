Hack.Contrib.Press
====================

Quickstart
-------------

Small.hs 
--------
<code>
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
</code>

small.html
----------

<code>
    <html>
        <body>
            <p>
                Hey <b>{{ name }}</b>, I heard you like:
                <ul>
                    {% for music in favoriteMusic %}
                        <li>{{ music }}</li>
                    {% endfor %}
                </ul>     
            </p>
        </body>
    </html>
</code>

Run 
---
  - Run: cabal install hack-contrib-press
  - Add "Small.hs" and "small.html"
  - Run: ghc --make -o small Small.hs
  - Run: ./small
  - In your browser visit: http://localhost:3000

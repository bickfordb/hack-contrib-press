module Main where

import Hack
import Hack.Contrib.Press (renderToResponse)
import Hack.Handler.Happstack (run)

main = run $ \env -> do renderToResponse env "env.html" []

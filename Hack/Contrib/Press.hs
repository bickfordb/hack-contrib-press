module Hack.Contrib.Press  where

import Data.ByteString.Class
import Data.Data
import Hack
import Text.JSON
import Text.JSON.Generic (toJSON)
import Text.Press.Run
import qualified Hack

-- converts a context and template name or body into a response

errorTemplate = "<html><body><h1>Error</h1><h2>Unable to render</html>" 
templateNameVar = "template.name"
templateBodyVar = "template.body"

renderToResponse :: Hack.Env -> String -> [JSValue] -> IO Response
renderToResponse env filename context = runJSValuesWithPath sl filename >>= resultToResponse
    where sl = context ++ (defaultContext env)

envToJS :: Hack.Env -> JSValue
envToJS env = env'
    where
        env' = JSObject $ toJSObject [
            ("requestMethod", toJSON . show $ requestMethod env),
            ("scriptName", toJSON $ scriptName env),
            ("queryString", toJSON $ queryString env),
            ("serverName", toJSON $ serverName env),
            ("serverPort", toJSON $ serverPort env),
            ("http", toJSON $ http env),
            ("hackVersion", toJSON $ hackVersion env),
            ("hackHeaders", toJSON $ hackHeaders env), 
            ("hackUrlScheme", toJSON . show $ hackUrlScheme env)
            ]

defaultContext :: Hack.Env -> [JSValue]
defaultContext env = [JSObject $ toJSObject [("env", envToJS env)]]

resultToResponse result = do
    case result of 
        Left err -> error $ show err
        Right succ -> do
            return $ Hack.Response {
                status = 200,
                headers = [("Content-Type", "text/html")],
                body = toLazyByteString $ foldl (++) "" succ
            }

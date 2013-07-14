-- |
-- Module      : Network.PagerDuty.Internal
-- Copyright   : (c) 2013 Brendan Hay <brendan.g.hay@gmail.com.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

module Network.PagerDuty.Internal
    ( jsonKey
    ) where

import Data.Char (toLower, isUpper)

jsonKey :: String -> String
jsonKey str
    | head str == '_' = tail str
    | otherwise      = underscore str
  where
    underscore [] = []
    underscore (c : cs)
        | isUpper c = '_' : underscore (toLower c : cs)
        | otherwise =  c  : underscore cs

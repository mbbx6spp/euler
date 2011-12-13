module Main (main) where

import Test.QuickCheck (quickCheck)
import Test.HUnit (runTestTT, Test(..))
import Test.Framework (defaultMain)
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck2
import Euler.Problem1Test (testSuite)

main = defaultMain testSuite

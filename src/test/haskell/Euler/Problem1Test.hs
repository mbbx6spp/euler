module Euler.Problem1Test (testSuite) where

import Euler.Problem1 (solution)
import Test.Framework (Test(..), testGroup)
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck2
import qualified Test.HUnit as HUnit
import Test.QuickCheck (quickCheck, Positive)

-- | If we list all the natural numbers below 10 that are multiples
-- | of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
testKnownSum = HUnit.assertEqual
  "Should sum multiples of 3 or 5 between 1 and 10 to find 23" 23 $
  solution [1..9] cond

-- | Through simple number theory properties we know this general property
-- | should hold for our solution.
propSolutionMults :: Positive Int -> Bool
propSolutionMults n = (result == 3*i + 5*j - 15*k)
  where
    result = solution [1..n] cond
    i = sum [1..(div n 3)]
    j = sum [1..(div n 5)]
    k = sum [1..(div n 15)]

cond :: Integral a => a -> Bool
cond x = x `rem` 3 == 0 || x `rem` 5 == 0

testSuite = [ testGroup "Problem1 test cases"
  [ testCase "known sum given [1..10]" testKnownSum
  , testProperty "solution multiple characteristics" propSolutionMults
  ] ]

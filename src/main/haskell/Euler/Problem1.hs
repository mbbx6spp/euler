-- | Find the sum of all the multiples of 3 or 5 below 1000.
module Euler.Problem1 where

-- | Solves stated problem with inline conditionals in list comprehension
solution :: Integral a => [a] -> (a -> Bool) -> a
solution xs cond = sum [ x | x <- xs, cond x ]

main :: IO ()
main = do
    putStrLn $ show $ solution range cond
  where
    range = [1..999] :: [Integer]
    cond = (\x -> (rem x 3) == 0 || (rem x 5) == 0)

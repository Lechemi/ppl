module HelloWorld where

howLong :: [a] -> Integer
howLong [] = 0
howLong (x : xs) = 1 + howLong xs
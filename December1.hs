import           AdventUtils
import           Data.List

main = openInputAndExecute(\contents -> do
  print $ getFloor contents
  print $ getToBasement contents)

getFloor :: String -> Int
getFloor [] = 0
getFloor (x:xs)
  | x == '(' = 1 + getFloor xs
  | x == ')' = -1 + getFloor xs
getFloor _ = 0

getToBasement :: String -> Maybe Int
getToBasement = elemIndex (-1) . scanl changeFloor 0
  where   changeFloor acc x
            | x == '(' = acc + 1
            | x == ')' = acc - 1
            | otherwise = acc

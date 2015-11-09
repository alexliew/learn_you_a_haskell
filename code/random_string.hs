import System.Random

main = do
  gen <- getStdGen
  putStrLn $ take 20 (randomRs ('a','z') gen)
  -- same generator, use newStdGen to avoid this issue
  gen2 <- getStdGen
  putStrLn $ take 20 (randomRs ('a','z') gen2)
  --this also updates the global generator
  gen3 <- newStdGen
  putStrLn $ take 20 (randomRs ('a','z') gen3)
  gen4 <- getStdGen
  putStrLn $ take 20 (randomRs ('a','z') gen4)



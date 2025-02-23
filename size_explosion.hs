lucky :: (Integral a) => a -> String

lucky x
  | x < 10 = "Lucky!!!!"
  | otherwise = "Unlucky"

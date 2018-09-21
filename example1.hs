{-# LANGUAGE OverloadedStrings #-}

import Data.Conduit
import Data.Conduit.Binary
import Data.Conduit.List as CL
import Data.CSV.Conduit
import Data.Text (Text)

-- Just reverse te columns
myProcessor :: Monad m => Conduit (Row Text) m (Row Text)
myProcessor = CL.map reverse

test :: IO ()
test = runResourceT $ 
  transformCSV defCSVSettings 
               (sourceFile "input.csv") 
               myProcessor
               (sinkFile "output.csv")
               

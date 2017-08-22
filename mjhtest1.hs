{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fwarn-missing-signatures #-}
import Data.Conduit
import Data.Conduit.Binary
import Data.Conduit.List as CL
import Data.CSV.Conduit
import Data.Text (Text)

-- Just reverse the columns
myProcessor :: Monad m => Conduit (Row Text) m (Row Text)
myProcessor = CL.map reverse

test :: IO ()
test = runResourceT $ 
  transformCSV defCSVSettings 
               (sourceFile "/home/mikeh/CSV/CSVData.csv") 
               myProcessor
               (sinkFile "/home/mikeh/CSV/CSVDataOut.csv")
-- ```

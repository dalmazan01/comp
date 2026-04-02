module Examplesmoto where

import Syntaxmoto
import Semanticsmoto
import Control.Exception (evaluate)

--using records for readability
v1 :: Vehicle
v1 = Vehicle
  { code = 101
  , vtype = "Motorcycle"
  , year = 2023
  , price = 8500.00
  , stock = 5
  , available = True
  , comments = "Excellent condition"
  }

v2 :: Vehicle
v2 = Vehicle
  { code = 102
  , vtype = "ATV"
  , year = 2022
  , price = 12000.00
  , stock = 3
  , available = True
  , comments = "Minor service needed"
  }

c1 :: Customer
c1 = Customer
  { custId = 1
  , name = "Jade Avi"
  , phone = "123-555-0101"
  }

c2 :: Customer
c2 = Customer
  { custId = 2
  , name = "Diego Alma"
  , phone = "123-555-0102"
  }

stmt1 :: Statement
stmt1 = AddVehicle v1

stmt2 :: Statement
stmt2 = AddCustomer c1

stmt3 :: Statement
stmt3 = AddCustomer c2

stmt4 :: Statement
stmt4 = ChangePrice 101 9200.00

stmt5 :: Statement
stmt5 = ChangeStock 101 10

prog1 :: Program
prog1 = BeginEnd [stmt1, stmt2, stmt3]

prog2 :: Program
prog2 = BeginEnd [stmt1, stmt4, stmt5]

main :: IO ()
main = do
  putStrLn "=== Example 1: Add a Motorcycle ==="
  putStrLn (show stmt1)
  putStrLn ""
  
  putStrLn "=== Example 2: Add Customer Jade ==="
  putStrLn (show stmt2)
  putStrLn ""
  
  putStrLn "=== Example 3: Add Customer Diego ==="
  putStrLn (show stmt3)
  putStrLn ""
  
  putStrLn "=== Example 4: Change Price ==="
  putStrLn (show stmt4)
  putStrLn ""
  
  putStrLn "=== Example 5: Change Stock ==="
  putStrLn (show stmt5)
  putStrLn ""

  --------------------------------------------------------------
  --to show that that evaluateP works as expected
  putStrLn "=== Running Program 1: Add vehicle and customers ==="
  --putStrLn (show (evaluateP prog1))
  print (evaluateP prog1)
  putStrLn ""
  
  --to show that that evaluateP works as expected
  putStrLn "=== Running Program 2: Add vehicle and change price/stock ==="
  putStrLn (show (evaluateP prog2))

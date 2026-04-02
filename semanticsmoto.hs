module Semanticsmoto where
--remember semantics is the meaning of the syntax
--how things will run 

import Syntaxmoto

-- Result: Did the program work, or did it fail?
data Result = Valid Environment | Invalid String

instance Show Result where
  show (Valid env) = "Valid" ++ show env
  show (Invalid err) = "Invalid: " ++ err

-- Run a complete program
evaluateP :: Program -> Result
evaluateP (BeginEnd stmts) = evaluateSS stmts emptyEnv

-- Run multiple statements (ss = Statements)
evaluateSS :: Statements -> Environment -> Result
evaluateSS [] env = Valid env
evaluateSS (s:ss) env = 
  case evaluateS s env of
    Valid newEnv -> evaluateSS ss newEnv
    Invalid err -> Invalid err

-- Run a single statement and update the environment
evaluateS :: Statement -> Environment -> Result
evaluateS (AddVehicle v) env = 
  let (vehicles, customers, services) = env
      newVehicles = (code v, v) : vehicles
  in Valid (newVehicles, customers, services)

evaluateS (AddCustomer c) env = 
  let (vehicles, customers, services) = env
      newCustomers = (custId c, c) : customers
  in Valid (vehicles, newCustomers, services)

evaluateS (Service custId code comments) env = 
  let (vehicles, customers, services) = env
      newServices = (custId, (custId, code, comments)) : services
  in Valid (vehicles, customers, newServices)

evaluateS (ChangePrice code price) env = 
  let (vehicles, customers, services) = env
      newVehicles = map (\(c, v) -> if c == code then (c, v { price = price }) else (c, v)) vehicles
  in Valid (newVehicles, customers, services)

evaluateS (ChangeStock code amount) env = 
  let (vehicles, customers, services) = env
      newVehicles = map (\(c, v) -> if c == code then (c, v { stock = amount }) else (c, v)) vehicles
  in Valid (newVehicles, customers, services)

evaluateS (ChangeStatus code status) env = 
  let (vehicles, customers, services) = env
      newVehicles = map (\(c, v) -> if c == code then (c, v { available = status }) else (c, v)) vehicles
  in Valid (newVehicles, customers, services)

emptyEnv :: Environment
emptyEnv = ([], [], [])
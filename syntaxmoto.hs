module Syntaxmoto where

{-
MotorLang+ - A language for managing a motorcycle rental system

MotorLang+ Context Free Grammar

<program> -> <statement>
<statement> -> <statement> | <statement_list>
<statement> -> Add <vehicle_details> | Add <customer> | Service <customer_id> <code> <comments> 
             | UpdateStatus <code> Bool | UpdatePrice <code> Float | UpdateStock <code> Int

<vehicle_details> -> "vehicle: " <code>, "type: " <vec_Type>, "year: " int
                     "price: " Float, "stock: " Int, "status": Bool
<vec_Type> -> "Motorcycle" | "Boat" | "Scooter" | "ATV" | "Jetski"
<customer> -> "Name: " String "phone: " String
<code> -> Int
<customer_id> -> Int

-}

data Program = BeginEnd Statements

type Statements = [Statement]

data Statement = AddVehicle Vehicle | AddCustomer Customer
                | Service Int Int String | ChangePrice Int Float
                | ChangeStock Int Int | ChangeStatus Int Bool

data Vehicle = Vehicle { code :: Int, vtype :: String, year :: Int
                      , price :: Float, stock :: Int, available :: Bool, comments :: String}

data Customer = Customer
  { custId :: Int, name :: String, phone :: String}

type Code = Int
type CustomerId = Int

-- Environemnt = Storage for system data
-- Like filing cabinets: one for vehicles, one for customers, one for services
type VehicleEnv = [(Int, Vehicle)]
type CustomerEnv = [(Int, Customer)]
type ServiceEnv = [(Int, (Int, Int, String))]

-- All env combined into one Environment
type Environment = (VehicleEnv, CustomerEnv, ServiceEnv)

-- instances
instance Show Vehicle where
  show v = "Vehicle (code=" ++ show (code v) ++ ", type=" ++ vtype v 
    ++ ", year=" ++ show (year v) ++ ", price=" ++ show (price v) ++ ", comments=" ++ comments v ++ ")"

instance Show Customer where
  show c = "Customer (id=" ++ show (custId c) ++ ", name=" ++ name c ++ ")"

instance Show Statement where
  show (AddVehicle v) = "Add " ++ show v
  show (AddCustomer c) = "Add " ++ show c
  show (Service cid code cmts) = "Service (customerId=" ++ show cid ++ ", code=" ++ show code ++ ", comments=" ++ cmts ++ ")"
  show (ChangePrice code p) = "Change price of " ++ show code ++ " to " ++ show p
  show (ChangeStock code s) = "Change stock of " ++ show code ++ " to " ++ show s
  show (ChangeStatus code st) = "Change status of " ++ show code ++ " to " ++ show st

instance Show Program where
  show (BeginEnd stmts) = unlines (map show stmts)
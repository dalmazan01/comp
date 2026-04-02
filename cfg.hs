{--
My context free grammar file

Name: MotorLang+
Description:
    This is a language for motorsport dealerships. It will allow the dealership
    to see the vehicles they have in stock, what items are in need of service, 
    its sale status, the customer associated with it, and each item will have 
    a number identifier. This functions like a database. 



<program> -> <statment>
<statment> -> <statement> | <statement_list>

<statement> -> Add <vehicle_details> | Add <customer> | Service <customer_id> <code> <comments> | UpdateStatus <code> Bool | UpdatePrice <code> Float | UpdateStock <code> Int

<vehicle_details> -> "vechile: " <code>, "type: " <vec_Type>, "year: " int
                    "price: " Float, "stock: " Int, "status":Bool
<vec_Type> -> "Motorcycle" | "Boat" |  "Scooter" | "ATV" | "Jetski"
<customer> -> "Name: " String "phone: " String
<service> -> "service" <code> "description: " String
<comments> -> String

<code> -> Int
<customer_id> -> Int

--ENVIRONMENT--
<customer_env> -> [(<customer_id), <customer>)]
<vehicle_env> -> [(<code>, <vehicle>)]
<service_env> -> [(<service_id>, (<customer_id>, <code>, <comments>))]

-- <env> -> [ (<id>, (<type>, <value>)) ]

-- <id> -> <code> | <value>

-- <type> -> vehicleType | customerType | serviceType | stringType | intType | floatType | boolType

-- <value> -> VehicleRecord | CustomerRecord | ServiceRecord | Int | Float | String | Bool

-- VehicleRecord -> (VehicleType, Year, Price, Stock)
-- CustomerRecord -> (Name, Phone)
-- ServiceRecord -> (Code, Description)
-}
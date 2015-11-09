data TrafficLight = Red | Yellow | Green

--The type class syntax is:
--class Eq a where
--
--To make something an instance of Eq:
instance Eq TrafficLight where
  Red == Red = True
  Green == Green = True
  Yellow == Yellow = True
  _ == _ = False

--Class is for defining new type classses whereas `instance` is for making our types instances of a type class
--or would it be better to say to make the types implement the type class interface?

instance Show TrafficLight where
  show Red = "Red light"
  show Yellow = "Yellow light"
  show Green = "Green light"


class FakeShow a where
  show :: a -> String

instance FakeShow TrafficLight where
  show Red = "Fake red light"
  show Yellow = "Fake yellow light"
  show Green = "Fake green light"

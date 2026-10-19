module Miniteste2_Spec where

import Miniteste2
import Test.HUnit

teste1 = "teste1" ~: [Circulo (2,3) 1, Quadrado (1,2) 2] ~=? g [ Circulo (2,2) 1, Quadrado (1,1) 2]
teste2 = "teste2" ~: [Circulo (-1, -3) 6] ~=? g [Circulo (-1, -4) 6]

listaTestes = test [teste1, teste2]

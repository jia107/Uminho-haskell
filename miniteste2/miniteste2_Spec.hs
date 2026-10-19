module Miniteste2_Spec where

import Miniteste2
import Test.HUnit

teste1 = "teste1" ~: [Circulo (2,3) 1, Quadrado (1,2) 2] ~=? g [ Circulo (2,2) 1, Quadrado (1,1) 2]
teste2 = "teste2" ~: [Circulo (-1, -3) 6] ~=? g [Circulo (-1, -4) 6]
teste3 = "teste3" ~: [Triangulo (-1, 0) (1, 0) (0, 3)] ~=? g [Triangulo (-1, -1) (1, -1) (0, 2)]

listaTestes = test [teste1, teste2, teste3]

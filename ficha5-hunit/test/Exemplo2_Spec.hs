
module Exemplo2_Spec where

import Exemplo2
import Test.HUnit

testesExemplo2 :: Test
testesExemplo2 = test
    [ "Teste 1: 1/3" ~:
        0.33 ~=? mydiv 1 3

    , "Teste 2: Float por zero" ~:
        0 ~=? mydiv 5 0

    , "Teste 3: Int por zero" ~:
        0 ~=? mydiv1 5 0

    , "Teste 4: 15/3" ~:
        5 ~=? mydiv 15 3
    ]

module Main where

import Exemplo2_Spec
import Test.HUnit
import System.Exit (exitFailure)

main :: IO ()
main = do
    resultado <- runTestTT testesExemplo2
    if errors resultado + failures resultado == 0
        then pure ()
        else exitFailure
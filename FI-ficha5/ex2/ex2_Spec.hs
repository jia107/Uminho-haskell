module Ex2_Spec where

import Ex2
import Test.HUnit

testeex2 = test [
  "teste mydiv (1, 3)" ~:  0.33 ~=? mydiv 1 3,
  "teste mydiv (5, 0)" ~: 0 ~=? mydiv 5 0,
  "teste mydiv1 (5, 0)" ~: 0 ~=? mydiv1 5 0,
  "teste mydiv (15, 3" ~: 5 ~=? mydiv 15 3
  ]

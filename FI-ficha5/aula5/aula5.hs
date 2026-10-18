module Aula5 where

type Matriz a = [[a]]

--a
matriz1 = [[Branco, Amarelo, Verde], [Verde, Amarelo, Azul]]


--b
data Cor = Branco | Azul | Amarelo | Vermelho | Verde
     deriving (Show, Eq)

tudoBranco :: (Int, Int) -> Matriz Cor
tudoBranco (l, c) = replicate l (replicate c Branco)


--c
contaCor :: Cor -> Matriz Cor -> Int
contaCor cor matrizCor = conta cor (concat matrizCor)
     where
          conta _ [] = 0
          conta cor (x : xs)
               | cor == x  = 1 + conta cor xs
               | otherwise = conta cor xs


--d
contaCores :: Matriz Cor -> [(Cor, Int)]
contaCores matriz
  = [(cor, contaCor cor matriz) | cor <- [Branco, Azul, Amarelo, Vermelho, Verde]]
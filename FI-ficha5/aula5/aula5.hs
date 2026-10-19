module Aula5 where

-- (!!) :: [a] -> Int -> a
-- Devolve o elemento numa determinada posição.

-- concat :: [[a]] -> [a]
-- Junta várias listas numa única lista.

-- take :: Int -> [a] -> [a]
-- Devolve os primeiros n elementos.

-- drop :: Int -> [a] -> [a]
-- Remove os primeiros n elementos.

-- splitAt :: Int -> [a] -> ([a], [a])
-- Divide uma lista em duas partes.

-- zip :: [a] -> [b] -> [(a,b)]
-- Junta duas listas numa lista de pares.

-- unzip :: [(a,b)] -> ([a], [b])
-- Separa uma lista de pares em duas listas.

-- replicate :: Int -> a -> [a]
-- Repete um elemento n vezes.

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


--e
corPos :: Cor -> (Int, Int) -> Matriz Cor -> Matriz Cor
corPos cor (l, c) matriz 
     | l < 0 || l > length matriz = matriz
     | c < 0 || c > length linha  = matriz 
     | otherwise =
          take l matriz ++ [novaLinha] ++ drop (l + 1) matriz
     where
          linha     = matriz !! l
          novaLinha = take c linha ++ [cor] ++ drop (c + 1) linha


--f
posicoesCor :: Cor -> Matriz Cor -> [(Int, Int)]

--1

type Matriz a = [[a]]
type Posicao = (Int,Int)
type Dimensao = (Int,Int)
data Direcao = Norte | Este | Sul | Oeste deriving (Eq, Show)

eIndiceListaValido :: Int -> [a] -> Bool

eIndiceListaValido i l = i >= 0 && i < length l



--2

dimensaoMatriz :: Matriz a -> Dimensao
dimensaoMatriz [] = (0, 0)
dimensaoMatriz (x : xs) = (length xs + 1, length x)



--3

ePosisaoMatrizValida :: Posicao -> Matriz a -> Bool
ePosisaoMatrizValida (x, y) [a]
  = x >= 0 && x < c && y >= 0 && y < l
  where (l, c) = dimensaoMatriz [a]


--4

acrescentaLinhaInicioMatriz :: [a] -> Matriz a -> Matriz a
acrescentaLinhaInicioMatriz a x
  = a : x



--5

acrescentaLinhaFimMatriz :: [a] -> Matriz a -> Matriz a
acrescentaLinhaFimMatriz a x
  = x ++ [a]

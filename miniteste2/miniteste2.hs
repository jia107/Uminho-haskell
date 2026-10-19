module Miniteste2 where

type Ponto = (Int, Int) -- ^ ( abcissa, ordenada)
data Figura =
  Triangulo Ponto Ponto Ponto | -- ^ três vértices
  Circulo Ponto Int | -- ^ centro e raio,
  Quadrado Ponto Int -- ^ vértice superior esquerdo e o lado
    deriving (Show,Eq)

g :: [Figura] -> [Figura]

f = [Quadrado (3,5) 4, Circulo (1,2) 6]

g[] = []

g (Triangulo (x1, y1) (x2, y2) (x3, y3) : xs) 
    = Triangulo (x1, y1 + 1) (x2, y2 + 1) (x3, y3 + 1) : g xs

g (Circulo (x, y) r : xs) = (Circulo (x, y + 1) r) : g xs

g (Quadrado (x, y) l : xs) = (Quadrado (x, y + 1) l) : g xs
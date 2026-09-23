-- 1.a

data Direcao = Norte | Sul | Este | Oeste deriving Show

type Ponto = (Double, Double)
 
move :: Ponto -> Direcao -> Ponto

move (x, y) (Norte) = (x, y + 1)
move (x, y) (Sul) = (x, y - 1)
move (x, y) (Este) = (x + 1, y)  
move (x, y) (Oeste) = (x - 1, y) 

--1,b

type Distancia = Double

disteu :: Ponto -> Ponto -> Distancia

disteu (x1, y1) (x2, y2) = abs(x2 - x1) + abs(y2 - y1)


--1.c

distm :: Ponto -> Ponto -> Distancia

distm (x1, y1) (x2, y2) = sqrt((x2 - x1)^2 + (y2 - y1)^2)



--2

type Comprimento = Double

movetwo :: Ponto -> Direcao -> Comprimento -> Ponto

movetwo (x, y) (Norte) (c) = if (x<c && y<c) then (x, y + 1) else error "fora da area"
movetwo (x, y) (Sul) (c) = if (x<c && y<c) then (x, y - 1) else error "fora da area"
movetwo (x, y) (Este) (c) = if (x<c && y<c) then (x + 1, y) else error "fora da area"          
movetwo (x, y) (Oeste) (c) = if (x<c && y<c) then (x - 1, y) else error "fora da area"





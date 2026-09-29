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




--7

data Figura
  = Circulo Ponto Double      -- centro, raio
  | Rectangulo Ponto Ponto    -- canto superior esquerdo, canto inferior direito
  | Quadrado Ponto Double     -- canto superior esquerdo, lado
  deriving (Show, Eq)


-- (a) Verifica se um ponto está dentro de uma figura (margens incluídas)
dentro :: Ponto -> Figura -> Bool

dentro (px, py) (Circulo (cx, cy) raio) =
    distanciaAoCentro <= raio
  where
    distanciaAoCentro = sqrt ((px - cx) ** 2 + (py - cy) ** 2)

dentro (px, py) (Rectangulo (esq, topo) (dir, base)) =
    entre esq dir px && entre base topo py

dentro (px, py) (Quadrado (esq, topo) lado) =
    entre esq dir px && entre base topo py
  where
    dir  = esq + lado
    base = topo - lado


-- (b) Calcula o menor quadrado que contém a figura
menorQuadrado :: Figura -> Figura

-- Um quadrado já é o seu próprio menor quadrado
menorQuadrado quadrado@(Quadrado _ _) = quadrado

-- Mantém o canto superior esquerdo; o lado é o maior entre largura e altura
menorQuadrado (Rectangulo (esq, topo) (dir, base)) =
    Quadrado (esq, topo) (max largura altura)
  where
    largura = dir - esq
    altura  = topo - base

-- O lado é o diâmetro; o canto superior esquerdo fica a "raio" para a esquerda e para cima do centro
menorQuadrado (Circulo (cx, cy) raio) =
    Quadrado (cx - raio, cy + raio) (2 * raio)


-- Função auxiliar: verifica se um valor está no intervalo [minimo, maximo]
entre :: Double -> Double -> Double -> Bool
entre minimo maximo valor = minimo <= valor && valor <= maximo


-- (c) Calcula o maior círculo contido numa figura
maiorCirculo :: Figura -> Figura

-- Um círculo já é o seu próprio maior círculo
maiorCirculo circulo@(Circulo _ _) = circulo

-- O diâmetro é o lado; o centro fica a meio do quadrado
maiorCirculo (Quadrado (esq, topo) lado) =
    Circulo (esq + raio, topo - raio) raio
  where
    raio = lado / 2

-- O diâmetro é o menor entre largura e altura;
-- o círculo fica encostado ao lado esquerdo e ao lado superior
maiorCirculo (Rectangulo (esq, topo) (dir, base)) =
    Circulo (esq + raio, topo - raio) raio
  where
    largura = dir - esq
    altura  = topo - base
    raio    = min largura altura / 2


-- (d) Verifica se a primeira figura está contida na segunda
contida :: Figura -> Figura -> Bool

-- Círculo dentro de círculo: distância entre centros + raio menor <= raio maior
contida (Circulo (x1, y1) r1) (Circulo (x2, y2) r2) =
    distanciaCentros + r1 <= r2
  where
    distanciaCentros = sqrt ((x1 - x2) ** 2 + (y1 - y2) ** 2)

-- Rectângulo/quadrado dentro de círculo: os 4 cantos têm de estar dentro do círculo
contida figura circulo@(Circulo _ _) =
    all (\canto -> dentro canto circulo) (cantos figura)

-- Qualquer figura dentro de rectângulo/quadrado:
-- a caixa envolvente da figura tem de estar dentro da caixa da outra
contida figura1 figura2 =
    esq2 <= esq1 && dir1 <= dir2 && base2 <= base1 && topo1 <= topo2
  where
    (esq1, topo1, dir1, base1) = limites figura1
    (esq2, topo2, dir2, base2) = limites figura2


-- Funções auxiliares

-- Devolve (esquerda, topo, direita, base) da caixa envolvente de uma figura
limites :: Figura -> (Double, Double, Double, Double)
limites (Circulo (cx, cy) raio) = (cx - raio, cy + raio, cx + raio, cy - raio)
limites (Rectangulo (esq, topo) (dir, base)) = (esq, topo, dir, base)
limites (Quadrado (esq, topo) lado) = (esq, topo, esq + lado, topo - lado)

-- Devolve os quatro cantos da caixa envolvente
cantos :: Figura -> [Ponto]
cantos figura =
    [(esq, topo), (dir, topo), (dir, base), (esq, base)]
  where
    (esq, topo, dir, base) = limites figura
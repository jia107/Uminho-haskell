type Ponto = (Double, Double)

data Figura
    = Circulo Ponto Double
    | Retangulo Ponto Ponto
    | Quadrado Ponto Double deriving (Show,Eq)

-- 7a

dentro :: Ponto -> Figura -> Bool

dentro (x, y) (Circulo (cx, cy) r)
  = ((cx - x) ** 2 + (cy - y) ** 2) <= (r ** 2)

dentro (x, y) (Retangulo (x1, y1)(x2, y2))
  = x >= x1 && x <= x2 && y <= y1 && y >= y2

dentro (x, y) (Quadrado (x1, y1) l)
  = x >= x1 && x <= x1 + l && y <= y1 && y >= y1 - l

--7b

menorQuadrado :: Figura -> Figura

menorQuadrado (Circulo (cx, cy) r)
  = Quadrado (cx - r, cy + r) (2 * r)


-- fica se por aqui, tenho preguica, acabou o ex 7
-- hora de avancar
-- tem na LI-ficha2

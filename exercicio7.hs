type Ponto = (Double, Double)

data Figura 
    = Circulo Ponto Double
    | Retangulo Ponto Ponto
    | Quadrado Ponto Double deriving (Show,Eq)

-- 7a

dentro :: Ponto -> Figura -> Bool

dentro (px, py) (Circulo (cx, cy) raio) = distanciaAoCentro <= raio
  where
    distanciaAoCentro = sqrt ((px - cx) ** 2 + (py - cy) ** 2)

dentro (px, py) (Retangulo (ex, ey) (dx, dy)) = entre ex dx px && entre dy ey py

dentro (px, py) (Quadrado (qx, qy) lado) = px <= (qx + lado) && py >= (qy - lado) && px >= (qx) && py <= (qy)

--auxiliar
entre :: Double -> Double -> Double -> Bool
entre minimo maximo meio = minimo <= meio && meio <= maximo
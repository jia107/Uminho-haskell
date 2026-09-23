import Text.XHtml (base)
--1.a

perimCirc :: Double -> Double
perimCirc n = n * 2 * pi

--1.b

type Distancia = Double

type Ponto = (Double, Double)

dist :: Ponto -> Ponto -> Distancia

dist (x1, y1) (x2, y2) = sqrt((x1 - x2)^2 + (y1 - y2)^2)


--1.c

primUlt :: [a] -> (a, a)

primUlt xs = (head xs, last xs)


--1.d

multiplo :: Int -> Int -> String

multiplo m n = if mod m n == 0 then "Multiplo" else "Nao multiplo"
                              


--1.e

trumcaImpar :: [a] -> [a]

trumcaImpar xs = 
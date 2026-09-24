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

multiplo m n = if mod m n == 0 
                then "Multiplo" 
                else "Nao multiplo"
                              


--1.e

truncaImpar :: [a] -> [a]

truncaImpar xs =  let a = length xs
                    in if mod a 2 == 0 
                        then xs 
                        else tail xs


--1.f

max2 :: Int -> Int -> Int

max2 a b = if a > b then a
            else if b > a then b
            else a


--1.g 

max3 :: Int -> Int -> Int -> Int

max3 a b c = if max2 a b > c then max2 a b
            else if c > max2 a b then c
            else a


--2.a

nRaizes :: Double -> Double -> Double -> [Double]

nRaizes a b c = let raiz1 = -b + sqrt(b ^ 2 - 4 * a * c) / (2 * a)
                    raiz2 = -b - sqrt(b ^ 2 - 4 * a * c) / (2 * a)
                 in if a == 0 then [-c / b]
                    else if b ^ 2 - 4 * a * c < 0
                            then error "b ^ 2 - 4 * a * c < 0"
                            else[raiz1, raiz2]

        
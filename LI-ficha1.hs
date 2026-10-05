-- exercicio 2
-- m)

f :: (Int, Int) -> Int -> (Int, Int)
-- recebe as coordenadas do vértice superior esquerdo de
-- um quadrado e o comprimento do lado
-- (os lados são paralelos aos eixos),
-- e calcula as coordenadas do vértice inferior direito.

f (x, y) lado = (x + lado, y - lado)

--n)

--Vamos representar um ponto como um par de coordenadas inteiras num plano
--cartesiano. Vamos representar um quadrado como um par, em que a primeira
--componente é vértice do canto superior esquerdo, e a segunda componente é o
--comprimento do lado. Considere que os lados do quadrado estão paralelos aos
--eixos. Defina uma função que recebe dois quadrados e calcula a área do quadrado
--"mais acima"no plano cartesiano (com maior ordenada). Em caso de igualdade,
--indique a menor área.

g :: ((Int, Int), Int) -> ((Int, Int), Int) -> Int
g ((x1, y1), l1) ((x2, y2), l2)
  = if y1 == y2 then menorArea l1 l2
    else if y1 > y2 then l1 ^ 2
    else l2 ^ 2


menorArea l1 l2 = min l1 l2 ^ 2

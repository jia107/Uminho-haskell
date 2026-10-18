-- 1


alterna :: Num a => Int -> a -> [a]

alterna 0 v = []
alterna n v = v  : alterna (n - 1) (-v)

type Matriz a = [[a]]

-- / __Questao 1__

-- / Retorna um elemento da lista da posicao indicada
(!!) :: Int -> [a] -> a

-- / Une as duas listas
concat :: [a] -> [a] ->[a]

-- / Pega nos n primeiros elementos da lista
take :: Int -> [a] -> [a]

drop :: Int -> [a] -> [a]
-- / Tira os n primeiros elementos da lista


-- / Separa uma lista em duas, com a primeira lista separada de n elementos
splitAt :: Int -> [a] -> ([a], [a])


-- / Junta as duas listas em uma lista de pares
zip :: [a] -> [b] -> [(a, b)]

-- / O inverso de zip
unzip :: [(a, b)] -> ([a], [b])

-- / Repete um elemento n vezes
replicate :: Int -> a -> [a]

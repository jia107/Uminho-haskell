module Main where

import Graphics.Gloss.Interface.Pure.Game

data Estado = Estado
estadoInicial :: Estado
estadoInicial = Estado

main :: IO ()
main = play
     janela
     corFundo
     fps
     estadoInicial
     desenhaEstado
     reageEvento
     reageTempo
     where
       janela = InWindow "Exemplo" (800, 600) (100, 100)
       corFundo = white
       fps = 30

desenhaEstado :: Estado -> Picture
desenhaEstado Estado = Blank

reageEvento :: Event -> Estado -> Estado
reageEvento _ estado = estado

reageTempo :: Float -> Estado -> Estado
reageTempo _ estado = estado

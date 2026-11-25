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
desenhaEstado Estado = pictures
  [ color red (circleSolid 50)                                         -- 中间红色实心圆
  , translate (-250) 150 (color blue (rectangleSolid 120 80))          -- 左上蓝色矩形
  , translate 250 150 (color green (polygon [(0,0),(100,0),(50,80)]))  -- 右上绿色三角形
  , translate 0 (-150) (rotate 30 (rectangleWire 150 50))              -- 下方旋转的矩形框
  , translate (-300) (-250) (scale 0.2 0.2 (text "Ola Haskell"))       -- 左下文字
  ]


reageEvento :: Event -> Estado -> Estado
reageEvento _ estado = estado

reageTempo :: Float -> Estado -> Estado
reageTempo _ estado = estado

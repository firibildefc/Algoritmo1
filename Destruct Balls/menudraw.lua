function menudraw_load()
  menuinicial=love.graphics.newImage('imgs/space_menu.png')
  botao1={
    xmin=150,
    ymin=430,
    xmax=390,
    ymax=490,
    largura=240,
    altura=60
  }
  botao2={
    xmin=435,
    ymin=430,
    xmax=675,
    ymax=490,
    largura=240,
    altura=60
  }
end
function menudraw_update()
  function love.mousepressed(mousex, mousey, button, isTouch)
    if mousex >= botao1.xmin and mousex <= botao1.xmax and mousey >= botao1.ymin and mousey <= botao1.ymax and button == 1 then
      jogo = true
    elseif mousex >= botao2.xmin and mousex <= botao2.xmax and mousey >= botao2.ymin and mousey <= botao2.ymax and button == 1 then
      love.event.quit()
    end
  end
end
function menudraw_draw()
  love.graphics.rectangle('fill', botao1.xmin, botao1.ymin, botao1.largura, botao1.altura)
  love.graphics.rectangle('fill', botao2.xmin, botao2.ymin, botao2.largura, botao2.altura)
  love.graphics.draw(menuinicial, x, y, r, sx, sy, ox, oy, kx, ky)
end

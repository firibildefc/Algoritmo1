require 'game'
require 'menudraw'
jogo = false
function love.load()
  menudraw_load()
  game_load()
end
function love.update(dt)
  if not jogo then
    menudraw_update()
  elseif jogo then
    game_update()
  end
end
function love.draw()
  if not jogo then
    menudraw_draw()
  elseif jogo then
    game_draw()
  end
end

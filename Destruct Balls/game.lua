require "balls"
require "menu"
require "AnAL"
require "free_fall"
require "util"
perdeu  = false
prox_nivel = 10
pontos = 0
balls = nil
musica= nil
background = nil
pacificoFilename = "fonts/8bits.ttf"--- fote de texto
function game_load()
  love.window.setTitle("Destruct balls")--- nome do jogo
  math.randomseed(os.time()) ---- gera bolas aleatorias
  balls = newBalls(3, 30)
  balls:initAllBalls()
  fundo_tela = love.graphics.newImage("imgs/space.png")
  menu= love.graphics.newImage("imgs/space_menu.png")
  bot1=love.graphics.newImage("imgs/bot1.png")
  bot3=love.graphics.newImage("imgs/bot3.png")
  musica = love.audio.newSource("sound/StarWars.mp3", "stream")
  musica:setLooping(true)
  love.audio.play(musica)
end
function game_update()
  function love.keypressed(key)
    if key == "escape" then
      love.event.quit()
    end
  end
      perdeu = balls:updateBalls(dt)


  function love.mousepressed(x, y, button, istouch)
    pontos = pontos + balls:checkClickBalls(x, y)
    if (pontos >= prox_nivel) then
      balls:IncNumBalls()
      prox_nivel  = prox_nivel  + 10
    end

    if perdeu then -- quando o jogador não estoura as bolas faz com que reinicie todo o jogo e e sua pontuação zere!!!
      balls:reinit()
      perdeu = false
      pontos = 0
      prox_nivel  = 10
    end
  end
end
function game_draw()
  love.graphics.draw(fundo_tela, 0, 0)---fundo de tela espacial!!!!

	  if not perdeu then --- se o jogador continuar estourando as bolas faz com que gere mais bolas!!!
	    balls:drawBalls()
	  	else
	  	--faz com que gere na tela GAME OVER!!!! Aplicada com a fote GearsOfPeace
		  love.graphics.setColor(0 ,255, 0, 255)
		  love.graphics.setFont(love.graphics.newFont(pacificoFilename, 20))---fonte e tamanho
		  love.graphics.print("GAME OVER CLIQUE PARA JOGAR",150,300.)

		end

		  love.graphics.setColor(0, 255, 0, 255)--- cor da fonte "PONTOS"
		  love.graphics.setFont(love.graphics.newFont(pacificoFilename, 20))---formato da fonte e o seu tamanho
		  love.graphics.print("PONTOS  " .. pontos, 0, 0)--posição x e y aonde vai aparecer sua pontuação na tela!!!
		  love.graphics.setColor(255, 255, 255, 255)--- cores do fundo de tela!!!!
end

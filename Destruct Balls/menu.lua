

local menu_jogo={}
menu_jogo.index = menu_jogo

function newmenujogo( )
	local a = {}
	a.fontegame="fonts/8bits.ttf"
	a.option = {}
	return setmetatable(a,menu_jogo)
end

--function menujogo:update(dt)
	
--end



function menu_jogo:addOptions(x ,y,text )
	local cor_quadrado ={0,128,128}
	local options = newmenuopcoes(color,x , y , text)
	self . options [#self.options + 1] =options
end


function menu_jogo:drawOptions(index )
local options = self.options[index]
--love.graphics.setColor(0,0,0)
love.graphics.setColor(option.color)
love.graphics.rectangle("fill",options.x,options.y,250,250)
love.graphics.setColor(255,255,255)
love.graphics.setfont(love.graphics.newfont(self.fontegame,20))
love.graphics.print(options.text,options.x,options + 20-15 )
end

function menu_jogo:draw()
	for index = 1,#self.options do 
		self.drawOptions(self,index)
	end 	
end 
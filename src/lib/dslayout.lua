---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Nawias.
--- DateTime: 10.04.2022 16:14
---
dslayout={}dslayout.color={r=0.2,g=0.2,b=0.2,a=1}dslayout.title="3DS Demo"dslayout.bottomScreen=nil;function dslayout:init(a)dslayout.bottomScreen=love.graphics.newCanvas(320,240)if a~=nil and a.color~=nil then dslayout.color=a.color end;if a~=nil and a.title~=nil then dslayout.title=a.title end;if love.window.setTitle~=nil then love.window.setTitle(dslayout.title)end end;function dslayout:draw(b,c,d)if b~="bottom"then c()end;if b==nil then b="dbottom"love.graphics.setCanvas(dslayout.bottomScreen)love.graphics.clear()end;if b=="bottom"or b=="dbottom"then love.graphics.setColor(0,0,0)love.graphics.rectangle("fill",0,0,400,240)love.graphics.setColor(1,1,1)d()end;if b=="dbottom"then local e,f,g,h=love.graphics.getColor()love.graphics.setCanvas()love.graphics.draw(dslayout.bottomScreen,40,240)love.graphics.setColor(dslayout.color.r,dslayout.color.g,dslayout.color.b,dslayout.color.a)love.graphics.rectangle("fill",0,240,40,240)love.graphics.rectangle("fill",360,240,40,240)love.graphics.setColor(e,f,g,h)end end;function dslayout:mousemoved(i,j,k,l,m)if i<40 or j<240 or i>360 then return end;if love.mouse~=nil and not love.mouse.isDown(1)then return end;if love.touchmoved~=nil then love.touchmoved(0,i-40,j-240,k,l,1)end end;function dslayout:mousepressed(i,j,n,m,o)if i<40 or j<240 or i>360 then return end;if n~=1 then return end;if love.touchpressed~=nil then love.touchpressed(0,i-40,j-240,0,0,1)end end;function dslayout:mousereleased(i,j,n,m,o)if i<40 or j<240 or i>360 then return end;if n~=1 then return end;if love.touchreleased~=nil then love.touchreleased(0,i-40,j-240,0,0,1)end end;love.graphics.set3D=love.graphics.set3D or function()end;love.graphics.setScreen=love.graphics.setScreen or function()end;love.graphics.setDepth=love.graphics.setDepth or function()end
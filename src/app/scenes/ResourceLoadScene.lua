--
-- Author: mr_zh
-- Date: 2015-07-16 11:38:44
--
local ui = require("framework.ui")

local ResourceLoadScene = class("ResourceLoadScene",function()
	return display.newScene("ResourceLoadScene");
end)

function ResourceLoadScene:ctor()
	self:init()
end
function ResourceLoadScene:init()
	--背景
	local bg = display.newSprite("bg1.png")
	local scaleX = display.width/bg:getContentSize().width
	local scaleY = display.height/bg:getContentSize().height
	bg:setScaleX(scaleX)
	bg:setScaleY(scaleY)
	bg:setPosition(display.cx,display.cy)
	self:addChild(bg)

	--进度条
	local timer = cc.ProgressTimer:create(cc.Sprite:create("loading.png"))
	timer:setPosition(display.cx,display.cy)
	timer:setBarChangeRate(cc.p(1,0))
	timer:setType(display.PROGRESS_TIMER_BAR)
	timer:setMidpoint(cc.p(0,0.5))--基准点
	timer:setPercentage(0)
	timer:addTo(self)

	local progress = cc.ProgressTo:create(0.7,100)
	local call = cc.CallFunc:create(function()
		local scene = require("app.scenes.StartScene").new()
		local turn = cc.TransitionPageTurn:create(1,scene,false)
		cc.Director:getInstance():replaceScene(turn)
end)
	local seq = cc.Sequence:create(progress,call)
	timer:runAction(seq)

	--label:loading
	
	 -- local lab = ui.newTTFLabel({text = "loading", size = 40, color = cc.c3b(0, 0, 200)})
	 -- lab:setPosition(cc.p(display.cx, display.cy+60))
	 -- lab:addTo(self)


	local label = cc.ui.UILabel.new({text = "loading...",size = 40, color = cc.c3b(255,255,0)})
	:pos(display.cx,display.cy+60)
	:addTo(self)
end

function ResourceLoadScene:onEnter()
end

function ResourceLoadScene:onExit()
end

return ResourceLoadScene
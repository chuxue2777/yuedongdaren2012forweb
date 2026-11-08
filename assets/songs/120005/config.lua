commonState = true;

function InitBackLayer(filepath)
	
	backLayer = cocos2d.CCLayer:node();
	local mainScene = GameScene:getMainScene();
	mainScene:addChild(backLayer,0,1);

    collectgarbage("setpause",100);
    collectgarbage("setstepmul",5000);


	texture = cocos2d.CCTextureCache:sharedTextureCache():addImage(filepath .. "/1_2.png");
	
	
	sprite1_1 = cocos2d.CCSprite:spriteWithFile(filepath .. "/1_1.png");
	sprite1_1:setAnchorPoint(cocos2d.CCPoint(0,1));
	backLayer:addChild(sprite1_1);
	sprite1_1:setPosition(cocos2d.CCPoint(0,480));
	
	
	sprite1_2_1 = cocos2d.CCSprite:spriteWithTexture(texture,cocos2d.CCRectMake(0,0,texture:getContentSize().width/2,texture:getContentSize().height));
	sprite1_2_1:setAnchorPoint(cocos2d.CCPoint(0,1));
	backLayer:addChild(sprite1_2_1);
	sprite1_2_1:setPosition(cocos2d.CCPoint(0,480));
	sprite1_2_1:setIsVisible(false);


	sprite1_2_2 = cocos2d.CCSprite:spriteWithTexture(texture,cocos2d.CCRectMake(texture:getContentSize().width/2,0,texture:getContentSize().width/2,texture:getContentSize().height));
	sprite1_2_2:setAnchorPoint(cocos2d.CCPoint(0,1));
	backLayer:addChild(sprite1_2_2);

	sprite1_2_2:setIsVisible(false);	

	sprite1_3 = cocos2d.CCSprite:spriteWithFile(filepath .. "/1_3.png");
	sprite1_3:setAnchorPoint(cocos2d.CCPoint(0,1));
	backLayer:addChild(sprite1_3);
	sprite1_3:setPosition(cocos2d.CCPoint(0,480));
	sprite1_3:setIsVisible(false);	
	
	sprite2_1 = cocos2d.CCSprite:spriteWithFile(filepath .. "/2_1.png");
	sprite2_1:setAnchorPoint(cocos2d.CCPoint(0,1));
	backLayer:addChild(sprite2_1);
	sprite2_1:setIsVisible(false);	
		
	sprite2_2 = cocos2d.CCSprite:spriteWithFile(filepath .. "/2_2.png");
	sprite2_2:setAnchorPoint(cocos2d.CCPoint(0,1));
	backLayer:addChild(sprite2_2);	
	sprite2_2:setIsVisible(false);	
	
	sprite2_3 = cocos2d.CCSprite:spriteWithFile(filepath .. "/2_3.png");
	sprite2_3:setAnchorPoint(cocos2d.CCPoint(0.5,0));
	backLayer:addChild(sprite2_3);	
	sprite2_3:setIsVisible(false);	
		
	cocos2d.CCScheduler:sharedScheduler():scheduleScriptFunc("shuaicong_tick", 0.01, false);
	PlayBg1();
end

function PlayBg1()
	
	sprite2_1:stopAllActions();	
	sprite2_1:setIsVisible(false);	
	sprite2_2:stopAllActions();	
	sprite2_2:setIsVisible(false);
	sprite2_3:stopAllActions();	
	sprite2_3:setIsVisible(false);
	
	
	sprite1_1:setIsVisible(true);
	sprite1_2_1:setPosition(cocos2d.CCPoint(0,480));
	sprite1_2_1:setIsVisible(true);
	sprite1_2_2:setPosition(cocos2d.CCPoint(texture:getContentSize().width/2,480));
	sprite1_2_2:setIsVisible(true);	
	sprite1_3:setIsVisible(true);
end



function PlayBg2()
	

	sprite1_1:setIsVisible(false);
	sprite1_2_1:setIsVisible(false);
	sprite1_2_2:setIsVisible(false);	
	sprite1_3:setIsVisible(false);
	
	sprite2_1:setPosition(cocos2d.CCPoint(-30,400));	
	sprite2_1:setIsVisible(true);	
	sprite2_2:setPosition(cocos2d.CCPoint(-30,560));
	sprite2_2:setIsVisible(true);
	sprite2_3:setPosition(cocos2d.CCPoint(170,190));
	sprite2_3:setIsVisible(true);	
				
	action21();	
	action22();	
	action23();
end	


function action21()

	local action = cocos2d.CCSequence:actionOneTwo(cocos2d.CCMoveBy:actionWithDuration(1,cocos2d.CCPoint(-25,0)), cocos2d.CCMoveBy:actionWithDuration(1,cocos2d.CCPoint(25,0)));
	sprite2_1:runAction(cocos2d.CCRepeatForever:actionWithAction(action));
	
end


function action22()
	local action = cocos2d.CCSequence:actionOneTwo(cocos2d.CCMoveBy:actionWithDuration(1,cocos2d.CCPoint(25,0)), cocos2d.CCMoveBy:actionWithDuration(1,cocos2d.CCPoint(-25,0)));
	sprite2_2:runAction(cocos2d.CCRepeatForever:actionWithAction(action));
	
end

function action23()
	local action = cocos2d.CCSequence:actionOneTwo(cocos2d.CCRotateBy:actionWithDuration(1,8),cocos2d.CCRotateBy:actionWithDuration(1,-8));
	sprite2_3:runAction(cocos2d.CCRepeatForever:actionWithAction(action));
	
end


function shuaicong_tick(dt)
	if commonState then
		local scroll_x = 100.0 * dt;
		sprite1_2_1:setPosition(cocos2d.CCPoint(sprite1_2_1:getPosition().x+scroll_x,480));
		sprite1_2_2:setPosition(cocos2d.CCPoint(sprite1_2_2:getPosition().x+scroll_x,480));
	
		if sprite1_2_1:getPosition().x >= 320 then
			sprite1_2_1:setPosition(cocos2d.CCPoint(-(texture:getContentSize().width/2-sprite1_2_2:getPosition().x),480));
		end	
	
		if sprite1_2_2:getPosition().x >= 320 then
			sprite1_2_2:setPosition(cocos2d.CCPoint(-(texture:getContentSize().width/2-sprite1_2_1:getPosition().x),480));
		end
	end
end

function backLayerCommonState()
	commonState = true;
	PlayBg1();
end

function backlayerSpecialState()
	commonState = false;
	PlayBg2();
end


function releaseBackLayer()
	commonState = false;
    cocos2d.CCTextureCache:sharedTextureCache():removeTexture(texture);
	backLayer:removeAllChildrenWithCleanup(true);
	backLayer:removeFromParentAndCleanup(true);
	backLayer = nil;
	collectgarbage(); 
	
end





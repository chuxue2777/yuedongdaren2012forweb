
function InitBackLayer(filepath)

	backLayer = cocos2d.CCLayer:node();
	local mainScene = GameScene:getMainScene();
	mainScene:addChild(backLayer,0,1);
	
	sprite1_2 = cocos2d.CCSprite:spriteWithFile(filepath .. "/1_2.png");
	sprite1_2:setAnchorPoint(cocos2d.CCPoint(0,1));
	sprite1_2:setPosition(cocos2d.CCPoint(0,480));
	backLayer:addChild(sprite1_2);
	sprite1_2:setIsVisible(false);
	
	sprite1_1 = cocos2d.CCSprite:spriteWithFile(filepath .. "/1_1.png");
	sprite1_1:setAnchorPoint(cocos2d.CCPoint(0.5,1));
	backLayer:addChild(sprite1_1);
	sprite1_1:setPosition(cocos2d.CCPoint(160,490));
	sprite1_1:setIsVisible(false);
	

	
    sprite1_3 = cocos2d.CCSprite:spriteWithFile(filepath .. "/1_3.png");
	sprite1_3:setAnchorPoint(cocos2d.CCPoint(0,1));
	sprite1_3:setPosition(cocos2d.CCPoint(-30,500));
	backLayer:addChild(sprite1_3);
	sprite1_3:setIsVisible(false);
	


	sprite1_4 = {};
	sprite1_4_point = {cocos2d.CCPoint(40,500),cocos2d.CCPoint(130,500),cocos2d.CCPoint(170,500),cocos2d.CCPoint(230,500),cocos2d.CCPoint(340,500)};
	sprite1_4_time = {1,0.8,1,0.4,1,0.5};
	
	for i=1,5 do
		sprite1_4[i]=cocos2d.CCSprite:spriteWithFile(filepath .. "/1_4.png");
		backLayer:addChild(sprite1_4[i]);
		sprite1_4[i]:setIsVisible(false);
	end
	
	sprite2_1 = cocos2d.CCSprite:spriteWithFile(filepath .. "/2_1.png");
	sprite2_1:setAnchorPoint(cocos2d.CCPoint(0.5,1));
	sprite2_1:setPosition(cocos2d.CCPoint(160,490));
	backLayer:addChild(sprite2_1);
	sprite2_1:setIsVisible(false);
	
	
	
	sprite2_5 = {};
	sprite2_5_point = {cocos2d.CCPoint(100,420),cocos2d.CCPoint(200,450),cocos2d.CCPoint(20,400),cocos2d.CCPoint(100,380),cocos2d.CCPoint(170,200),cocos2d.CCPoint(10,300),cocos2d.CCPoint(210,300)};
	sprite2_5_sacle = {1,0.8,1,0.4,1,0.5,0.7};
	for i=1,7 do
		sprite2_5[i]=cocos2d.CCSprite:spriteWithFile(filepath .. "/2_5.png");
		backLayer:addChild(sprite2_5[i]);
		sprite2_5[i]:setIsVisible(false);
		sprite2_5[i]:setScale(sprite2_5_sacle[i]);
		sprite2_5[i]:setPosition(sprite2_5_point[i]);
	end
	
	
	sprite2_7 = {};
	sprite2_7_point = {cocos2d.CCPoint(100,300),cocos2d.CCPoint(200,450),cocos2d.CCPoint(20,380),cocos2d.CCPoint(80,280),cocos2d.CCPoint(160,230),cocos2d.CCPoint(60,360),cocos2d.CCPoint(210,200)};
	sprite2_7_sacle = {1,0.8,1,0.4,1,0.5,0.7};
	for i=1,7 do
		sprite2_7[i]=cocos2d.CCSprite:spriteWithFile(filepath .. "/2_7.png");
		backLayer:addChild(sprite2_7[i]);
		sprite2_7[i]:setIsVisible(false);
		sprite2_7[i]:setScale(sprite2_7_sacle[i]);
		sprite2_7[i]:setPosition(sprite2_7_point[i]);
	end
	
	sprite2_6_3 = cocos2d.CCSprite:spriteWithFile(filepath .. "/2_6.png");
	backLayer:addChild(sprite2_6_3);
	sprite2_6_3:setAnchorPoint(cocos2d.CCPoint(0,1));
	sprite2_6_3:setIsVisible(false);	
	
	
	sprite2_6_1 = cocos2d.CCSprite:spriteWithFile(filepath .. "/2_6.png");
	backLayer:addChild(sprite2_6_1);
	sprite2_6_1:setAnchorPoint(cocos2d.CCPoint(0,1));
	sprite2_6_1:setIsVisible(false);
	
	sprite2_6_2 = cocos2d.CCSprite:spriteWithFile(filepath .. "/2_6.png");
	backLayer:addChild(sprite2_6_2);
	sprite2_6_2:setAnchorPoint(cocos2d.CCPoint(0,1));
	sprite2_6_2:setIsVisible(false);	
	
	PlayBg2();
end

function PlayBg1()

	sprite2_1:setIsVisible(false);
	sprite2_6_1:setIsVisible(false);
	sprite2_6_2:setIsVisible(false);
	sprite2_6_3:setIsVisible(false);

    sprite2_6_1:stopAllActions();
    sprite2_6_2:stopAllActions();

	for i=1,7 do
		sprite2_5[i]:stopAllActions();
		sprite2_7[i]:stopAllActions();
		sprite2_5[i]:setIsVisible(false);		
		sprite2_7[i]:setIsVisible(false);
		
	end

	sprite1_1:setIsVisible(true);	
	sprite1_2:setIsVisible(true);	
	sprite1_3:setIsVisible(true);
	for i=1,5 do
		sprite1_4[i]:setIsVisible(true);
		local action = cocos2d.CCSequence:actionOneTwo(cocos2d.CCDelayTime:actionWithDuration(sprite1_4_time[i]),  cocos2d.CCPlace:actionWithPosition(sprite1_4_point[i]));
		action = cocos2d.CCSequence:actionOneTwo(action, cocos2d.CCMoveBy:actionWithDuration(3,cocos2d.CCPoint(0,-400)));
		sprite1_4[i]:runAction(cocos2d.CCRepeatForever:actionWithAction(action));

	end
	action11();
	
end


function action11()

	local action = cocos2d.CCSequence:actionOneTwo(cocos2d.CCFadeTo:actionWithDuration(2,255),cocos2d.CCDelayTime:actionWithDuration(2));	
	action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCFadeTo:actionWithDuration(2,125));	
	action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(2));	
	sprite1_1:runAction(cocos2d.CCRepeatForever:actionWithAction(action));
end



function PlayBg2()

	sprite1_1:stopAllActions();
	sprite1_1:setIsVisible(false);
	sprite1_2:setIsVisible(false);	
	sprite1_3:setIsVisible(false);
	for i=1,5 do
		sprite1_4[i]:stopAllActions();
		sprite1_4[i]:setIsVisible(false);
	end
	
	for i=1,7 do
		sprite2_5[i]:setIsVisible(true);
		sprite2_5[i]:runAction(cocos2d.CCRepeatForever:actionWithAction(cocos2d.CCRotateBy:actionWithDuration(1,360)));
		
		
		sprite2_7[i]:setIsVisible(true);
		
		sprite2_7[i]:runAction(cocos2d.CCRepeatForever:actionWithAction(cocos2d.CCRotateBy:actionWithDuration(1,360)));
		
	end
	
	sprite2_1:setIsVisible(true);					
	sprite2_6_1:setIsVisible(true);
	sprite2_6_2:setIsVisible(true);
	sprite2_6_3:setIsVisible(true);
	sprite2_6_1:setPosition(cocos2d.CCPoint(330,600));
    sprite2_6_2:setPosition(cocos2d.CCPoint(330,600));
	sprite2_6_3:setPosition(cocos2d.CCPoint(-10,500));
	action26111();
end	


function action26111()	

	sprite2_6_3:setIsVisible(true);
	sprite2_6_2:setFlipX(false);
	sprite2_6_2:setPosition(cocos2d.CCPoint(330,600));
	local action = cocos2d.CCSpawn:actionOneTwo(cocos2d.CCFadeIn:actionWithDuration(2),cocos2d.CCMoveTo:actionWithDuration(2,cocos2d.CCPoint(-10,500)));
	action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(1));
	action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCCallFunc:actionWithScriptFuncName("action2611"));
	action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCFadeOut:actionWithDuration(0.5));
	sprite2_6_2:runAction(action);
	
end

function action261()	

	sprite2_6_1:setFlipX(false);
	sprite2_6_1:setPosition(cocos2d.CCPoint(330,600));
	local action = cocos2d.CCSequence:actionOneTwo(cocos2d.CCDelayTime:actionWithDuration(0.1),cocos2d.CCMoveTo:actionWithDuration(2,cocos2d.CCPoint(-10,500)));
	action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCCallFunc:actionWithScriptFuncName("action262"));
	sprite2_6_1:runAction(action);
	
end


function action2611()	
	sprite2_6_3:setIsVisible(false);
	sprite2_6_1:setPosition(cocos2d.CCPoint(-434,600));
	sprite2_6_1:setFlipX(true);
	local action = cocos2d.CCSequence:actionOneTwo(cocos2d.CCDelayTime:actionWithDuration(0.1),cocos2d.CCMoveTo:actionWithDuration(2,cocos2d.CCPoint(-110,500)));
	action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCCallFunc:actionWithScriptFuncName("action2622"));
	sprite2_6_1:runAction(action);

end


function action262()
	
	sprite2_6_2:setFlipX(false);
	sprite2_6_2:setPosition(cocos2d.CCPoint(330,600));
	local action = cocos2d.CCSpawn:actionOneTwo(cocos2d.CCFadeIn:actionWithDuration(2),cocos2d.CCMoveTo:actionWithDuration(2,cocos2d.CCPoint(-10,500)));
	action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(1));
	action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCCallFunc:actionWithScriptFuncName("action2611"));
	action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCFadeOut:actionWithDuration(0.5));
	sprite2_6_2:runAction(action);
end

function action2622()
	sprite2_6_2:setFlipX(true);
	sprite2_6_2:setPosition(cocos2d.CCPoint(-434,600));
	local action = cocos2d.CCSpawn:actionOneTwo(cocos2d.CCFadeIn:actionWithDuration(2),cocos2d.CCMoveTo:actionWithDuration(2,cocos2d.CCPoint(-110,500)));
	action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(1));
	action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCCallFunc:actionWithScriptFuncName("action261"));
	action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCFadeOut:actionWithDuration(0.5));
	sprite2_6_2:runAction(action);
end


function backLayerCommonState()
	PlayBg2();
end

function backlayerSpecialState()
	PlayBg1();
end

function releaseBackLayer()
	backLayer:removeAllChildrenWithCleanup(true);
	backLayer:removeFromParentAndCleanup(true);
	backLayer = nil;
	collectgarbage(); 
end




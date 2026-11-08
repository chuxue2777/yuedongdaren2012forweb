




function InitBackLayer(filepath)
	
	backLayer = cocos2d.CCLayer:node();
	local mainScene = GameScene:getMainScene();
	mainScene:addChild(backLayer,0,1);
	
	sprite1_1 = cocos2d.CCSprite:spriteWithFile(filepath .. "/1_1.png");
	sprite1_1:setAnchorPoint(cocos2d.CCPoint(0,1));
	backLayer:addChild(sprite1_1);
	sprite1_1:setPosition(cocos2d.CCPoint(-20,495));
	sprite1_1:setIsVisible(false);
	
	sprite1_2_1 = cocos2d.CCSprite:spriteWithFile(filepath .. "/1_2.png");
	sprite1_2_1:setAnchorPoint(cocos2d.CCPoint(0,1));
	backLayer:addChild(sprite1_2_1);
	sprite1_2_1:setIsVisible(false);
	
	sprite1_2_2 = cocos2d.CCSprite:spriteWithFile(filepath .. "/1_2.png");
	sprite1_2_2:setAnchorPoint(cocos2d.CCPoint(0,1));
	backLayer:addChild(sprite1_2_2);
	sprite1_2_2:setIsVisible(false);

	sprite1_3 = cocos2d.CCSprite:spriteWithFile(filepath .. "/1_3.png");
	sprite1_3:setAnchorPoint(cocos2d.CCPoint(0,1));
	backLayer:addChild(sprite1_3);
	sprite1_3:setIsVisible(false);	

				
	sprite2_1 = cocos2d.CCSprite:spriteWithFile(filepath .. "/2_1.png");
	sprite2_1:setAnchorPoint(cocos2d.CCPoint(0,1));
	backLayer:addChild(sprite2_1);
	sprite2_1:setPosition(cocos2d.CCPoint(0,485));
	sprite2_1:setIsVisible(false);
	
	sprite2_2 = cocos2d.CCSprite:spriteWithFile(filepath .. "/2_2.png");
	sprite2_2:setAnchorPoint(cocos2d.CCPoint(0,1));
	backLayer:addChild(sprite2_2);
	sprite2_2:setIsVisible(false);	
								
	PlayBg2();
end



function PlayBg1()
			
	sprite2_1:setIsVisible(false);	
	sprite2_2:stopAllActions();
	sprite2_2:setIsVisible(false);
	
	sprite1_1:setIsVisible(true);
	sprite1_2_1:setPosition(cocos2d.CCPoint(0,480+140));
	sprite1_2_1:setIsVisible(true);	
	sprite1_2_2:setPosition(cocos2d.CCPoint(-153,440));	
	sprite1_2_2:setIsVisible(true);	
	sprite1_3:setPosition(cocos2d.CCPoint(320,350));
	sprite1_3:setIsVisible(true);
	
	sprite1_2_1:setOpacity(0);
	sprite1_2_1:setOpacity(0);	
	action121();
	action122();
	action13();
end



function action121()
	local action1 = cocos2d.CCSpawn:actionOneTwo(cocos2d.CCFadeIn:actionWithDuration(0.5),cocos2d.CCMoveTo:actionWithDuration(0.5,cocos2d.CCPoint(10,460-30)));
	local action = cocos2d.CCSequence:actionOneTwo(action1,cocos2d.CCDelayTime:actionWithDuration(3));
	local action2 = cocos2d.CCSpawn:actionOneTwo(cocos2d.CCFadeOut:actionWithDuration(0.2),cocos2d.CCMoveTo:actionWithDuration(0.2,cocos2d.CCPoint(0,480+140-30)));
	action = cocos2d.CCSequence:actionOneTwo(action,action2);
	action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(2));
	sprite1_2_1:runAction(cocos2d.CCRepeatForever:actionWithAction(action));
end

function action122()
	local action1 = cocos2d.CCSpawn:actionOneTwo(cocos2d.CCFadeIn:actionWithDuration(0.5),cocos2d.CCMoveTo:actionWithDuration(0.5,cocos2d.CCPoint(10,460-30)));
	local action = cocos2d.CCSequence:actionOneTwo(action1,cocos2d.CCDelayTime:actionWithDuration(3));
	local action2 = cocos2d.CCSpawn:actionOneTwo(cocos2d.CCFadeOut:actionWithDuration(0.2),cocos2d.CCMoveTo:actionWithDuration(0.2,cocos2d.CCPoint(-153,440-30)));
	action = cocos2d.CCSequence:actionOneTwo(action,action2);
	action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(2));	
	sprite1_2_2:runAction(cocos2d.CCRepeatForever:actionWithAction(action));
end

function action13()
	local action = cocos2d.CCSequence:actionOneTwo(cocos2d.CCDelayTime:actionWithDuration(1), cocos2d.CCPlace:actionWithPosition(cocos2d.CCPoint(320,340)));
	action = cocos2d.CCSequence:actionOneTwo(action, cocos2d.CCMoveTo:actionWithDuration(1,cocos2d.CCPoint(-430,340)));
	sprite1_3:runAction(cocos2d.CCRepeatForever:actionWithAction(action));
end

function PlayBg2()
	sprite1_1:setIsVisible(false);
	sprite1_2_1:stopAllActions();
	sprite1_2_2:stopAllActions();		
	sprite1_2_1:setIsVisible(false);	
	sprite1_2_2:setIsVisible(false);
	sprite1_3:stopAllActions();
	sprite1_3:setIsVisible(false);

	sprite2_1:setIsVisible(true);
	sprite2_2:setPosition(cocos2d.CCPoint(-290,460-40));
	sprite2_2:setIsVisible(true);
	action22();
		
end	

function action22()
	local action = cocos2d.CCSequence:actionOneTwo(cocos2d.CCMoveTo:actionWithDuration(2,cocos2d.CCPoint(-20,460-40)), cocos2d.CCMoveTo:actionWithDuration(2,cocos2d.CCPoint(-270,460-40)));
	sprite2_2:runAction(cocos2d.CCRepeatForever:actionWithAction(action));	
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




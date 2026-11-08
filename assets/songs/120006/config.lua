specialState = false;

backLayer = cocos2d.CCLayer:node();
mainScene = GameScene:getMainScene();
mainScene:addChild(backLayer,0,1);

function InitBackLayer(filepath)

    sprite1_2 = cocos2d.CCSprite:spriteWithFile(filepath .. "/1_2.png");
    sprite1_2:setIsVisible(false);
    backLayer:addChild(sprite1_2);

    sprite1_1 = cocos2d.CCSprite:spriteWithFile(filepath .. "/1_1.png");
    sprite1_1:setIsVisible(false);
    backLayer:addChild(sprite1_1);

    sprite1_3_1 = cocos2d.CCSprite:spriteWithFile(filepath .. "/1_3.png");
    sprite1_3_1:setIsVisible(false);
    backLayer:addChild(sprite1_3_1);

    sprite1_3_2 = cocos2d.CCSprite:spriteWithFile(filepath .. "/1_3.png");
    sprite1_3_2:setIsVisible(false);
    backLayer:addChild(sprite1_3_2);

    sprite1_3_3 = cocos2d.CCSprite:spriteWithFile(filepath .. "/1_3.png");
    sprite1_3_3:setIsVisible(false);
    backLayer:addChild(sprite1_3_3);

    sprite1_3_4 = cocos2d.CCSprite:spriteWithFile(filepath .. "/1_3.png");
    sprite1_3_4:setIsVisible(false);
    backLayer:addChild(sprite1_3_4);

    sprite1_4 = cocos2d.CCSprite:spriteWithFile(filepath .. "/1_4.png");
    sprite1_4:setIsVisible(false);
    backLayer:addChild(sprite1_4);

    sprite1_5 = cocos2d.CCSprite:spriteWithFile(filepath .. "/1_5.png");
    sprite1_5:setIsVisible(false);
    backLayer:addChild(sprite1_5);

    sprite1_6 = cocos2d.CCSprite:spriteWithFile(filepath .. "/1_6.png");
    sprite1_6:setIsVisible(false);
    backLayer:addChild(sprite1_6);

    sprite1_7 = cocos2d.CCSprite:spriteWithFile(filepath .. "/1_7.png");
    sprite1_7:setIsVisible(false);
    backLayer:addChild(sprite1_7);

    sprite2_4 = cocos2d.CCSprite:spriteWithFile(filepath .. "/2_4.png");
    sprite2_4:setIsVisible(false);
    backLayer:addChild(sprite2_4);

    sprite2_2_1 = cocos2d.CCSprite:spriteWithFile(filepath .. "/2_2.png");
    sprite2_2_1:setIsVisible(false);
    backLayer:addChild(sprite2_2_1);

    
    sprite2_1_1 = cocos2d.CCSprite:spriteWithFile(filepath .. "/2_1.png");
    sprite2_1_1:setIsVisible(false);
    backLayer:addChild(sprite2_1_1);

    sprite2_1_2 = cocos2d.CCSprite:spriteWithFile(filepath .. "/2_1.png");
    sprite2_1_2:setIsVisible(false);
    backLayer:addChild(sprite2_1_2);

    sprite2_2_2 = cocos2d.CCSprite:spriteWithFile(filepath .. "/2_2.png");
    sprite2_2_2:setIsVisible(false);
    backLayer:addChild(sprite2_2_2);

    sprite2_3 = cocos2d.CCSprite:spriteWithFile(filepath .. "/2_3.png");
    sprite2_3:setIsVisible(false);
    backLayer:addChild(sprite2_3);
    
    

    PlayBg1();
end

function PlayBg1()
    
    sprite2_1_1:stopAllActions();
    sprite2_1_2:stopAllActions();
    sprite2_2_1:stopAllActions();
    sprite2_2_2:stopAllActions();

    sprite2_1_1:setIsVisible(false);
    sprite2_1_2:setIsVisible(false);
    sprite2_2_1:setIsVisible(false);
    sprite2_2_2:setIsVisible(false);
    sprite2_3:setIsVisible(false);
    sprite2_4:setIsVisible(false);

    sprite1_1:setIsVisible(true);
    sprite1_2:setIsVisible(true);
    sprite1_3_1:setIsVisible(true);
    sprite1_3_2:setIsVisible(true);
    sprite1_3_3:setIsVisible(true);
    sprite1_3_4:setIsVisible(true);
    sprite1_4:setIsVisible(true);
    sprite1_5:setIsVisible(true);
    sprite1_6:setIsVisible(true);
    sprite1_7:setIsVisible(true);

    sprite1_1:setPosition(cocos2d.CCPoint(380,290));
    sprite1_2:setPosition(cocos2d.CCPoint(160,355));
    sprite1_3_1:setPosition(cocos2d.CCPoint(80,490));
    sprite1_3_2:setPosition(cocos2d.CCPoint(80,490));
    sprite1_3_3:setPosition(cocos2d.CCPoint(20,220));
    sprite1_3_4:setPosition(cocos2d.CCPoint(20,220));
    sprite1_4:setPosition(cocos2d.CCPoint(360,325));
    sprite1_5:setPosition(cocos2d.CCPoint(360,325));
    sprite1_6:setPosition(cocos2d.CCPoint(360,325));
    sprite1_7:setPosition(cocos2d.CCPoint(360,325));

    sprite1_3_1:setScale(0.8);
    sprite1_3_2:setScale(0.5);
    sprite1_3_3:setScale(0.5);
    sprite1_3_4:setScale(0.3);

    Action1_1();
    Action1_4();
    Action1_5();
    Action1_6();
    Action1_7();

    sprite1_3_1:runAction(cocos2d.CCRepeatForever:actionWithAction(cocos2d.CCRotateBy:actionWithDuration(3,360)));
    sprite1_3_2:runAction(cocos2d.CCRepeatForever:actionWithAction(cocos2d.CCRotateBy:actionWithDuration(3,-360)));
    sprite1_3_3:runAction(cocos2d.CCRepeatForever:actionWithAction(cocos2d.CCRotateBy:actionWithDuration(3,360)));
    sprite1_3_4:runAction(cocos2d.CCRepeatForever:actionWithAction(cocos2d.CCRotateBy:actionWithDuration(3,-360)));

    

    
end

function Action1_1()
    local action = cocos2d.CCMoveTo:actionWithDuration(0.5,cocos2d.CCPoint(262,290));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(3.0));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCMoveTo:actionWithDuration(0.5,cocos2d.CCPoint(380,290)));
    --action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(0.1));
    sprite1_1:runAction(cocos2d.CCRepeatForever:actionWithAction(action));
    
end

function Action1_4()

    local action = cocos2d.CCMoveTo:actionWithDuration(0.5,cocos2d.CCPoint(160,325));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCMoveTo:actionWithDuration(0.1,cocos2d.CCPoint(180,325)));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(3.1));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCPlace:actionWithPosition(cocos2d.CCPoint(360,325)));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(0.3));
    sprite1_4:runAction(cocos2d.CCRepeatForever:actionWithAction(action));
end

function Action1_5()

    local action = cocos2d.CCSequence:actionOneTwo(cocos2d.CCDelayTime:actionWithDuration(0.5),cocos2d.CCMoveTo:actionWithDuration(0.3,cocos2d.CCPoint(180,325)));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCMoveTo:actionWithDuration(0.1,cocos2d.CCPoint(207,325)));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(2.9));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCPlace:actionWithPosition(cocos2d.CCPoint(360,325)));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(0.2));
    sprite1_5:runAction(cocos2d.CCRepeatForever:actionWithAction(action));
end

function Action1_6()

    local action = cocos2d.CCSequence:actionOneTwo(cocos2d.CCDelayTime:actionWithDuration(0.8),cocos2d.CCMoveTo:actionWithDuration(0.2,cocos2d.CCPoint(207,325)));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCMoveTo:actionWithDuration(0.1,cocos2d.CCPoint(231,325)));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(2.8));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCPlace:actionWithPosition(cocos2d.CCPoint(360,325)));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(0.1));
    sprite1_6:runAction(cocos2d.CCRepeatForever:actionWithAction(action));
end

function Action1_7()

    local action = cocos2d.CCSequence:actionOneTwo(cocos2d.CCDelayTime:actionWithDuration(1.0),cocos2d.CCMoveTo:actionWithDuration(0.1,cocos2d.CCPoint(217,325)));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCMoveTo:actionWithDuration(0.1,cocos2d.CCPoint(255,325)));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(2.8));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCPlace:actionWithPosition(cocos2d.CCPoint(360,325)));
    sprite1_7:runAction(cocos2d.CCRepeatForever:actionWithAction(action));
end

function PlayBg2()

    sprite1_1:stopAllActions();
    sprite1_3_1:stopAllActions();
    sprite1_3_2:stopAllActions();
    sprite1_3_3:stopAllActions();
    sprite1_3_4:stopAllActions();
    sprite1_4:stopAllActions();
    sprite1_5:stopAllActions();
    sprite1_6:stopAllActions();
    sprite1_7:stopAllActions();

    sprite1_1:setIsVisible(false);
    sprite1_2:setIsVisible(false);
    sprite1_3_1:setIsVisible(false);
    sprite1_3_2:setIsVisible(false);
    sprite1_3_3:setIsVisible(false);
    sprite1_3_4:setIsVisible(false);
    sprite1_4:setIsVisible(false);
    sprite1_5:setIsVisible(false);
    sprite1_6:setIsVisible(false);
    sprite1_7:setIsVisible(false);

    sprite2_1_1:setIsVisible(true);
    sprite2_1_2:setIsVisible(true);
    sprite2_2_1:setIsVisible(true);
    sprite2_2_2:setIsVisible(true);
    sprite2_3:setIsVisible(true);
    sprite2_4:setIsVisible(true);

    sprite2_1_1:setPosition(cocos2d.CCPoint(160,346));
    sprite2_1_2:setPosition(cocos2d.CCPoint(160,346));
    sprite2_2_1:setPosition(cocos2d.CCPoint(-210,440));
    sprite2_2_2:setPosition(cocos2d.CCPoint(530,235));
    sprite2_3:setPosition(cocos2d.CCPoint(160,300));
    sprite2_4:setPosition(cocos2d.CCPoint(160,345));

    sprite2_2_1:setOpacity(128);
    sprite2_2_2:setOpacity(128);
    

    Action2_1_1();
    Action2_1_2();
    Action2_2_1();
    Action2_2_2();

end

function Action2_1_1()

    local action = cocos2d.CCSequence:actionOneTwo(cocos2d.CCDelayTime:actionWithDuration(1),cocos2d.CCScaleTo:actionWithDuration(0.1,1.1));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCScaleTo:actionWithDuration(0.1,1));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCScaleTo:actionWithDuration(0.1,1.1));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCScaleTo:actionWithDuration(0.1,1));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(1.4));
    sprite2_1_1:runAction(cocos2d.CCRepeatForever:actionWithAction(action));
end

function Action2_1_2()

    local action = cocos2d.CCSequence:actionOneTwo(cocos2d.CCDelayTime:actionWithDuration(1),cocos2d.CCScaleTo:actionWithDuration(0.1,1.1));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCScaleTo:actionWithDuration(0.1,1));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCScaleTo:actionWithDuration(0.1,1.1));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCScaleTo:actionWithDuration(0.1,1));
    
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCSpawn:actionOneTwo(cocos2d.CCFadeOut:actionWithDuration(0.4),cocos2d.CCScaleTo:actionWithDuration(0.4,1.2)));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCScaleTo:actionWithDuration(0,1));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCFadeIn:actionWithDuration(0));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(1));
    sprite2_1_2:runAction(cocos2d.CCRepeatForever:actionWithAction(action));
    
end

function Action2_2_1()
    local action = cocos2d.CCSequence:actionOneTwo(cocos2d.CCMoveTo:actionWithDuration(1,cocos2d.CCPoint(160,440)),cocos2d.CCDelayTime:actionWithDuration(4));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCMoveTo:actionWithDuration(1,cocos2d.CCPoint(530,440)));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCPlace:actionWithPosition(cocos2d.CCPoint(-210,440)));
    sprite2_2_1:runAction(cocos2d.CCRepeatForever:actionWithAction(action));
end

function Action2_2_2()
    local action = cocos2d.CCSequence:actionOneTwo(cocos2d.CCMoveTo:actionWithDuration(1,cocos2d.CCPoint(160,235)),cocos2d.CCDelayTime:actionWithDuration(4));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCMoveTo:actionWithDuration(1,cocos2d.CCPoint(-210,235)));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCPlace:actionWithPosition(cocos2d.CCPoint(530,235)));
    sprite2_2_2:runAction(cocos2d.CCRepeatForever:actionWithAction(action));
end


function backLayerCommonState()
	specialState = false;
	PlayBg1();
end

function backlayerSpecialState()
	specialState = true;
	PlayBg2();
end

function releaseBackLayer()
    backLayer:removeAllChildrenWithCleanup(true);
	backLayer:removeFromParentAndCleanup(true);
end



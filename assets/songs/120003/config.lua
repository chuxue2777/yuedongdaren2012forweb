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

    sprite1_3_4 = cocos2d.CCSprite:spriteWithFile(filepath .. "/1_3.png");
    sprite1_3_4:setIsVisible(false);
    sprite1_3_4:setScale(0.4);
    backLayer:addChild(sprite1_3_4);    

    sprite1_3_1 = cocos2d.CCSprite:spriteWithFile(filepath .. "/1_3.png");
    sprite1_3_1:setIsVisible(false);
    sprite1_3_1:setScale(0.6);
    backLayer:addChild(sprite1_3_1);

    sprite1_3_2 = cocos2d.CCSprite:spriteWithFile(filepath .. "/1_3.png");
    sprite1_3_2:setIsVisible(false);
    sprite1_3_2:setScale(0.6);
    backLayer:addChild(sprite1_3_2);

    sprite1_3_3 = cocos2d.CCSprite:spriteWithFile(filepath .. "/1_3.png");
    sprite1_3_3:setIsVisible(false);
    sprite1_3_3:setScale(0.6);
    backLayer:addChild(sprite1_3_3);

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

    sprite2_1 = cocos2d.CCSprite:spriteWithFile(filepath .. "/2_1.png");
    sprite2_1:setIsVisible(false);
    backLayer:addChild(sprite2_1);

    sprite2_2_1 = cocos2d.CCSprite:spriteWithFile(filepath .. "/2_2.png");
    sprite2_2_1:setIsVisible(false);
    backLayer:addChild(sprite2_2_1);

    sprite2_2_2 = cocos2d.CCSprite:spriteWithFile(filepath .. "/2_2.png");
    sprite2_2_2:setIsVisible(false);
    backLayer:addChild(sprite2_2_2);


    PlayBg1();
end


function PlayBg1()

    sprite2_1:stopAllActions();
    sprite2_2_1:stopAllActions();
    sprite2_2_2:stopAllActions();

    sprite2_1:setIsVisible(false);
    sprite2_2_1:setIsVisible(false);
    sprite2_2_2:setIsVisible(false);

    sprite1_2:setPosition(cocos2d.CCPoint(160,328));
    sprite1_1:setPosition(cocos2d.CCPoint(240,350));
    
    sprite1_3_1:setPosition(cocos2d.CCPoint(35,280));
    sprite1_3_2:setPosition(cocos2d.CCPoint(35,280));
    sprite1_3_3:setPosition(cocos2d.CCPoint(35,280));
    sprite1_3_4:setPosition(cocos2d.CCPoint(35,280));

    sprite1_4:setPosition(cocos2d.CCPoint(-80,360));
    sprite1_5:setPosition(cocos2d.CCPoint(-50,385));
    sprite1_6:setPosition(cocos2d.CCPoint(-40,360));
    sprite1_7:setPosition(cocos2d.CCPoint(-20,330));

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

    --sprite1_3_1:setOpacity(0);
    --sprite1_3_2:setOpacity(0);
    --sprite1_3_3:setOpacity(0);

    Action1_3_1();
    Action1_3_2();
    Action1_3_3();
    Action1_3_4();
    Action1_4();
    Action1_5();
    Action1_6();
    Action1_7();

end

function Action1_3_4()

    local action = cocos2d.CCScaleTo:actionWithDuration(0.2,0.6);
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCScaleTo:actionWithDuration(0.2,0.4));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCHide:action());
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(2.2));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCShow:action());
    
    sprite1_3_4:runAction(cocos2d.CCRepeatForever:actionWithAction(action));
end

function Action1_3_1()
   
    local action1 = cocos2d.CCPlace:actionWithPosition(cocos2d.CCPoint(35,280));
    action1 = cocos2d.CCSequence:actionOneTwo(action1,cocos2d.CCDelayTime:actionWithDuration(0.4));
    action1 = cocos2d.CCSequence:actionOneTwo(action1,cocos2d.CCFadeIn:actionWithDuration(0));
    action1 = cocos2d.CCSequence:actionOneTwo(action1,cocos2d.CCSpawn:actionOneTwo(cocos2d.CCScaleTo:actionWithDuration(0.2,0.4),cocos2d.CCMoveTo:actionWithDuration(0.2,cocos2d.CCPoint(40,450))));
    action1 = cocos2d.CCSequence:actionOneTwo(action1,cocos2d.CCFadeOut:actionWithDuration(0.2));
    action1 = cocos2d.CCSequence:actionOneTwo(action1,cocos2d.CCScaleTo:actionWithDuration(0.0,0.6));
    action1 = cocos2d.CCSequence:actionOneTwo(action1,cocos2d.CCDelayTime:actionWithDuration(1.8));

    sprite1_3_1:runAction(cocos2d.CCRepeatForever:actionWithAction(action1));
    
end

function Action1_3_2()

    local action2 = cocos2d.CCPlace:actionWithPosition(cocos2d.CCPoint(35,280));
    action2 = cocos2d.CCSequence:actionOneTwo(action2,cocos2d.CCDelayTime:actionWithDuration(0.4));
    action2 = cocos2d.CCSequence:actionOneTwo(action2,cocos2d.CCFadeIn:actionWithDuration(0));
    action2 = cocos2d.CCSequence:actionOneTwo(action2,cocos2d.CCSpawn:actionOneTwo(cocos2d.CCScaleTo:actionWithDuration(0.2,0.4),cocos2d.CCMoveTo:actionWithDuration(0.2,cocos2d.CCPoint(160,420))));
    action2 = cocos2d.CCSequence:actionOneTwo(action2,cocos2d.CCFadeOut:actionWithDuration(0.2));
    action2 = cocos2d.CCSequence:actionOneTwo(action2,cocos2d.CCScaleTo:actionWithDuration(0.0,0.6));
    action2 = cocos2d.CCSequence:actionOneTwo(action2,cocos2d.CCDelayTime:actionWithDuration(1.8));

    sprite1_3_2:runAction(cocos2d.CCRepeatForever:actionWithAction(action2));

end

function Action1_3_3()

    local action3 = cocos2d.CCPlace:actionWithPosition(cocos2d.CCPoint(35,280));
     action3 = cocos2d.CCSequence:actionOneTwo(action3,cocos2d.CCDelayTime:actionWithDuration(0.4));
    action3 = cocos2d.CCSequence:actionOneTwo(action3,cocos2d.CCFadeIn:actionWithDuration(0));
    action3 = cocos2d.CCSequence:actionOneTwo(action3,cocos2d.CCSpawn:actionOneTwo(cocos2d.CCScaleTo:actionWithDuration(0.2,0.4),cocos2d.CCMoveTo:actionWithDuration(0.2,cocos2d.CCPoint(150,300))));
    action3 = cocos2d.CCSequence:actionOneTwo(action3,cocos2d.CCFadeOut:actionWithDuration(0.2));
    action3 = cocos2d.CCSequence:actionOneTwo(action3,cocos2d.CCScaleTo:actionWithDuration(0.0,0.6));
    action3 = cocos2d.CCSequence:actionOneTwo(action3,cocos2d.CCDelayTime:actionWithDuration(1.8));

    sprite1_3_3:runAction(cocos2d.CCRepeatForever:actionWithAction(action3));

end

function Action1_4()

    local action = cocos2d.CCPlace:actionWithPosition(cocos2d.CCPoint(-80,360));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCFadeIn:actionWithDuration(0.0));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCMoveTo:actionWithDuration(1,cocos2d.CCPoint(120,360)));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCMoveTo:actionWithDuration(0.1,cocos2d.CCPoint(100,360)));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(5.3));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCFadeOut:actionWithDuration(0.5));
    sprite1_4:runAction(cocos2d.CCRepeatForever:actionWithAction(action));
end

function Action1_5()
    
    local action = cocos2d.CCSequence:actionOneTwo(cocos2d.CCPlace:actionWithPosition(cocos2d.CCPoint(-50,385)),cocos2d.CCFadeIn:actionWithDuration(0.0));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(1.1));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCMoveTo:actionWithDuration(1,cocos2d.CCPoint(110,385)));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCMoveTo:actionWithDuration(0.1,cocos2d.CCPoint(100,385)));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(4.2));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCFadeOut:actionWithDuration(0.5));
    sprite1_5:runAction(cocos2d.CCRepeatForever:actionWithAction(action));
end

function Action1_6()
    
    local action = cocos2d.CCSequence:actionOneTwo(cocos2d.CCPlace:actionWithPosition(cocos2d.CCPoint(-40,360)),cocos2d.CCFadeIn:actionWithDuration(0.0));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(2.2));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCMoveTo:actionWithDuration(1,cocos2d.CCPoint(120,360)));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCMoveTo:actionWithDuration(0.1,cocos2d.CCPoint(100,360)));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(3.1));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCFadeOut:actionWithDuration(0.5));
    sprite1_6:runAction(cocos2d.CCRepeatForever:actionWithAction(action));
end

function Action1_7()
    
    local action = cocos2d.CCSequence:actionOneTwo(cocos2d.CCPlace:actionWithPosition(cocos2d.CCPoint(-20,330)),cocos2d.CCFadeIn:actionWithDuration(0.0));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(3.3));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCMoveTo:actionWithDuration(1,cocos2d.CCPoint(110,330)));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCMoveTo:actionWithDuration(0.1,cocos2d.CCPoint(100,330)));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCDelayTime:actionWithDuration(2));
    action = cocos2d.CCSequence:actionOneTwo(action,cocos2d.CCFadeOut:actionWithDuration(0.5));
    sprite1_7:runAction(cocos2d.CCRepeatForever:actionWithAction(action));
end

function PlayBg2()
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

    sprite2_1:setPosition(cocos2d.CCPoint(160,351));
    sprite2_1:setIsVisible(true);

    sprite2_2_1:setPosition(cocos2d.CCPoint(25,460));
    sprite2_2_1:setScale(0.1);
    sprite2_2_1:setIsVisible(true);

    sprite2_2_2:setPosition(cocos2d.CCPoint(25,460));
    sprite2_2_2:setScale(0.1);
    sprite2_2_2:setIsVisible(true);

    Action2_2_1();

end

function Action2_2_1()
    sprite2_2_1:setOpacity(255);
    sprite2_2_1:setScale(0.1);
    local action1 = cocos2d.CCScaleTo:actionWithDuration(1,1);
    action1 = cocos2d.CCSequence:actionOneTwo(action1,cocos2d.CCCallFunc:actionWithScriptFuncName("Action2_2_2"));
    action1 = cocos2d.CCSequence:actionOneTwo(action1,cocos2d.CCScaleTo:actionWithDuration(1,2));
    action1 = cocos2d.CCSequence:actionOneTwo(action1,cocos2d.CCFadeOut:actionWithDuration(0.2));
    action1 = cocos2d.CCSequence:actionOneTwo(action1,cocos2d.CCDelayTime:actionWithDuration(1));
    sprite2_2_1:runAction(action1);
    
end

function Action2_2_2()
    sprite2_2_2:setOpacity(255);
    sprite2_2_2:setScale(0.1);
    local action1 = cocos2d.CCSequence:actionOneTwo(cocos2d.CCScaleTo:actionWithDuration(2,2),cocos2d.CCFadeOut:actionWithDuration(0.2));
    action1 = cocos2d.CCSequence:actionOneTwo(action1,cocos2d.CCCallFunc:actionWithScriptFuncName("Action2_2_1"));
    sprite2_2_2:runAction(action1);
end

function backLayerCommonState()
    specialState = false
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
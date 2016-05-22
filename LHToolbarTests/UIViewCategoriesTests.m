//
//  UIViewCategoriesTests.m
//  LHToolbar
//
//  Created by Xi Huang on 5/17/16.
//  Copyright © 2016 Lucas Huang. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "UIView+AutoLayoutHelper.h"

SPEC_BEGIN(InitialUIViewCategoriesTests)

context(@"Layout of UIView", ^(){
    
    describe(@"An instance UIView", ^(){
        
        UIView *mainView = [[UIView alloc] initWithFrame:CGRectZero];
        it(@"should not have top, bottom, leading, trailing constraints by calling addAttachedLayoutConstraintsToSuperview before addSubview:", ^(){
            UIView *view = [[UIView alloc] init];
            [view addAttachedLayoutConstraintsToSuperview];
            [mainView addSubview:view];
            [[theValue(mainView.constraints.count) shouldNot] equal:theValue(4)];
        });
        
        it(@"should have top, bottom, leading, trailing constraints", ^(){
            UIView *view = [[UIView alloc] init];
            [mainView addSubview:view];
            [view addAttachedLayoutConstraintsToSuperview];
            [[theValue(mainView.constraints.count) should] equal:theValue(4)];
        });
    });
});

SPEC_END


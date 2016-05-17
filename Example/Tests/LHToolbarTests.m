//
//  LHToolbarTests.m
//  LHToolbar
//
//  Created by Xi Huang on 5/16/16.
//  Copyright © 2016 Lucas Huang. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "LHToolbar.h"

SPEC_BEGIN(InitialLHToolbarTests)

context(@"Initialization of LHToolbar", ^(){
    describe(@"An instance of LHToolbar", ^(){
        it(@"should initialize", ^(){
            
            LHToolbar *toolbar = [[LHToolbar alloc] init];
            [[toolbar shouldNot] beNil];
            [[theValue(toolbar.numberOfItems) should] equal:theValue(0)];
        });
        
        it(@"should not initialize with positive number of items ", ^(){
            
            LHToolbar *toolbar = [[LHToolbar alloc] initWithNumberOfItems:11];
            [[toolbar shouldNot] beNil];
            [[theValue(toolbar.numberOfItems) should] equal:theValue(11)];
        });
        
        it(@"should not initialize with zero item ", ^(){
            
            LHToolbar *toolbar = [[LHToolbar alloc] initWithNumberOfItems:0];
            [[toolbar should] beNil];
            [[theValue(toolbar.numberOfItems) should] equal:theValue(0)];
        });
        
        it(@"should not initialize with negetive number of items", ^(){
            
            LHToolbar *toolbar = [[LHToolbar alloc] initWithNumberOfItems:-2];
            [[toolbar should] beNil];
            [[theValue(toolbar.numberOfItems) should] equal:theValue(0)];
        });
    });
});

SPEC_END

SPEC_BEGIN(AdditionContentViewToolbarTests)

LHToolbar *toolbar = [[LHToolbar alloc] initWithNumberOfItems:2];
context(@"Addition of content view in LHToolbar", ^(){
    
    describe(@"An instance of LHToolbar", ^(){
        
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectZero];
        UIView *view2 = [[UIView alloc] init];
        
        it(@"should add view1 successfully at index within the range", ^(){

            [toolbar setContentView:view1 atIndex: 1];
        });
        
        it(@"should not add view2 successfully at index out of the range", ^(){

            [toolbar setContentView:view2 atIndex: 2];
            [[theValue([toolbar containedContentView:view2]) shouldNot] equal:theValue(YES)];
        });
        
        it(@"should contain view1", ^(){
            [[theValue([toolbar containedContentView:view1]) should] equal:theValue(YES)];
        });
        
        it(@"should not contain view2", ^(){
            [[theValue([toolbar containedContentView:view2]) shouldNot] equal:theValue(YES)];
        });
        
        it(@"should return valid index of view1 which is 1", ^(){
            [[theValue([toolbar indexOfContentView:view1]) should] equal:theValue(1)];
        });
        
        it(@"should return invalid index of view2 which is -1", ^(){
            [[theValue([toolbar indexOfContentView:view2]) should] equal:theValue(-1)];
        });
        
        it(@"should return view1 by giving index of view1 which is 1", ^(){
            
            [[view1 should] equal:[toolbar contentViewAtIndex:1]];
        });
        
        it(@"should not return non-nil object by giving index of nothing which is 0", ^(){
            
            [[[toolbar contentViewAtIndex:0] should] beNil];
        });
    });
});

SPEC_END
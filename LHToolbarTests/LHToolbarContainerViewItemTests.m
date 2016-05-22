//
//  LHToolbarContainerViewItemTests.m
//  LHToolbar
//
//  Created by Xi Huang on 5/17/16.
//  Copyright © 2016 Lucas Huang. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "LHToolbarContainerViewItem.h"

SPEC_BEGIN(InitialLHToolbarContainerViewItemTests)

context(@"Initialization of LHToolbarContainerViewItem", ^(){
    
    describe(@"An instance LHToolbarContainerViewItem", ^(){
        
        
        it(@"should initialize with a normal number", ^(){
            LHToolbarContainerViewItem *containerViewItem = [[LHToolbarContainerViewItem alloc] initWithPercentageOfScreenWidth:0.2];
            [[containerViewItem shouldNot] beNil];
            [[theValue(containerViewItem.percentageOfScreenWidth) should] equal: theValue(0.2)];
        });
        
        it(@"should not initialize with 0", ^(){
            LHToolbarContainerViewItem *containerViewItem = [[LHToolbarContainerViewItem alloc] initWithPercentageOfScreenWidth:0.0];
            [[containerViewItem should] beNil];
            [[theValue(containerViewItem.percentageOfScreenWidth) should] equal: theValue(0.0)];
        });
        
        it(@"should not initialize with negative number", ^(){
            LHToolbarContainerViewItem *containerViewItem = [[LHToolbarContainerViewItem alloc] initWithPercentageOfScreenWidth:-100];
            [[containerViewItem should] beNil];
            [[theValue(containerViewItem.percentageOfScreenWidth) should] equal: theValue(0.0)];
        });
    });
});

SPEC_END

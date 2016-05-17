//
//  LHToolbarContainerViewTests.m
//  LHToolbar
//
//  Created by Xi Huang on 5/17/16.
//  Copyright © 2016 Lucas Huang. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "LHToolbar.h"
#import "LHToolbarContainerView.h"

SPEC_BEGIN(InitialLHToolbarContainerViewTests)

context(@"Initialization of LHToolbarContainerView", ^(){
    
    describe(@"An instance LHToolbarContainerView", ^(){
        
        LHToolbarContainerView *containerView = [[LHToolbarContainerView alloc] init];
        it(@"should initialize", ^(){
            [[containerView shouldNot] beNil];
            [[containerView.contentViews shouldNot] beNil];
        });
        
        it(@"should not have dataSource", ^(){
            
            id dataSource = containerView.dataSource;
            [[dataSource should] beNil];
        });
        
        it(@"should have dataSource", ^(){
            containerView.dataSource = self;
            id dataSource = containerView.dataSource;
            [[dataSource shouldNot] beNil];
        });
    });
});

SPEC_END


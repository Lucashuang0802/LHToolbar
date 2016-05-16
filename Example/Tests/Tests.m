//
//  LHToolbarTests.m
//  LHToolbarTests
//
//  Created by Lucas Huang on 05/15/2016.
//  Copyright (c) 2016 Lucas Huang. All rights reserved.
//

// https://github.com/kiwi-bdd/Kiwi

#import "LHToolbar.h"

SPEC_BEGIN(InitialTests)

context(@"Initialization of LHToolbar", ^(){
    describe(@"An instance of LHToolbar", ^(){
        it(@"should initialize", ^(){
            
            LHToolbar *toolbar = [[LHToolbar alloc] init];
            [[toolbar shouldNot] beNil];
        });
    });
});

SPEC_END


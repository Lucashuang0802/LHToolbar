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
            [[toolbar shouldNot] beNil];
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

SPEC_BEGIN(InitialLHToolbarOrientationTests)
context(@"Initialization of LHToolbar", ^(){
    describe(@"An instance of LHToolbar", ^(){
        it(@"should initialize with default horizontal orientation", ^(){
            
            LHToolbar *toolbar = [[LHToolbar alloc] init];
            [[theValue(toolbar.orientation) should] equal:theValue(LHToolbarOrientationHorizontal)];
        });
        
        it(@"should initialize with given horizontal orientation", ^(){
            
            LHToolbar *toolbar = [[LHToolbar alloc] init];
            [[theValue(toolbar.orientation) should] equal:theValue(LHToolbarOrientationHorizontal)];
        });
        
        it(@"should initialize with given vertical orientation", ^(){
            
            LHToolbar *toolbar = [[LHToolbar alloc] init];
            toolbar.orientation = LHToolbarOrientationVertical;
            [[theValue(toolbar.orientation) should] equal:theValue(LHToolbarOrientationVertical)];
        });
    });
});
SPEC_END

SPEC_BEGIN(AccessingContentViewToolbarTests)
context(@"Accessing content view in LHToolbar", ^(){
    
    LHToolbar *toolbar = [[LHToolbar alloc] initWithNumberOfItems:2];
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectZero];
    UIView *view2 = [[UIView alloc] init];
    
    [toolbar setContentView:view1 atIndex:1];
    [toolbar setContentView:view2 atIndex:2];
    describe(@"An instance of LHToolbar", ^(){
        
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

SPEC_BEGIN(AddingContentViewToolbarTests)
context(@"Adding content view in LHToolbar", ^(){
    
    LHToolbar *toolbar = [[LHToolbar alloc] initWithNumberOfItems:0];
    describe(@"An instance of LHToolbar", ^(){
        it(@"should insert the view at given index", ^(){
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [toolbar insertContentView:button atIndex:0];
            
            [[[toolbar contentViewAtIndex:0] should] equal:button];
            [[theValue(toolbar.numberOfItems) should] equal:theValue(1)];
        });
        
        it(@"shoud not insert the view at given index out of the range", ^(){
            
            UIButton *button1 = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [toolbar insertContentView:button1 atIndex:5];
            UIButton *button2 = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [toolbar insertContentView:button2 atIndex:-1];
            
            [[theValue(toolbar.numberOfItems) should] equal:theValue(1)];
            [[theValue([toolbar containedContentView:button1]) should] equal:theValue(NO)];
            [[theValue([toolbar containedContentView:button2]) should] equal:theValue(NO)];
        });
        
        it(@"should not insert the nil view", ^(){
            [toolbar insertContentView:nil atIndex:1];
            [[theValue(toolbar.numberOfItems) should] equal:theValue(1)];
        });
        
        it(@"should add the view from the end", ^(){
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [toolbar addContentView:button];
            
            [[theValue(toolbar.numberOfItems) should] equal:theValue(2)];
            [[[toolbar contentViewAtIndex:toolbar.numberOfItems - 1] should] equal:button];
        });
        
        it(@"should not add nil from the end", ^(){
            [toolbar addContentView:nil];
            [[theValue(toolbar.numberOfItems) should] equal:theValue(2)];
        });
    });
});
SPEC_END

SPEC_BEGIN(RemovingContentViewToolbarTests)
context(@"Removing content view in LHToolbar", ^(){
    
    LHToolbar *toolbar = [[LHToolbar alloc] initWithNumberOfItems:0];
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectZero];
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectZero];
    [toolbar addContentView:view1];
    [toolbar addContentView:view2];
    
    describe(@"An instance of LHToolbar", ^(){
        
        it(@"should remove the view at given index", ^(){
            [toolbar removeContentViewAtIndex:0];
            [[[toolbar contentViewAtIndex:0] should] equal:view2];
            [[theValue(toolbar.numberOfItems) should] equal:theValue(1)];
        });
        
        it(@"shoud not remove the view at given index out of the range", ^(){
            
            [toolbar removeContentViewAtIndex:2];
            [[[toolbar contentViewAtIndex:0] should] equal:view2];
            [[theValue(toolbar.numberOfItems) should] equal:theValue(1)];
        });
        
        it(@"should remove the view from the end ", ^(){
            
            [toolbar removeLastContentView];
            [[theValue(toolbar.numberOfItems) should] equal:theValue(0)];
        });
        
        it(@"should remove not the view from the end ", ^(){
            
            [toolbar removeLastContentView];
            [[theValue(toolbar.numberOfItems) should] equal:theValue(0)];
        });
    });
});
SPEC_END

SPEC_BEGIN(SettingContentViewToolbarTests)
context(@"Setting content view in LHToolbar", ^(){
    
    LHToolbar *toolbar = [[LHToolbar alloc] initWithNumberOfItems:0];
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectZero];
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectZero];
    [toolbar addContentView:view1];
    [toolbar addContentView:view2];
    
    describe(@"An instance of LHToolbar", ^(){
        
        it(@"should set the new view at given index", ^(){
            
            UIView *view3 = [[UIView alloc] initWithFrame:CGRectZero];
            [toolbar setContentView:view3 atIndex:0];
            
            [[[toolbar contentViewAtIndex:0] should] equal:view3];
            [[theValue(toolbar.numberOfItems) should] equal:theValue(2)];
        });
        
        it(@"should not set the new view at given index", ^(){
            
            UIView *view4 = [[UIView alloc] initWithFrame:CGRectZero];
            [toolbar setContentView:view4 atIndex:2];
            
            [[[toolbar contentViewAtIndex:1] should] equal:view2];
            [[theValue(toolbar.numberOfItems) should] equal:theValue(2)];
        });
    });
});
SPEC_END
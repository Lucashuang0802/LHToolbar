//
//  LHToolbarContainerView.h
//  Pods
//
//  Created by Xi Huang on 5/15/16.
//
//

#import <UIKit/UIKit.h>

@class LHToolbarContainerView;
@protocol LHToolbarContainerViewDataSource <NSObject>
- (NSInteger)numberOfItemInContainerView:(LHToolbarContainerView *)containerView;
@end

@interface LHToolbarContainerView : UIView
@property (weak, nonatomic) id<LHToolbarContainerViewDataSource> dataSource;
@property (nonatomic) NSMutableArray<UIView *> *contentViews;
- (void)reloadToolbarContainerView;
@end

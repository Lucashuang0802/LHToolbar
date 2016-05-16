//
//  LHToolbarContainerView.m
//  Pods
//
//  Created by Xi Huang on 5/15/16.
//
//

#import "LHToolbarContainerView.h"
#import "LHToolbarContainerViewItem.h"
#import "UIView+AutoLayoutHelper.h"

@implementation LHToolbarContainerView

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        self.translatesAutoresizingMaskIntoConstraints = NO;
        _contentViews = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    
    [self addAttachedLayoutConstraintsToSuperview];
    [self reloadToolbarContainerView];
}

- (void)reloadToolbarContainerView {
    if (!self.dataSource) return;
    
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
    
    NSInteger numberOfContainerView = [self.dataSource numberOfItemInContainerView:self];
    if (!numberOfContainerView) return;
    
    
    NSInteger i = 1;
    while (i <= numberOfContainerView) {
        LHToolbarContainerViewItem *item = [[LHToolbarContainerViewItem alloc] initWithPercentageOfScreenWidth:1.0 / numberOfContainerView];
        [self addSubview:item];
        i++;
    }
    
    for (NSInteger i = 0; i < self.contentViews.count; i++) {
        UIView *contentView = self.contentViews[i];
        UIView *view = self.subviews[i];
        [view addSubview:contentView];
    }
}

@end

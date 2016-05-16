//
//  LHToolbar.m
//  Pods
//
//  Created by Xi Huang on 5/15/16.
//
//

#import "LHToolbar.h"
#import "LHToolbarContainerView.h"

@interface LHToolbar() <LHToolbarContainerViewDataSource>
@property (nonatomic) NSInteger numberOfItems;
@property (nonatomic) LHToolbarContainerView *containerView;
@end

@implementation LHToolbar

- (void)setNumberOfItems:(NSInteger)numberOfItems {
    if (numberOfItems <= 0) {
        _numberOfItems = 0;
    }
    _numberOfItems = numberOfItems;
    [self reloadToolbar];
}

- (instancetype)initWithNumberOfItems:(NSInteger)numberOfItems {
    if (numberOfItems <= 0) {
        return nil;
    }
    
    if (self = [super init]) {
        
        _numberOfItems = numberOfItems;
        [self setupToolbarStyle];
        
        _containerView = [[LHToolbarContainerView alloc] init];
        _containerView.dataSource = self;
        [self addSubview:self.containerView];
    }
    return self;
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    [self reloadToolbar];
}

- (void)setupToolbarStyle {
    self.backgroundColor = [UIColor clearColor];
}

- (void)reloadToolbar {
    [self.containerView reloadToolbarContainerView];
}

- (void)addContentView:(UIView *)contentView atIndex:(NSInteger)index {
    if (index >= self.numberOfItems) return;
    [self.containerView.contentViews insertObject:contentView atIndex:index];
}

#pragma mark - LHToolbarContainerViewDataSource
- (NSInteger)numberOfItemInContainerView:(LHToolbarContainerView *)containerView {
    if (self.numberOfItems <= 0) return 0;
    return self.numberOfItems;
}

@end

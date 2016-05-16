//
//  LHToolbar.h
//  Pods
//
//  Created by Xi Huang on 5/15/16.
//
//

#import <UIKit/UIKit.h>

@interface LHToolbar : UIView

- (instancetype)initWithNumberOfItems:(NSInteger)numberOfItems;

- (void)reloadToolbar;

- (void)addContentView:(UIView *)contentView
               atIndex:(NSInteger)index;

@end

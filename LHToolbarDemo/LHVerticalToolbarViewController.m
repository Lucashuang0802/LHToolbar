//
//  LHVerticalToolbarViewController.m
//  LHToolbarDemo
//
//  Created by Xi Huang on 7/31/16.
//  Copyright © 2016 Tokbox, Inc. All rights reserved.
//

#import "LHVerticalToolbarViewController.h"
#import "LHToolbar.h"

static CGFloat const toolbarWidth = 44.0f;
static CGFloat const gap = 2.0f;

@interface LHVerticalToolbarViewController ()
@property (nonatomic) LHToolbar *toolbar;
@end

@implementation LHVerticalToolbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeLeft];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    
    self.toolbar = [[LHToolbar alloc] initWithNumberOfItems:4];
    self.toolbar.orientation = LHToolbarOrientationVertical;
    [self.toolbar setBackgroundColor:[UIColor redColor]];
    self.toolbar.frame = CGRectMake(0, 64, toolbarWidth, toolbarWidth * 4 + gap * 4);
    
    UIButton *annotateButton = [[UIButton alloc] init];
    [annotateButton setImage:[UIImage imageNamed:@"annotate"] forState:UIControlStateNormal];
    [annotateButton setBackgroundColor:[UIColor blackColor]];
    annotateButton.frame = CGRectMake(gap, gap, toolbarWidth - gap * 2, toolbarWidth - gap * 2);
    
    UIButton *textButton = [[UIButton alloc] init];
    [textButton setImage:[UIImage imageNamed:@"text"] forState:UIControlStateNormal];
    [textButton setBackgroundColor:[UIColor blackColor]];
    textButton.frame = CGRectMake(gap, gap, toolbarWidth - gap * 2, toolbarWidth - gap * 2);
    
    UIButton *screenshotButton = [[UIButton alloc] init];
    [screenshotButton setImage:[UIImage imageNamed:@"screenshot"] forState:UIControlStateNormal];
    [screenshotButton setBackgroundColor:[UIColor blackColor]];
    screenshotButton.frame = CGRectMake(gap, gap, toolbarWidth - gap * 2, toolbarWidth - gap * 2);
    
    UIButton *eraseButton = [[UIButton alloc] init];
    [eraseButton setImage:[UIImage imageNamed:@"erase"] forState:UIControlStateNormal];
    [eraseButton setBackgroundColor:[UIColor blackColor]];
    eraseButton.frame = CGRectMake(gap, gap, toolbarWidth - gap * 2, toolbarWidth - gap * 2);
    
    [self.toolbar setContentView:annotateButton atIndex:0];
    [self.toolbar setContentView:textButton atIndex:1];
    [self.toolbar setContentView:screenshotButton atIndex:2];
    [self.toolbar setContentView:eraseButton atIndex:3];
    [self.view addSubview:self.toolbar];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.toolbar reloadToolbar];
}

@end

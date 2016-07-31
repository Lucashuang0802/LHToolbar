//
//  LHHorizontalToolbarViewController.m
//  LHToolbarDemo
//
//  Created by Xi Huang on 7/31/16.
//  Copyright © 2016 Tokbox, Inc. All rights reserved.
//

#import "LHHorizontalToolbarViewController.h"
#import "LHToolbar.h"

static CGFloat const colorToolbarHeight = 44.0f;
static CGFloat const gap = 2.0f;

@interface LHHorizontalToolbarViewController ()
@property (nonatomic) LHToolbar *colorToolbar;
@end

@implementation LHHorizontalToolbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    
    // initialize tool bar
    self.colorToolbar = [[LHToolbar alloc] initWithNumberOfItems:9];
    self.colorToolbar.backgroundColor = [UIColor lightGrayColor];
    CGRect mainScreenBounds = [UIScreen mainScreen].bounds;
    self.colorToolbar.frame = CGRectMake(0, CGRectGetHeight(mainScreenBounds) - colorToolbarHeight, CGRectGetWidth(mainScreenBounds), colorToolbarHeight);
    [self.view addSubview:self.colorToolbar];
    
    // add color picker buttons
    NSDictionary *colorDict = @{
                                @1: [UIColor colorWithRed:68.0/255.0f green:140.0/255.0f blue:230.0/255.0f alpha:1.0],
                                @2: [UIColor colorWithRed:179.0/255.0f green:0/255.0f blue:223.0/255.0f alpha:1.0],
                                @3: [UIColor redColor],
                                @4: [UIColor colorWithRed:245.0/255.0f green:152.0/255.0f blue:0/255.0f alpha:1.0],
                                @5: [UIColor colorWithRed:247.0/255.0f green:234.0/255.0f blue:0/255.0f alpha:1.0],
                                @6: [UIColor colorWithRed:101.0/255.0f green:210.0/255.0f blue:0.0/255.0f alpha:1.0],
                                @7: [UIColor blackColor],
                                @8: [UIColor grayColor],
                                @9: [UIColor whiteColor]
                                };
    for (NSInteger i = 1; i < 10; i++) {
        UIButton *button = [[UIButton alloc] init];
        [button setBackgroundColor:colorDict[@(i)]];
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [button setFrame:CGRectMake(gap, gap, CGRectGetWidth(mainScreenBounds) / 9.0 - gap * 2, colorToolbarHeight - gap * 2)];
        [button.layer setCornerRadius:colorToolbarHeight / 2.0f];
        [self.colorToolbar setContentView:button atIndex:i -  1];
    }
    
    // reload tool bar
    [self.colorToolbar reloadToolbar];
}

- (void)buttonPressed:(UIButton *)button {
    NSLog(@"%@ is pressed", button.description);
}

- (IBAction)addItemToColorBarPressed:(id)sender {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [self.colorToolbar insertContentView:button atIndex:2];
}

- (IBAction)removeItemToColorBarPressed:(id)sender {
    [self.colorToolbar removeContentViewAtIndex:2];
}

- (IBAction)replaceItemToColorBarPressed:(id)sender {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [self.colorToolbar setContentView:button atIndex:5];
    [self.colorToolbar reloadToolbarAtIndex:5];
}

@end

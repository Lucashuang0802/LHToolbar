//
//  LHViewController.m
//  LHToolbar
//
//  Created by Lucas Huang on 05/15/2016.
//  Copyright (c) 2016 Lucas Huang. All rights reserved.
//

#import "LHViewController.h"
#import "LHToolbar.h"

static CGFloat const toolbarHeight = 50.0f;
static CGFloat const colorToolbarHeight = 30.0f;
static CGFloat const gap = 2.0f;

@interface LHViewController ()
@property (nonatomic) LHToolbar *toolbar;
@property (nonatomic) LHToolbar *coolorToolbar;
@end

@implementation LHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addToolbar];
    [self addColorToolbar];
}

- (void)addToolbar {
    self.toolbar = [[LHToolbar alloc] initWithNumberOfItems:4];
    [self.toolbar setBackgroundColor:[UIColor redColor]];
    CGRect mainScreenBounds = [UIScreen mainScreen].bounds;
    self.toolbar.frame = CGRectMake(0, CGRectGetHeight(mainScreenBounds) - toolbarHeight, CGRectGetWidth(mainScreenBounds), toolbarHeight);
    
    UIButton *annotateButton = [[UIButton alloc] init];
    [annotateButton setImage:[UIImage imageNamed:@"annotate"] forState:UIControlStateNormal];
    [annotateButton setBackgroundColor:[UIColor blackColor]];
    annotateButton.frame = CGRectMake(gap, gap, CGRectGetWidth(mainScreenBounds) / 4 - gap * 2, toolbarHeight - gap * 2);
    
    UIButton *textButton = [[UIButton alloc] init];
    [textButton setImage:[UIImage imageNamed:@"text"] forState:UIControlStateNormal];
    [textButton setBackgroundColor:[UIColor blackColor]];
    textButton.frame = CGRectMake(gap, gap, CGRectGetWidth(mainScreenBounds) / 4 - gap * 2, toolbarHeight - gap * 2);
    
    UIButton *screenshotButton = [[UIButton alloc] init];
    [screenshotButton setImage:[UIImage imageNamed:@"screenshot"] forState:UIControlStateNormal];
    [screenshotButton setBackgroundColor:[UIColor blackColor]];
    screenshotButton.frame = CGRectMake(gap, gap, CGRectGetWidth(mainScreenBounds) / 4 - gap * 2, toolbarHeight - gap * 2);
    
    UIButton *eraseButton = [[UIButton alloc] init];
    [eraseButton setImage:[UIImage imageNamed:@"erase"] forState:UIControlStateNormal];
    [eraseButton setBackgroundColor:[UIColor blackColor]];
    eraseButton.frame = CGRectMake(gap, gap, CGRectGetWidth(mainScreenBounds) / 4 - gap * 2, toolbarHeight - gap * 2);

    [self.toolbar setContentView:annotateButton atIndex:0];
    [self.toolbar setContentView:textButton atIndex:1];
    [self.toolbar setContentView:screenshotButton atIndex:2];
    [self.toolbar setContentView:eraseButton atIndex:3];
    [self.view addSubview:self.toolbar];
}

- (void)addColorToolbar {
    
    // initialize tool bar
    self.coolorToolbar = [[LHToolbar alloc] initWithNumberOfItems:9];
    self.coolorToolbar.backgroundColor = [UIColor lightGrayColor];
    CGRect mainScreenBounds = [UIScreen mainScreen].bounds;
    CGFloat offset = 50.0f;
    self.coolorToolbar.frame = CGRectMake(offset / 2, CGRectGetHeight(mainScreenBounds) - toolbarHeight - colorToolbarHeight, CGRectGetWidth(mainScreenBounds) - offset, colorToolbarHeight);
    [self.view addSubview:self.coolorToolbar];
    
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
        [button setFrame:CGRectMake(gap, gap, (CGRectGetWidth(mainScreenBounds) - offset) / 9.0 - gap * 2, colorToolbarHeight - gap * 2)];
        [button.layer setCornerRadius:colorToolbarHeight / 2.0f];
        [self.coolorToolbar setContentView:button atIndex:i -  1];
    }
    
    // reload tool bar
    [self.coolorToolbar reloadToolbar];
}

- (void)buttonPressed:(UIButton *)button {
    NSLog(@"%@ is pressed", button.description);
}

#pragma mark - IBAction
- (IBAction)addItemToColorBarPressed:(id)sender {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [self.coolorToolbar insertContentView:button atIndex:2];
}

- (IBAction)removeItemToColorBarPressed:(id)sender {
    [self.coolorToolbar removeContentViewAtIndex:2];
}

- (IBAction)addItemToToolBarPressed:(id)sender {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [self.toolbar insertContentView:button atIndex:3];
}

- (IBAction)removeItemToToolBarPressed:(id)sender {
    [self.toolbar removeContentViewAtIndex:3];
}

@end

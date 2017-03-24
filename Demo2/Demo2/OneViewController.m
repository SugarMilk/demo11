//
//  ViewController.m
//  Demo2
//
//  Created by 黄健 on 2017/3/18.
//  Copyright © 2017年 黄健. All rights reserved.
//

#import "OneViewController.h"
#import "TwoViewController.h"
#import "MZFormSheetPresentationViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    TwoViewController * two = [[TwoViewController alloc] init];
    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:two];
    navigationController.navigationBarHidden = YES;
    MZFormSheetPresentationViewController * formSheetController = [[MZFormSheetPresentationViewController alloc] initWithContentViewController:navigationController];
    formSheetController.contentViewCornerRadius = 5;
    formSheetController.contentViewControllerTransitionStyle = MZFormSheetPresentationTransitionStyleFade;
    formSheetController.presentationController.contentViewSize = CGSizeMake(250, 250);
    formSheetController.presentationController.shouldCenterVertically = YES;
    formSheetController.presentationController.shouldCenterHorizontally = YES;
    formSheetController.presentationController.shouldApplyBackgroundBlurEffect = NO;
    formSheetController.presentationController.shouldDismissOnBackgroundViewTap = YES;
    formSheetController.presentationController.backgroundColor = [UIColor clearColor];
    [self presentViewController:formSheetController animated:YES completion:nil];
}

@end

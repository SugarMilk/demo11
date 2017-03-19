//
//  ThreeViewController.m
//  Demo2
//
//  Created by 黄健 on 2017/3/18.
//  Copyright © 2017年 黄健. All rights reserved.
//

#import "ThreeViewController.h"
#import "FourViewController.h"
#import "MZFormSheetPresentationViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blueColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.navigationController popViewControllerAnimated:YES];
    FourViewController * four = [[FourViewController alloc] init];
//    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:four];
//    [self presentViewController:nav animated:YES completion:nil];
    
    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:four];
    navigationController.navigationBarHidden = NO;
    MZFormSheetPresentationViewController * formSheetController = [[MZFormSheetPresentationViewController alloc] initWithContentViewController:navigationController];
    formSheetController.contentViewCornerRadius = 0;
    formSheetController.contentViewControllerTransitionStyle = MZFormSheetPresentationTransitionStyleSlideFromRight;
    formSheetController.presentationController.contentViewSize = [UIScreen mainScreen].bounds.size;
    formSheetController.presentationController.portraitTopInset = -20;
    [self presentViewController:formSheetController animated:YES completion:nil];
}

@end

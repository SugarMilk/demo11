//
//  FourViewController.m
//  Demo2
//
//  Created by 黄健 on 2017/3/18.
//  Copyright © 2017年 黄健. All rights reserved.
//

#import "FourViewController.h"
#import "FiveViewController.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"- %@", NSStringFromCGRect(self.view.frame));
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
#if 1
    [self dismissViewControllerAnimated:self.navigationController completion:nil];
#else
    FiveViewController * five = [[FiveViewController alloc] init];
    [self.navigationController pushViewController:five animated:YES];
#endif
}

@end

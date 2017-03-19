//
//  ViewController.m
//  Demo3
//
//  Created by 黄健 on 2017/3/18.
//  Copyright © 2017年 黄健. All rights reserved.
//

#import "ViewController.h"
#import "TopView.h"

@interface ViewController ()

@property (nonatomic, strong) TopView * topView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.topView];
    
    [self.topView dealWithBackButtonAction:^(id object) {
        NSLog(@"点击");
    }];
}

- (TopView *)topView {
    if (_topView == nil) {
        _topView = [[TopView alloc] initWithFrame:CGRectMake(20, 20, 200, 200)];
        _topView.backgroundColor = [UIColor lightGrayColor];
        _topView.logoHidden = YES;
        _topView.backHidden = YES;
    }
    return _topView;
}

@end

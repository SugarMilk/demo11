//
//  TopView.m
//  Demo3
//
//  Created by 黄健 on 2017/3/18.
//  Copyright © 2017年 黄健. All rights reserved.
//

#import "TopView.h"

@interface TopView ()

@property (nonatomic, strong) UIButton * backButton;
@property (nonatomic, strong) UIImageView * logoImageView;
@property (nonatomic, copy) id_block_t backAction;

@end

@implementation TopView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.backButton];
        [self addSubview:self.logoImageView];
        
        self.backButton.frame = CGRectMake(0, 0, 30, 30);
        self.logoImageView.frame = CGRectMake((self.frame.size.width - 50)/2, 0, 50, 30);
    }
    return self;
}

- (void)setBackHidden:(BOOL)backHidden {
    self.backButton.hidden = _backHidden = backHidden;
}

- (void)setLogoHidden:(BOOL)logoHidden {
    self.logoImageView.hidden = _logoHidden = logoHidden;
}

- (void)dealWithBackButtonAction:(id_block_t)backAction {
    self.backAction = backAction;
}

- (void)backButtonAction:(UIButton *)button {
    if (self.backAction) {
        self.backAction(button);
    }
}

- (UIButton *)backButton {
    if (_backButton == nil) {
        _backButton = [[UIButton alloc] init];
        _backButton.backgroundColor = [UIColor redColor];
        [_backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

- (UIImageView *)logoImageView {
    if (_logoImageView == nil) {
        _logoImageView = [[UIImageView alloc] init];
        _logoImageView.backgroundColor = [UIColor orangeColor];
    }
    return _logoImageView;
}

@end

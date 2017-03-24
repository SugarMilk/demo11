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
@property (nonatomic, copy) id_block_t backButtonActionBlock;

@end

@implementation TopView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.backButton];
        [self addSubview:self.logoImageView];
        
        CGFloat width = self.bounds.size.width;
        CGFloat height = self.bounds.size.height;
        self.backButton.frame = CGRectMake(0, 0, height, height);
        self.logoImageView.frame = CGRectMake((width - height)/2, 0, height, height);
    }
    return self;
}

- (void)setBackButtonHidden:(BOOL)backButtonHidden {
    self.backButton.hidden = _backButtonHidden = backButtonHidden;
}

- (void)setLogoImageViewHidden:(BOOL)logoImageViewHidden {
    self.logoImageView.hidden = _logoImageViewHidden = logoImageViewHidden;
}

- (void)handleBackButtonActionBlock:(id_block_t)backButtonActionBlock {
    self.backButtonActionBlock = backButtonActionBlock;
}

- (void)backButtonAction:(UIButton *)button {
    if (self.backButtonActionBlock) {
        self.backButtonActionBlock(button);
    }
}

- (UIButton *)backButton {
    if (_backButton == nil) {
        _backButton = [[UIButton alloc] init];
        _backButton.backgroundColor = [UIColor whiteColor];
        [_backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

- (UIImageView *)logoImageView {
    if (_logoImageView == nil) {
        _logoImageView = [[UIImageView alloc] init];
        _logoImageView.backgroundColor = [UIColor whiteColor];
    }
    return _logoImageView;
}

@end

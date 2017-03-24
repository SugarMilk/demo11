//
//  TopView.h
//  Demo3
//
//  Created by 黄健 on 2017/3/18.
//  Copyright © 2017年 黄健. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^id_block_t)(id object);

@interface TopView : UIView

@property (nonatomic, readonly, strong) UIButton * backButton;
@property (nonatomic, readonly, strong) UIImageView * logoImageView;
@property (nonatomic, assign) BOOL logoImageViewHidden;
@property (nonatomic, assign) BOOL backButtonHidden;

- (void)handleBackButtonActionBlock:(id_block_t)backButtonActionBlock;

@end

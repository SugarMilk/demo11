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

@property (nonatomic, assign) BOOL logoHidden;
@property (nonatomic, assign) BOOL backHidden;

- (void)dealWithBackButtonAction:(id_block_t)backAction;

@end

//
//  GFTextField.m
//  UITextFieldDemo
//
//  Created by 黄健 on 2017/3/19.
//  Copyright © 2017年 黄健. All rights reserved.
//

#import "GFTextField.h"

@implementation GFTextField

- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    if (UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, self.placeholderInsets)) {
        return [super placeholderRectForBounds:bounds];
    }
    return UIEdgeInsetsInsetRect(bounds, self.placeholderInsets);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    if (UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, self.textInsets)) {
        return [super editingRectForBounds:bounds];
    }
    return UIEdgeInsetsInsetRect(bounds, self.textInsets);
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    if (UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, self.textInsets)) {
        return [super textRectForBounds:bounds];
    }
    return UIEdgeInsetsInsetRect(bounds, self.textInsets);
}

- (void)setCursorColor:(UIColor *)cursorColor {
    self.tintColor = cursorColor;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    [self setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
}

- (void)setPlaceholderFontSize:(CGFloat)placeholderFontSize {
    [self setValue:[UIFont systemFontOfSize:placeholderFontSize] forKeyPath:@"_placeholderLabel.font"];
}

@end

@interface GFTextFieldView () <UITextFieldDelegate>

@property (nonatomic, strong) GFTextField * textField;
@property (nonatomic, strong) UIButton * leftButton;
@property (nonatomic, strong) UIButton * rightButton;
@property (nonatomic, copy) GFTextFieldButtonActionBlock buttonActionBlock;
@property (nonatomic, copy) GFTextFieldStatusBlock textFieldStatusBlock;
@property (nonatomic, copy) GFTextFieldShouldChangeBlock textFieldShouldChangeBlock;

@end

@implementation GFTextFieldView

- (instancetype)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
        [self addSubview:self.textField];
    }
    return self;
}

- (void)textDidChange:(NSNotification *)notification {
    if (self.textFieldStatusBlock) {
        self.textFieldStatusBlock(self.textField, GFTextFieldStatusTypeTextDidChange);
    }
}

- (void)addWithButtonType:(GFTextFieldButtonType)type width:(CGFloat)width {
    if (type == GFTextFieldButtonTypeLeft) {
        CGRect rect = self.bounds;
        rect.size.width = width;
        self.leftButton.frame = rect;
        self.textField.leftView = self.leftButton;
        self.textField.leftViewMode = UITextFieldViewModeAlways;
    } else {
        CGRect rect = self.bounds;
        rect.size.width = width;
        self.rightButton.frame = rect;
        self.textField.rightView = self.rightButton;
        self.textField.rightViewMode = UITextFieldViewModeAlways;
    }
}

- (void)handleRightButtonAction:(GFTextFieldButtonActionBlock)buttonActionBlock {
    self.buttonActionBlock = buttonActionBlock;
}

- (void)handleTextFieldStatusBlock:(GFTextFieldStatusBlock)statusBlock
                 shouldChangeBlock:(GFTextFieldShouldChangeBlock)shouldChangBlock {
    self.textFieldStatusBlock = statusBlock;
    self.textFieldShouldChangeBlock = shouldChangBlock;
}

- (void)rightButtonAction:(UIButton *)button {
    self.buttonActionBlock(button);
}

- (void)layoutSubviews {
    self.textField.frame = self.bounds;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return self.textFieldEditDisabled == NO;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (self.textFieldShouldChangeBlock) {
        return self.textFieldShouldChangeBlock(self.textField, range, string);
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (self.textFieldStatusBlock) {
        self.textFieldStatusBlock(self.textField, GFTextFieldStatusTypeDidBeginEditing);
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (self.textFieldStatusBlock) {
        self.textFieldStatusBlock(self.textField, GFTextFieldStatusTypeDidEndEditing);
    }
}

- (GFTextField *)textField {
    if (_textField == nil) {
        _textField = [[GFTextField alloc] init];
        _textField.delegate = self;
    }
    return _textField;
}

- (UIButton *)leftButton {
    if (_leftButton == nil) {
        _leftButton = [[UIButton alloc] init];
        _leftButton.userInteractionEnabled = NO;
    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if (_rightButton == nil) {
        _rightButton = [[UIButton alloc] init];
        [_rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

@implementation GFTextFieldValidator



@end





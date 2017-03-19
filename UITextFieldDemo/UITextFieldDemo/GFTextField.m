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
    return UIEdgeInsetsInsetRect(bounds, self.placeholderInsets);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return UIEdgeInsetsInsetRect(bounds, self.textInsets);
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    return UIEdgeInsetsInsetRect(bounds, self.textInsets);
}

@end

@interface GFTextFieldView () <UITextFieldDelegate>

@property (nonatomic, strong) GFTextField * textField;
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

- (void)handleTextFieldStatusBlock:(GFTextFieldStatusBlock)statusBlock
                 shouldChangeBlock:(GFTextFieldShouldChangeBlock)shouldChangBlock {
    self.textFieldStatusBlock = statusBlock;
    self.textFieldShouldChangeBlock = shouldChangBlock;
}

- (void)layoutSubviews {
    self.textField.frame = self.bounds;
}

#pragma mark - UITextFieldDelegate

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
        _textField.backgroundColor = [UIColor whiteColor];
    }
    return _textField;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

@implementation GFTextFieldValidator



@end





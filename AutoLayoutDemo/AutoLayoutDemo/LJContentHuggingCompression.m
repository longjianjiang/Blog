//
//  LJContentHuggingCompression.m
//  AutoLayoutDemo
//
//  Created by longjianjiang on 2017/5/7.
//  Copyright © 2017年 Jiang. All rights reserved.
//

#import "LJContentHuggingCompression.h"

@interface LJContentHuggingCompression ()

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UITextField *nameField;
@end

@implementation LJContentHuggingCompression

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.nameField];
    
    NSLayoutConstraint *fieldTrailing = [NSLayoutConstraint constraintWithItem:self.nameField attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    NSLayoutConstraint *fieldTop = [NSLayoutConstraint constraintWithItem:self.nameField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:100];
    NSLayoutConstraint *fieldLeft = [NSLayoutConstraint constraintWithItem:self.nameField attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.nameLabel attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:5];
    [self.view addConstraints:@[fieldTrailing, fieldTop, fieldLeft]];
    
    NSLayoutConstraint *labelLeading = [NSLayoutConstraint constraintWithItem:self.nameLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:10];
    NSLayoutConstraint *labelBaseline = [NSLayoutConstraint constraintWithItem:self.nameLabel attribute:NSLayoutAttributeBaseline relatedBy:NSLayoutRelationEqual toItem:self.nameField attribute:NSLayoutAttributeBaseline multiplier:1.0 constant:0.0];
    [self.view addConstraints:@[labelLeading, labelBaseline]];
    
    
    [self.nameLabel setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisHorizontal];
}

#pragma mark getter and setter
- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _nameLabel.backgroundColor = [UIColor orangeColor];
        _nameLabel.text = @"Name";
        _nameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _nameLabel;
}

- (UITextField *)nameField {
    if (!_nameField) {
        _nameField = [UITextField new];
        _nameField.translatesAutoresizingMaskIntoConstraints = NO;
        _nameField.borderStyle = UITextBorderStyleRoundedRect;
        _nameField.placeholder = @"please enter name";
    }
    return _nameField;
}
@end

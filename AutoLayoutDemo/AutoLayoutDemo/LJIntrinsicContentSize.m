//
//  LJIntrinsicController.m
//  AutoLayoutDemo
//
//  Created by longjianjiang on 2017/5/7.
//  Copyright © 2017年 Jiang. All rights reserved.
//

#import "LJIntrinsicContentSize.h"
#import "Masonry.h"
#import "UIView+Extension.h"

@interface LJIntrinsicContentSize ()
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UILabel *msgLabel;
@property (nonatomic,strong) UIImageView *avatarView;
@end

@implementation LJIntrinsicContentSize

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.contentView];
    [self.contentView addSubview:self.msgLabel];
    [self.contentView addSubview:self.avatarView];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.leading.trailing.equalTo(self.view);
    }];
    
    [self.msgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView).offset(5);
        make.top.equalTo(self.contentView);
        make.trailing.lessThanOrEqualTo(self.contentView).offset(-5);
    }];
    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.msgLabel.mas_bottom).offset(10);
        make.leading.equalTo(self.contentView).offset(5);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(250);
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
    CGSize size1 = [_msgLabel intrinsicContentSize];
    CGSize size2 = [_avatarView intrinsicContentSize];
    CGSize size3 = [_contentView intrinsicContentSize];
    
    NSLog(@"size1 = %@", NSStringFromCGSize(size1));
    NSLog(@"size2 = %@", NSStringFromCGSize(size2));
    NSLog(@"size3 = %@", NSStringFromCGSize(size3));
    
    CGSize bgViewSize = _contentView.frame.size;
    NSLog(@"bgViewSize = %@", NSStringFromCGSize(bgViewSize));
    
    
}
#pragma getter and setter
- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor orangeColor];
    }
    return _contentView;
}
- (UILabel *)msgLabel {
    if (!_msgLabel) {
        _msgLabel = [UILabel new];
        _msgLabel.text = @"Hi Julie. I like design and product, and i think a product manager who should know some design stuff, but right now i am a iOS programmer. In future, i want to be transition to a product manager, and as you know i think design is important to me. So, i want to get some advice from you(maybe recommend some book about design). How can i do some thing about design and let me can entry design better. Thanks!";
        _msgLabel.font = [UIFont systemFontOfSize:15];
        _msgLabel.backgroundColor = [UIColor redColor];
        _msgLabel.textAlignment = NSTextAlignmentLeft;
        _msgLabel.numberOfLines = 0;
    }
    return _msgLabel;
}

- (UIImageView *)avatarView {
    if (!_avatarView) {
        _avatarView = [UIImageView new];
        _avatarView.image = [UIImage imageNamed:@"avatar_default_big"];
    }
    return _avatarView;
}

@end

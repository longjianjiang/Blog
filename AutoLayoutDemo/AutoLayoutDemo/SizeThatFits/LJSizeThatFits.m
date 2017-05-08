//
//  LJSizeThatFits.m
//  AutoLayoutDemo
//
//  Created by longjianjiang on 2017/5/8.
//  Copyright © 2017年 Jiang. All rights reserved.
//

#import "LJSizeThatFits.h"
#import "Masonry.h"
@interface LJSizeThatFits ()
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UILabel *textLabel;
@property (nonatomic,strong) UITextView *textView;
@end

@implementation LJSizeThatFits

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view.
    [self.view addSubview:self.contentView];
    [self.contentView addSubview:self.textView];
    [self.contentView addSubview:self.textLabel];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.leading.trailing.equalTo(self.view);
    }];
    
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView).offset(20);
        make.top.equalTo(self.contentView).offset(10);
    }];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView).offset(20);
        make.top.equalTo(self.textLabel.mas_bottom).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    CGSize size = [self.textView sizeThatFits:CGSizeMake(self.view.frame.size.width - 20, 0)];
    [self.textView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(size.width);
        make.height.mas_equalTo(size.height);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark getter and setter 
- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor orangeColor];
    }
    return _contentView;
}
- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [UILabel new];
        _textLabel.backgroundColor = [UIColor redColor];
        _textLabel.textAlignment = NSTextAlignmentLeft;
        _textLabel.numberOfLines = 0;
        _textLabel.preferredMaxLayoutWidth = self.view.frame.size.width - 20;
        _textLabel.text = @"Hi Julie. I like design and product, and i think a product manager who should know some design stuff, but right now i am a iOS programmer. ";
    }
    return _textLabel;
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [UITextView new];
        _textView.font = [UIFont systemFontOfSize:18];
        _textView.text = @"Hi Julie. I like design and product, and i think a product manager who should know some design stuff, but right now i am a iOS programmer. ";
    }
    return _textView;
}
@end

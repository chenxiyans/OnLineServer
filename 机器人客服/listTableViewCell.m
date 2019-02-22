//
//  listTableViewCell.m
//  机器人客服
//
//  Created by wisexotech on 2019/2/22.
//  Copyright © 2019年 chen. All rights reserved.
//

#import "listTableViewCell.h"
#import "Masonry.h"
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
@implementation listTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}
-(void)createUI
{
    __weak __typeof(self) weakSelf = self;
    self.greetingsLabel = [UILabel new];
    self.greetingsLabel.backgroundColor = RGBA(204, 204, 204, 1);
    self.greetingsLabel.layer.cornerRadius = 10;
    self.greetingsLabel.layer.masksToBounds = YES;
    self.greetingsLabel.text = @"Hello～ 机器人1号为您服务";
    self.greetingsLabel.font = [UIFont systemFontOfSize:11];
    self.greetingsLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.greetingsLabel];
    [self.greetingsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.contentView.mas_centerX);
        make.top.mas_offset(15);
        make.height.mas_offset(20);
        make.width.mas_offset(170);
    }];
    
    self.serverHeader = [UIImageView new];
    self.serverHeader.image = [UIImage imageNamed:@"aboutme_l"];
    [self.serverHeader setContentMode:UIViewContentModeScaleAspectFit];
    [self.contentView addSubview:self.serverHeader];
    [self.serverHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(17);
        make.top.mas_equalTo(weakSelf.greetingsLabel.mas_bottom).offset(15);
        make.width.mas_offset(35);
        make.height.mas_offset(35);
    }];
    
    self.serverName = [UILabel new];
    self.serverName.text = @"机器人1号";
    self.serverName.textColor = RGBA(51, 51, 51, 1);
    self.serverName.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:self.serverName];
    [self.serverName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.serverHeader.mas_right).offset(10);
        make.top.mas_equalTo(weakSelf.serverHeader.mas_top).offset(0);
    }];
    
    self.serverAnswerLabel = [UILabel new];
    self.serverAnswerLabel.backgroundColor = [UIColor whiteColor];
    self.serverAnswerLabel.layer.cornerRadius = 7;
    self.serverAnswerLabel.layer.masksToBounds = YES;
    self.serverAnswerLabel.textColor =  RGBA(51, 51, 51, 1);
    self.serverAnswerLabel.font = [UIFont systemFontOfSize:14];
    self.serverAnswerLabel.text = @"亲，请问您遇到了什么问题？";
    self.serverAnswerLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.serverAnswerLabel];
    [self.serverAnswerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.serverHeader.mas_right).offset(10);
        make.top.mas_equalTo(weakSelf.serverName.mas_bottom).offset(5);
        make.height.mas_offset(40);
        make.width.mas_offset(206);
    }];
    
    self.questionListView = [UIView new];
    self.questionListView.backgroundColor = [UIColor whiteColor];
    self.questionListView.layer.cornerRadius = 7;
    [self.contentView addSubview:self.questionListView];
    [self.questionListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.serverHeader.mas_right).offset(10);
        make.top.mas_equalTo(weakSelf.serverAnswerLabel.mas_bottom).offset(15);
        make.width.mas_offset(250);
        make.height.mas_offset(195);
    }];
    
    self.questionTitle = [UILabel new];
    self.questionTitle.text = @"猜您想问以下问题：";
    self.questionTitle.textColor = RGBA(51, 51, 51, 1);
    self.questionTitle.font = [UIFont systemFontOfSize:15];
    [self.questionListView addSubview:self.questionTitle];
    [self.questionTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.top.mas_offset(15);
    }];
    
    NSArray * listTitle = @[@"1. 点我试试？",@"2. 问题1？",@"3. 问题2？",@"4. 问题3？"];
    for (int i=0; i<4; i++) {
        self.questionListBtn = [UIButton new];
        [self.questionListBtn setTitle:listTitle[i] forState:UIControlStateNormal];
        [self.questionListBtn setTitleColor:RGBA(0, 116, 255, 1) forState:UIControlStateNormal];
        self.questionListBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        self.questionListBtn.tag = 200+i;
        [self.questionListBtn addTarget:self action:@selector(questionListBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.questionListView addSubview:self.questionListBtn];
        [self.questionListBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(15);
            make.top.mas_equalTo(weakSelf.questionTitle.mas_bottom).offset(i*(33)+20);
        }];
    }
    
    
}
-(void)questionListBtnClick:(UIButton *)button
{
    [self.delegate setValueQuesstonListChoice:button.tag];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

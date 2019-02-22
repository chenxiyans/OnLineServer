//
//  chatTableViewCell.m
//  机器人客服
//
//  Created by wisexotech on 2019/2/22.
//  Copyright © 2019年 chen. All rights reserved.
//

#import "chatTableViewCell.h"
#import "Masonry.h"
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
@implementation chatTableViewCell

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
    self.headImageView = [[UIImageView alloc] init];
    self.headImageView.layer.cornerRadius = 35;
    [self.headImageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.contentView addSubview:self.headImageView];
    
    
    self.backView = [[UIImageView alloc] init];
    self.backView.backgroundColor = [UIColor whiteColor];
    self.backView.layer.cornerRadius = 7;
    [self.contentView addSubview:self.backView];
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.font = [UIFont systemFontOfSize:14];//AdaptedFontSize(14)
    //self.contentLabel.textAlignment = NSTextAlignmentCenter;
    [self.backView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(10);
        make.right.mas_offset(-5);
        make.centerY.mas_equalTo(weakSelf.backView.mas_centerY);
    }];
    self.time = [UILabel new];
    self.time.backgroundColor = RGBA(204, 204, 204, 1);
    self.time.layer.cornerRadius = 10;
    self.time.layer.masksToBounds = YES;
    self.time.textColor = [UIColor whiteColor];
    self.time.font = [UIFont systemFontOfSize:11];
    self.time.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.time];
    [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.contentView.mas_centerX);
        make.top.mas_equalTo(weakSelf.backView.mas_bottom).offset(15);
        make.width.mas_offset(50);
        make.height.mas_offset(20);
    }];
}
-(void)refreshCell:(chatModel *)model
{
    __weak __typeof(self) weakSelf = self;
    // 首先计算文本宽度和高度
    CGRect contentREC = [model.msg boundingRectWithSize:CGSizeMake(240, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil];
    // 模拟左边
    if (!model.isRight)
    {
        self.headImageView.image = [UIImage imageNamed:@"aboutme_l"];
        [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(17);
            make.top.mas_offset(15);
            make.width.mas_offset(35);
            make.height.mas_offset(35);
        }];
        [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.headImageView.mas_right).mas_offset(10);
            make.top.mas_equalTo(weakSelf.headImageView.mas_top).offset(0);
            make.width.mas_offset(contentREC.size.width+20);
            make.height.mas_offset(contentREC.size.height+20);
        }];
        
    }else//右边
    {
        self.headImageView.image = [UIImage imageNamed:@"aboutme"];
        [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-17);
            make.top.mas_offset(15);
            make.width.mas_offset(35);
            make.height.mas_offset(35);
        }];
        self.backView.backgroundColor = RGBA(77, 158, 255, 1);
        [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(weakSelf.headImageView.mas_left).mas_offset(-10);
            make.top.mas_equalTo(weakSelf.headImageView.mas_top).offset(0);
            make.width.mas_offset(contentREC.size.width+20);
            make.height.mas_offset(contentREC.size.height+20);
        }];
        
        self.contentLabel.textColor = [UIColor whiteColor];
    }
    
    self.contentLabel.text = model.msg;
    self.time.text = model.time;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

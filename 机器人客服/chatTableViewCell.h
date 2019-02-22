//
//  chatTableViewCell.h
//  机器人客服
//
//  Created by wisexotech on 2019/2/22.
//  Copyright © 2019年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "chatModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface chatTableViewCell : UITableViewCell
@property (nonatomic,strong) UIImageView *headImageView; // 用户头像
@property (nonatomic,strong) UIImageView *backView; // 气泡
@property (nonatomic,strong) UILabel *contentLabel; // 气泡内文本
@property (nonatomic,strong) UILabel *time;

- (void)refreshCell:(chatModel *)model; // 安装我们的cell
@end

NS_ASSUME_NONNULL_END

//
//  listTableViewCell.h
//  机器人客服
//
//  Created by wisexotech on 2019/2/22.
//  Copyright © 2019年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol listTableViewCellDelegate <NSObject>
-(void)setValueQuesstonListChoice:(NSInteger)tag;

@end
NS_ASSUME_NONNULL_BEGIN

@interface listTableViewCell : UITableViewCell
@property(nonatomic,weak) id<listTableViewCellDelegate>delegate;
@property(nonatomic,strong)UILabel * greetingsLabel;
@property(nonatomic,strong)UIImageView * serverHeader;
@property(nonatomic,strong)UILabel * serverName;
@property(nonatomic,strong)UILabel * serverAnswerLabel;
@property(nonatomic,strong)UIView * questionListView;
@property(nonatomic,strong)UILabel * questionTitle;
@property(nonatomic,strong)UIButton * questionListBtn;
@end

NS_ASSUME_NONNULL_END

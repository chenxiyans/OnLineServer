//
//  OnLineViewController.h
//  机器人客服
//
//  Created by wisexotech on 2019/2/22.
//  Copyright © 2019年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "listTableViewCell.h"
#import "chatTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface OnLineViewController : UIViewController
@property(nonatomic,strong)UITableView * tableView;
@property (nonatomic,strong) NSMutableArray *dataSouce;
@end

NS_ASSUME_NONNULL_END

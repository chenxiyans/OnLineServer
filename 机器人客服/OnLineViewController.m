//
//  OnLineViewController.m
//  机器人客服
//
//  Created by wisexotech on 2019/2/22.
//  Copyright © 2019年 chen. All rights reserved.
//

#import "OnLineViewController.h"
#import "chatModel.h"
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
@interface OnLineViewController ()<UITableViewDelegate,UITableViewDataSource,listTableViewCellDelegate>

@end

@implementation OnLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"在线客服";
    [self.view addSubview:self.tableView];
}

#pragma mark - getter And setter
-(UITableView *)tableView
{
    if (!_tableView) {
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.tableView.showsVerticalScrollIndicator =NO;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.backgroundColor = RGBA(240, 240, 240, 1);
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}
#pragma mark - UITableViewCellDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }else
    {
        return self.dataSouce.count;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 315;
    }else
    {
        chatModel *model = self.dataSouce[indexPath.row];
        CGRect rec =  [model.msg boundingRectWithSize:CGSizeMake(240, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil];
        return rec.size.height + 45+20+20;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        NSString * cellID = @"TOPANSWERCELL";
        listTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[listTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = RGBA(240, 240, 240, 1);
            cell.delegate = self;
        }
        return cell;
    }else
    {
        NSString * cellID = @"ANSWERCELL";
        chatTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[chatTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = RGBA(240, 240, 240, 1);
        }
        [cell refreshCell:self.dataSouce[indexPath.row]];
        return cell;
    }
    
}
#pragma mark - listTableViewCellDelegate
-(void)setValueQuesstonListChoice:(NSInteger)tag
{
    NSArray * arr = @[@"点我试试？",@"问题1？",@"问题2？",@"问题3？"];
    NSArray * serverArr = @[@"干嘛",@"有问题,请联系我",@"喜欢请给star",@"喜欢请给star"];
    NSInteger i = tag-200;
    //添加数据
    chatModel *model = [[chatModel alloc] init];
    model.isRight = arc4random() % 2; // 0 or 1
    if (model.isRight ==1) {
        model.msg = arr[i];
    }else
    {
       model.msg = serverArr[i];
    }
    
    model.time = [self getTimeNow];
    [self.dataSouce addObject:model];
    [self.tableView reloadData];
    // 滚到底部  scroll so row of interest is completely visible at top/center/bottom of view
    if (self.dataSouce.count != 0) {
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.dataSouce.count - 1 inSection:1] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
}
- (NSMutableArray *)dataSouce
{
    if (_dataSouce == nil) {
        _dataSouce = [[NSMutableArray alloc] init];
    }
    return _dataSouce;
}
-(NSString *)getTimeNow
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"HH:mm"];
    
    //现在时间,你可以输出来看下是什么格式
    
    NSDate *datenow = [NSDate date];
    
    //----------将nsdate按formatter格式转成nsstring
    
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    
    return currentTimeString;
}
@end

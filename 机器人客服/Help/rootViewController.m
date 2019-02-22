//
//  rootViewController.m
//  机器人客服
//
//  Created by wisexotech on 2019/2/22.
//  Copyright © 2019年 chen. All rights reserved.
//

#import "rootViewController.h"
#import "OnLineViewController.h"
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
@interface rootViewController ()

@end

@implementation rootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViewControllers];
}
-(void)createViewControllers
{
    NSDictionary * toolDic = @{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:RGBA(0,115,232,1)};
    UINavigationController *personNav;
    OnLineViewController *person = [[OnLineViewController alloc]init];
    UIImage *personImage = [[UIImage imageNamed:@"tabBar_meSelect"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    person.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"个人中心" image:[UIImage imageNamed:@"tabBar_meNormal"] selectedImage:personImage];
    [person.tabBarItem setTitleTextAttributes:toolDic forState:UIControlStateHighlighted];
    personNav = [[UINavigationController alloc]initWithRootViewController:person];
    
    self.viewControllers = @[personNav];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

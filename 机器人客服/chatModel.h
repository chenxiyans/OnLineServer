//
//  chatModel.h
//  机器人客服
//
//  Created by wisexotech on 2019/2/22.
//  Copyright © 2019年 chen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface chatModel : NSObject
@property (nonatomic,copy) NSString *msg;
@property (nonatomic,assign) BOOL isRight;
@property (nonatomic,copy)NSString * time;
@end

NS_ASSUME_NONNULL_END

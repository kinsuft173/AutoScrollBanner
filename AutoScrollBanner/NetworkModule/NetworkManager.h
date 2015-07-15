//
//  NetworkManager.h
//  GSAPP
//
//  Created by 胡昆1 on 7/10/15.
//  Copyright (c) 2015 cn.kinsuft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewworkConfig.h"


@interface NetworkManager : NSObject

+ (NetworkManager*)shareMgr;



//广告部分
- (void)server_fetchAdvertisementWithDic:(NSDictionary*)dic completeHandle:(CompleteHandle)completeHandle;


@end

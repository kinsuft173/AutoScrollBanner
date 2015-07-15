//
//  NetworkManager.m
//  GSAPP
//
//  Created by 胡昆1 on 7/10/15.
//  Copyright (c) 2015 cn.kinsuft. All rights reserved.
//

#import "NetworkManager.h"
#import "AFNetworking.h"

@implementation NetworkManager

+ (NetworkManager*)shareMgr
{
    static NetworkManager* instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[NetworkManager alloc] init];

    });
    
    return instance;
}


#pragma mark - 广告页面

- (void)server_fetchAdvertisementWithDic:(NSDictionary*)dic completeHandle:(CompleteHandle)completeHandle
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //test
    //    NSDictionary *parameters = @{@"id": @"1"};
    
    [manager GET:[NSString stringWithFormat:@"%@%@",SERVER,APP_AD_URL] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        NSLog(@"JSON: %@", responseObject);
        
        completeHandle(responseObject);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        
    }];
    
}




@end

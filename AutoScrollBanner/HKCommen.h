//
//  HKCommen.h
//  GSAPP
//
//  Created by kinsuft173 on 15/6/6.
//  Copyright (c) 2015年 cn.kinsuft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define BANNER_COUNT 3
#define DOCTOR_RECOMMEND_COUNT 20
#define DOCTOR_RECOMMEND_Cell_WIDTH 100

#define DOCTOR_RECOMMEND_RATIO 169/320
#define DOCTOR_RECOMMEND_CELL_RATIO 0.2

//各种便利宏
#define IOS7 [[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0
#define IOS8 [[[UIDevice currentDevice]systemVersion] floatValue] >= 8.0


@interface HKCommen : NSObject

//正则验证
+ (BOOL)validateEmail:(NSString *)email;
+ (BOOL)validatePassword:(NSString *)passWord;
+ (BOOL)validateNickname:(NSString *)nickname;
+ (BOOL)validateMobileWithPhoneNumber:(NSString*)strPhoneNumber;
+ (UIColor*)getColor:(NSString *)hexColor;
//控制器的标题
+ (void)addHeadTitle: (NSString*)string whichNavigation:(UINavigationItem*)item;
+ (CGFloat)compulateTheHightOfAttributeLabelWithWidth:(CGFloat)width WithContent:(NSString*)string WithFontSize:(NSInteger)size;
//隐藏多余的分割线
+ (void)setExtraCellLineHidden: (UITableView *)tableView;

@end

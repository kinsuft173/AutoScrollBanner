//
//  AdvertisementCell.h
//  GSAPP
//
//  Created by lijingyou on 15/7/11.
//  Copyright (c) 2015年 cn.kinsuft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HKCommen.h"

#define PlaceHolderImage  @"loading-ios"

@interface AdvertisementCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIScrollView *myScroll;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

-(void)customUI:(NSMutableArray*)array;

@end

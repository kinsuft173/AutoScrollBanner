//
//  AdvertisementCell.m
//  GSAPP
//
//  Created by lijingyou on 15/7/11.
//  Copyright (c) 2015年 cn.kinsuft. All rights reserved.
//

#import "AdvertisementCell.h"
#import <UIImageView+WebCache.h>

@interface AdvertisementCell()<UIScrollViewDelegate>

@property NSInteger indexBanner;
@property NSInteger scrollCount;
@property (nonatomic ,strong) NSTimer* timer;

@end

@implementation AdvertisementCell

- (void)awakeFromNib {
    
    // Initialization code
    if ([self.contentView respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        self.contentView.preservesSuperviewLayoutMargins = NO;
    }
}

-(void)customUI:(NSMutableArray*)array
{
    
    if (self.myScroll.tag == 1001 || array.count == 0) {
        
        return;
        
    }
    
    self.myScroll.tag = 1001;
    
    self.myScroll.contentSize = CGSizeMake(SCREEN_WIDTH*(array.count + 1), SCREEN_WIDTH*0.2);
    
    self.scrollCount = array.count + 1;
    
    self.myScroll.delegate = self;
    
    
    for (int i = 0; i < array.count + 1; i++) {
        
        
        //只有一张图片的时候就不要添加额外的替代图片了
        if (array.count == 1 && i == 1) {
            
            continue;
            
        }
        
        
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_WIDTH*DOCTOR_RECOMMEND_RATIO)];
        
        [self.myScroll addSubview:imageView];
        
        self.myScroll.pagingEnabled = YES;
        
        NSString* strUrl = [[array objectAtIndex:i%(array.count)] objectForKey:@"uri"];
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:strUrl]
                    placeholderImage:[UIImage imageNamed:PlaceHolderImage] options:SDWebImageContinueInBackground];
        
    }
    
    
    //单独处理只有一张图的情况
    if (array.count == 1) {
        
        self.myScroll.scrollEnabled = NO;
        self.scrollCount = 2;
        
    }else{

        [self satrtTimer];
    }
    
    [self configPageControl];
    
}


- (void)configPageControl
{
    self.pageControl.backgroundColor=[UIColor clearColor];
    self.pageControl.numberOfPages = self.scrollCount - 1;
    self.pageControl.currentPage = 0;
}


- (void)satrtTimer
{
    [self.timer invalidate];
    
    self.timer = nil;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(bannerRunloop) userInfo:nil repeats:YES];
    [self.timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:5]];
}

- (void)bannerRunloop
{

    NSInteger pageIndex = self.myScroll.contentOffset.x/self.contentView.frame.size.width;
    
    pageIndex ++;
    
    pageIndex = pageIndex%(self.scrollCount);
    
    self.indexBanner = pageIndex;
    
    BOOL isAnimated = YES;
    
    if (pageIndex == 0) {
        
        [self.myScroll scrollRectToVisible:CGRectMake( pageIndex*self.contentView.frame.size.width,0, self.contentView.frame.size.width, self.contentView.frame.size.height) animated:NO];
        
        [self bannerRunloop];
        
        // 跟其他情况不同，跳回到第一张图的时候没有经过scroll，所以scroll那些代理并未执行,所以需要手动调节pageControl的number
        self.pageControl.currentPage = 0;

    }else{
    
        [self.myScroll scrollRectToVisible:CGRectMake(pageIndex*self.contentView.frame.size.width,0, self.contentView.frame.size.width, self.contentView.frame.size.height) animated:isAnimated];
        
    }

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = (scrollView.contentOffset.x/self.contentView.frame.size.width);
    
    if (scrollView.contentOffset.x == (self.scrollCount -1 )*self.contentView.frame.size.width) {
        
        [scrollView scrollRectToVisible:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height ) animated:NO];
        
        self.pageControl.currentPage = 0;
    }
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.timer invalidate];

}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{

    [self  satrtTimer];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x/self.contentView.frame.size.width == self.scrollCount - 1) {
        
        self.pageControl.currentPage = 0;
        
    }else{
    
        self.pageControl.currentPage = (scrollView.contentOffset.x/self.contentView.frame.size.width);
    
    }
    
}


@end

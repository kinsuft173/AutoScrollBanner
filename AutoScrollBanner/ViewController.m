//
//  ViewController.m
//  AutoScrollBanner
//
//  Created by 胡昆1 on 7/15/15.
//  Copyright (c) 2015 cn.kinsuft. All rights reserved.
//

#import "ViewController.h"
#import "AdvertisementCell.h"
#import "NetworkManager.h"
#import "HKCommen.h"

@interface ViewController ()

@property (strong,nonatomic)NSMutableArray *array_advertisement;

@property (nonatomic, strong) IBOutlet UITableView* tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initUI];
    [self getModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initUI
{
    [HKCommen setExtraCellLineHidden:self.tableView];

}

- (void)getModel
{
    [[NetworkManager shareMgr] server_fetchAdvertisementWithDic:nil completeHandle:^(NSDictionary *responseBanner) {
        
        self.array_advertisement = [[responseBanner objectForKey:@"data"] objectForKey:@"items"];
            
        [self.tableView reloadData];

        
    }];
    
}


#pragma tableble datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 209;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* CellId_first = @"AdvertisementCell";
    
    if (indexPath.section==0) {
        
        AdvertisementCell* cell = [tableView dequeueReusableCellWithIdentifier:CellId_first];
        
        if (!cell) {
            
            NSArray* topObjects = [[NSBundle mainBundle] loadNibNamed:CellId_first owner:self options:nil];
            
            cell = [topObjects objectAtIndex:0];
            
        }
        
        [cell customUI:self.array_advertisement];
        
        
        
        return cell;
    }
    
    return nil;
}



@end

//
//  ViewController.h
//  TimeProject
//
//  Created by nju on 15/11/30.
//  Copyright (c) 2015年 nju. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "userAppTable.h"

@interface TodayVC : UIViewController

@property (strong, nonatomic) NSMutableArray* appList;
@property (strong, nonatomic) NSMutableArray* userAppList;
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray* groupList;

-(void) initUserData;

@end


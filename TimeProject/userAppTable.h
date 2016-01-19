//
//  userAppTable.h
//  TimeProject
//
//  Created by nju on 16/1/18.
//  Copyright © 2016年 nju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface userAppTable : UITableView

@property (strong, nonatomic) NSMutableArray *userAppList;

- (void) initWithUserAppList: (NSMutableArray *)appList;

@end

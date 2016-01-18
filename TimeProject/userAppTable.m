//
//  userAppTable.m
//  TimeProject
//
//  Created by nju on 16/1/18.
//  Copyright © 2016年 nju. All rights reserved.
//

#import "userAppTable.h"

@implementation userAppTable


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}

- (void) initWithUserAppList: (NSMutableArray *)appList {
    self.userAppList = appList;
}

@end

//
//  GroupInfo.h
//  TimeProject
//
//  Created by nju on 16/1/19.
//  Copyright © 2016年 nju. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface groupInfo : NSObject<NSCoding>

@property (strong ,nonatomic) NSString* groupName;
@property (nonatomic) int no;

- (id) init;
- (id) initWithGroupName: (NSString*) name andNum: (int)num ;
- (int) countMember: (NSMutableArray*) userAppList;

@end

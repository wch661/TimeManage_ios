//
//  GroupInfo.m
//  TimeProject
//
//  Created by nju on 16/1/19.
//  Copyright © 2016年 nju. All rights reserved.
//

#import "groupInfo.h"
#import "userAppInfo.h"

@implementation groupInfo

- (id) initWithGroupName: (NSString*) name andNum: (int)num {
    self.groupName = name;
    self.no = num;
    return self;
}

- (id) init{
    self.groupName = nil;
    self.no = -1;
    return self;
}

- (void) encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.groupName forKey:@"GroupName"];
    [coder encodeInt:self.no forKey:@"no"];
}

- (id) initWithCoder:(NSCoder *) decoder {
    if (self){
        self.groupName = (NSString*)[decoder decodeObjectForKey:@"GroupName"];
        self.no = [decoder decodeIntForKey:@"no"];
    }
    return self;
}

- (int) countMember: (NSMutableArray*) userAppList{
    int count=0;
    for(int i = 0; i < userAppList.count; i++){
        if(((userAppInfo*)[userAppList objectAtIndex:i]).groupTag == self.no){
            ++count;
        }
    }
    return count;
}

@end

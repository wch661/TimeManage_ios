//
//  GetAppList.m
//  GetAppList
//
//  Created by nju on 16/1/16.
//  Copyright © 2016年 nju. All rights reserved.
//

#import "AppBase.h"

@implementation AppBase

- (id) init {
    self.appName = nil;
    self.appUrl = nil;
    return self;
}

- (void) encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.appUrl forKey:@"AppUrl"];
    [coder encodeObject:self.appName forKey:@"AppName"];
}

- (id) initWithCoder:(NSCoder *) decoder {
    if (self){
        self.appUrl = (NSString*)[decoder decodeObjectForKey:@"AppUrl"];
        self.appName = (NSString*)[decoder decodeObjectForKey:@"AppName"];
    }
    return self;
}

@end

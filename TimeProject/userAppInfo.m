//
//  userAppInfo.m
//  TimeProject
//
//  Created by nju on 16/1/19.
//  Copyright © 2016年 nju. All rights reserved.
//

#import "userAppInfo.h"

@implementation userAppInfo

- (id) initWithAppUrl: (NSString*) url andAppName: (NSString *)name {
    self.appUrl = url;
    self.appName = name;
    self.groupTag = 0;
    self.time = 0;
    return self;
}

- (id) init{
    self.appUrl = nil;
    self.appName = nil;
    self.groupTag = 0;
    self.time = 0;
    return self;
}

- (void) encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.appUrl forKey:@"AppUrl"];
    [coder encodeObject:self.appName forKey:@"AppName"];
    [coder encodeInt:self.groupTag forKey:@"GroupTag"];
    [coder encodeInt:self.time forKey:@"Time"];
}

- (id) initWithCoder:(NSCoder *) decoder {
    if (self){
        self.appUrl = (NSString*)[decoder decodeObjectForKey:@"AppUrl"];
        self.appName = (NSString*)[decoder decodeObjectForKey:@"AppName"];
        self.groupTag = [decoder decodeIntForKey:@"GroupTag"];
        self.time = [decoder decodeIntForKey:@"Time"];
    }
    return self;
}

@end

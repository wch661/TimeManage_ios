//
//  userAppInfo.h
//  TimeProject
//
//  Created by nju on 16/1/19.
//  Copyright © 2016年 nju. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface userAppInfo : NSObject <NSCoding>

@property (strong, nonatomic)NSString* appName;
@property (strong, nonatomic)NSString* appUrl;
@property (nonatomic)int groupTag;
@property (nonatomic)int time;

- (id) initWithAppUrl: (NSString*) url andAppName: (NSString *)name;
- (id) init;



@end

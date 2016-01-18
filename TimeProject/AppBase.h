//
//  GetAppList.h
//  GetAppList
//
//  Created by nju on 16/1/16.
//  Copyright © 2016年 nju. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppBase : NSObject <NSCoding>

@property (strong, nonatomic)NSString* appName;

@property (strong, nonatomic)NSString* appUrl;

@end

//
//  MyDevice.h
//  GetAppList
//
//  Created by nju on 15/12/29.
//  Copyright © 2015年 nju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyDevice : UIDevice {
    UIDevice *currentDevice;
}
- (void) initWithUIDevice : (UIDevice*) device;
- (NSArray *)runningProcesses;
@end

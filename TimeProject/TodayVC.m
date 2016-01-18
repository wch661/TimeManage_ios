//
//  ViewController.m
//  TimeProject
//
//  Created by nju on 15/11/30.
//  Copyright (c) 2015年 nju. All rights reserved.
//

#import "TodayVC.h"
#import "MyDevice.h"
#import "AppBase.h"

@interface TodayVC ()

@end

@implementation TodayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    initUserData(self.appList, self.userAppList);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

bool initListFile ( NSMutableArray* appList) {
    if(appList == nil)
        appList = [[NSMutableArray alloc] init];
    AppBase* appb = [[AppBase alloc] init];
    appb.appUrl = @"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=294409923&mt=8";
    appb.appName = @"AppStore";
    [appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"http://phobos.apple.com/WebObjects/MZStore.woa/wa/viewAlbum?i=156093464&id=156093462&s=143441";
    appb.appName = @"itunes";
    [appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"http://wiki.akosma.com/";
    appb.appName = @"Safari";
    [appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"ibooks://";
    appb.appName = @"iBooks";
    [appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"music:";
    appb.appName = @"Music";
    [appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"videos:";
    appb.appName = @"Videos";
    [appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"mqq://";
    appb.appName = @"QQ";
    [appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"weixin://";
    appb.appName = @"weixin";
    [appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"taobao://";
    appb.appName = @"taobao";
    [appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"sinaweibo://";
    appb.appName = @"sinaweibo";
    [appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"zhihu://";
    appb.appName = @"zhihu";
    [appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"imeituan://";
    appb.appName = @"meituan";
    [appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"yddictproapp://";
    appb.appName = @"yddict";
    [appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"youku://";
    appb.appName = @"youku";
    [appList addObject:appb];
    appb = [[AppBase alloc] init];
    
    NSData* data = [NSKeyedArchiver archivedDataWithRootObject:appList];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"AppTable"];
    return false;
}


void initUserData (NSMutableArray *appList, NSMutableArray *userAppList) {
    //    NSArray *bundles2Check = [NSArray arrayWithObjects: @"http://", @"ibooks://", @"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=294409923&mt=8", nil];
    //    for (NSString *identifier in bundles2Check)
    //        if (APCheckIfAppInstalled(identifier))
    //            NSLog(@"App installed: %@", identifier);
    //        else
    //            NSLog(@"App not installed: %@", identifier);
    NSString *stringURL = @"videos:";
    NSURL *url = [NSURL URLWithString:stringURL];
    [[UIApplication sharedApplication] openURL:url];
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"http://"]])
        NSLog(@"Yes");
    else
        NSLog(@"NO");
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"ibooks://"]])
        NSLog(@"Yes");
    else
        NSLog(@"NO");
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=294409923&mt=8"]])
        NSLog(@"Yes");
    else
        NSLog(@"NO");
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"music://"]])
        NSLog(@"Yes");
    else
        NSLog(@"NO");
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"videos:://"]])
        NSLog(@"Yes");
    else
        NSLog(@"NO");
    MyDevice* d =[MyDevice alloc];
    [d initWithUIDevice:([UIDevice currentDevice])];
    NSArray * processes = [d runningProcesses];
    for (NSDictionary * dict in processes){
        NSLog(@"%@ - %@", [dict objectForKey:@"ProcessID"], [dict objectForKey:@"ProcessName"]);
    }
    
//        initListFile (appList);
    
    NSData* data = (NSData* )[[NSUserDefaults standardUserDefaults] objectForKey:@"AppTable"];
    appList = (NSMutableArray *)[NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    if(userAppList == nil)
        userAppList = [[NSMutableArray alloc] init];
    for (int i =0; i<appList.count; i++) {
        NSString *u = ((AppBase*)[appList objectAtIndex:i]).appUrl;
        //        NSString *n = ((AppBase*)[slf.appList objectAtIndex:i]).appName;
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:u]]) {
            [userAppList addObject:(AppBase*)[appList objectAtIndex:i]];
        }
    }
    
    for (int i =0; i < userAppList.count; i++) {
        NSString *u = ((AppBase*)[userAppList objectAtIndex:i]).appUrl;
        NSString *n = ((AppBase*)[userAppList objectAtIndex:i]).appName;
        NSLog(@"%@ - %@", u, n);
    }
    
}

@end

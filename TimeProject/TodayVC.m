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
#import "userAppInfo.h"
#import "groupInfo.h"

@interface TodayVC ()

@end

@implementation TodayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initUserData];
    self.tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (bool) initListFile{
    if(self.appList == nil)
        self.appList = [[NSMutableArray alloc] init];
    AppBase* appb = [[AppBase alloc] init];
    appb.appUrl = @"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=294409923&mt=8";
    appb.appName = @"AppStore";
    [self.appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"http://phobos.apple.com/WebObjects/MZStore.woa/wa/viewAlbum?i=156093464&id=156093462&s=143441";
    appb.appName = @"itunes";
    [self.appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"http://wiki.akosma.com/";
    appb.appName = @"Safari";
    [self.appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"ibooks://";
    appb.appName = @"iBooks";
    [self.appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"music:";
    appb.appName = @"Music";
    [self.appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"videos:";
    appb.appName = @"Videos";
    [self.appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"mqq://";
    appb.appName = @"QQ";
    [self.appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"weixin://";
    appb.appName = @"weixin";
    [self.appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"taobao://";
    appb.appName = @"taobao";
    [self.appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"sinaweibo://";
    appb.appName = @"sinaweibo";
    [self.appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"zhihu://";
    appb.appName = @"zhihu";
    [self.appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"imeituan://";
    appb.appName = @"meituan";
    [self.appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"yddictproapp://";
    appb.appName = @"yddict";
    [self.appList addObject:appb];
    appb = [[AppBase alloc] init];
    appb.appUrl = @"youku://";
    appb.appName = @"youku";
    [self.appList addObject:appb];
    appb = [[AppBase alloc] init];
    
    NSData* data = [NSKeyedArchiver archivedDataWithRootObject:self.appList];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"AppTable"];
    
    if(self.groupList == nil)
        self.groupList = [[NSMutableArray alloc] init];
    groupInfo* gi = [[groupInfo alloc] initWithGroupName:@"Default" andNum:0];
    [self.groupList addObject:gi];
    data = [NSKeyedArchiver archivedDataWithRootObject:self.groupList];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"GroupTable"];
    return true;
}




-(void) initUserData {
    //    NSArray *bundles2Check = [NSArray arrayWithObjects: @"http://", @"ibooks://", @"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=294409923&mt=8", nil];
    //    for (NSString *identifier in bundles2Check)
    //        if (APCheckIfAppInstalled(identifier))
    //            NSLog(@"App installed: %@", identifier);
    //        else
    //            NSLog(@"App not installed: %@", identifier);
//    NSString *stringURL = @"videos:";
//    NSURL *url = [NSURL URLWithString:stringURL];
//    [[UIApplication sharedApplication] openURL:url];
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
    
    [self initListFile];
    
    
    NSData* data = (NSData* )[[NSUserDefaults standardUserDefaults] objectForKey:@"AppTable"];
    self.appList = (NSMutableArray *)[NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    if(self.userAppList == nil)
        self.userAppList = [[NSMutableArray alloc] init];
    for (int i =0; i<self.appList.count; i++) {
        NSString *u = ((AppBase*)[self.appList objectAtIndex:i]).appUrl;
        NSString *n = ((AppBase*)[self.appList objectAtIndex:i]).appName;
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:u]]) {
            
            [self.userAppList addObject:[[userAppInfo alloc] initWithAppUrl:u andAppName: n]];
        }
    }
    
    for (int i =0; i < self.userAppList.count; i++) {
        NSString *u = ((userAppInfo*)[self.userAppList objectAtIndex:i]).appUrl;
        NSString *n = ((userAppInfo*)[self.userAppList objectAtIndex:i]).appName;
        NSLog(@"%@ - %@", u, n);
    }
    

    data = (NSData* )[[NSUserDefaults standardUserDefaults] objectForKey:@"GroupTable"];
    self.groupList = (NSMutableArray *)[NSKeyedUnarchiver unarchiveObjectWithData:data];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"计算分组数");
    return self.groupList.count;
}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"计算每组(组%li)行数",(long)section);
    //    KCContactGroup *group1=_contacts[section];
    groupInfo* gi = [[groupInfo alloc] initWithGroupName:nil andNum:(int)section];
    int count = [gi countMember:self.userAppList];
    return count;
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSIndexPath是一个结构体，记录了组和行信息
    NSLog(@"生成单元格(组：%li,行%li)",(long)indexPath.section,(long)indexPath.row);
    //    KCContactGroup *group=_contacts[indexPath.section];
    //    KCContact *contact=group.contacts[indexPath.row];
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    int temp = 0;
    for(int i = 0; i<self.userAppList.count; ++i){
        if(((userAppInfo*)[self.userAppList objectAtIndex:i]).groupTag == (int)indexPath.section){
            if(temp == (int)indexPath.row){
                cell.textLabel.text= [(userAppInfo *)[self.userAppList objectAtIndex:i] appName];
                cell.detailTextLabel.text=[(userAppInfo *)[self.userAppList objectAtIndex:i] appUrl];
            }
            ++temp;
        }
    }
    
    //    cell.textLabel.text=[userAppInfo getName];
    //    cell.detailTextLabel.text=contact.phoneNumber;
    return cell;
}

#pragma mark 返回每组头标题名称
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSLog(@"生成组（组%li）名称",(long)section);
    //    KCContactGroup *group=_contacts[section];
    return ((groupInfo*)[self.groupList objectAtIndex:(int)section]).groupName;
}

//#pragma mark 返回每组尾部说明
//-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
//    NSLog(@"生成尾部（组%i）详情",section);
//    KCContactGroup *group=_contacts[section];
//    return group.detail;
//}

- (void)dealloc {
    [self release];
    [super dealloc];
}


@end

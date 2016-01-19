//
//  userAppTable.m
//  TimeProject
//
//  Created by nju on 16/1/18.
//  Copyright © 2016年 nju. All rights reserved.
//

#import "userAppTable.h"
#import "userAppInfo.h"

@implementation userAppTable


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}

- (void) initWithUserAppList: (NSMutableArray *)appList {
    self.userAppList = appList;
    self.dataSource = self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"计算分组数");
    return 1;
}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"计算每组(组%li)行数",(long)section);
    //    KCContactGroup *group1=_contacts[section];
    return 1;
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSIndexPath是一个结构体，记录了组和行信息
    NSLog(@"生成单元格(组：%li,行%li)",(long)indexPath.section,(long)indexPath.row);
    //    KCContactGroup *group=_contacts[indexPath.section];
    //    KCContact *contact=group.contacts[indexPath.row];
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text= [(userAppInfo *)[self.userAppList objectAtIndex:0] appName];
    //    cell.textLabel.text=[userAppInfo getName];
    //    cell.detailTextLabel.text=contact.phoneNumber;
    cell.detailTextLabel.text=[(userAppInfo *)[self.userAppList objectAtIndex:0] appUrl];
    return cell;
}

#pragma mark 返回每组头标题名称
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSLog(@"生成组（组%li）名称",(long)section);
    //    KCContactGroup *group=_contacts[section];
    return @"Default";
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

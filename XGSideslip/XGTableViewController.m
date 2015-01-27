//
//  XGTableViewController.m
//  sideslip
//
//  Created by 赵小嘎 on 15-1-15.
//  Copyright (c) 2015年 赵小嘎. All rights reserved.
//

#import "XGTableViewController.h"
#import "XGSideMenuViewController.h"

@interface XGTableViewController ()

@end

@implementation XGTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    [cell.textLabel setText:[NSString stringWithFormat:@"第%ld行",indexPath.row]];
    // Configure the cell...
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.sideMenuViewController closeMenuAnimated:YES completion:^{
        
        UITabBarController * tabbar = (UITabBarController*)self.sideMenuViewController.menu;
        UINavigationController * nav = (UINavigationController*)tabbar.selectedViewController;
        UIViewController * control = [[UIViewController alloc]init];
        //        control.
        control.view.backgroundColor = [UIColor redColor];
        [nav pushViewController:control animated:NO];
        
    }];
    
}

@end


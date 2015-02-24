//
//  RightMenuTableViewController.m
//  MASlideMenu
//
//  Created by Laure Linn on 2/22/15.
//  Copyright (c) 2015 LAL. All rights reserved.
//

#import "RightMenuTableViewController.h"

@interface RightMenuTableViewController ()

@end

@implementation RightMenuTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 && ![UIApplication sharedApplication].isStatusBarHidden)
    {
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    }
}

@end

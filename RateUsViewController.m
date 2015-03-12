//
//  RateUsViewController.m
//  MASlideMenu
//
//  Created by Laure Linn on 2/22/15.
//  Copyright (c) 2015 LAL. All rights reserved.
//

#import "RateUsViewController.h"

@interface RateUsViewController ()

@end

@implementation RateUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self disableSlidePanGestureForLeftMenu];
    [self disableSlidePanGestureForRightMenu];
    
    [self addLeftMenuButton];
    
    #define APP_URL_STRING  @"https://itunes.apple.com/us/app/calcfast/id876781417?mt=8"
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: APP_URL_STRING]];
}

@end

//
//  EducationViewController.m
//  MASlideMenu
//
//  Created by Laure Linn on 2/22/15.
//  Copyright (c) 2015 LAL. All rights reserved.
//

#import "EducationViewController.h"

@interface EducationViewController ()

@end

@implementation EducationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self disableSlidePanGestureForLeftMenu];
    [self disableSlidePanGestureForRightMenu];
    
    [self addLeftMenuButton];
}

@end

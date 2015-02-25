//
//  EducationViewController.h
//  MASlideMenu
//
//  Created by Laure Linn on 2/22/15.
//  Copyright (c) 2015 LAL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+AMSlideMenu.h"
#import "MGTileMenuController.h"

@interface EducationViewController : UIViewController <MGTileMenuDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) MGTileMenuController *tileController;

@end

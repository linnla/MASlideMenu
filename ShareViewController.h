//
//  ShareViewController.h
//  MASlideMenu
//
//  Created by Laure Linn on 2/22/15.
//  Copyright (c) 2015 LAL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+AMSlideMenu.h"
#import "MGTileMenuController.h"
#import <Social/Social.h>

@interface ShareViewController : UIViewController <MGTileMenuDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) MGTileMenuController *tileController;

@end

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

- (NSInteger)numberOfTilesInMenu:(MGTileMenuController *)tileMenu
{
	return 4;
}


- (UIImage *)imageForTile:(NSInteger)tileNumber inMenu:(MGTileMenuController *)tileMenu
{
	NSArray *images = [NSArray arrayWithObjects:
					   @"glyphicons-332-dashboard",
					   @"glyphicons-593-person",
					   @"glyphicons-341-globe",
					   @"glyphicons-23-fire",
                       nil];
    
	if (tileNumber >= 0 && tileNumber < images.count) {
		return [UIImage imageNamed:[images objectAtIndex:tileNumber]];
	}
	
	return [UIImage imageNamed:@"Text"];
}


- (NSString *)labelForTile:(NSInteger)tileNumber inMenu:(MGTileMenuController *)tileMenu
{
	NSArray *labels = [NSArray arrayWithObjects:
					   @"UV Index",
					   @"Skin Types",
					   @"Skin Types by Region",
					   @"Time to Burn",
					   nil];
    
	if (tileNumber >= 0 && tileNumber < labels.count) {
		return [labels objectAtIndex:tileNumber];
	}
	
	return @"Tile";
}


- (NSString *)descriptionForTile:(NSInteger)tileNumber inMenu:(MGTileMenuController *)tileMenu
{
	NSArray *hints = [NSArray arrayWithObjects:
					   @"Displays UV Index with explaination",
					   @"Displays Skin Type matrix and explainations",
					   @"Displays globe with skin type by region",
					   @"Displays time to burn statistics",
					   nil];
    
	if (tileNumber >= 0 && tileNumber < hints.count) {
		return [hints objectAtIndex:tileNumber];
	}
	
	return @"It's a tile button!";
}


- (UIImage *)backgroundImageForTile:(NSInteger)tileNumber inMenu:(MGTileMenuController *)tileMenu
{
	if (tileNumber == 1) {
		return [UIImage imageNamed:@"purple_gradient"];
	} else if (tileNumber == 2) {
		return [UIImage imageNamed:@"orange_gradient"];
	} else if (tileNumber == 3) {
		return [UIImage imageNamed:@"red_gradient"];
	} else if (tileNumber == 4) {
		return [UIImage imageNamed:@"yellow_gradient"];
	} else if (tileNumber == 5) {
		return [UIImage imageNamed:@"green_gradient"];
	} else if (tileNumber == -1) {
		return [UIImage imageNamed:@"grey_gradient"];
	}
	
	return [UIImage imageNamed:@"blue_gradient"];
}


- (BOOL)isTileEnabled:(NSInteger)tileNumber inMenu:(MGTileMenuController *)tileMenu
{
	//if (tileNumber == 2 || tileNumber == 6) {
	//	return NO;
	//}
	
	return YES;
}


- (void)tileMenu:(MGTileMenuController *)tileMenu didActivateTile:(NSInteger)tileNumber
{
	NSLog(@"Tile %d activated (%@)", tileNumber, [self labelForTile:tileNumber inMenu:_tileController]);
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *viewController;
    if (tileNumber == 0) viewController = [storyboard instantiateViewControllerWithIdentifier:@"UVIndex"];
    else if (tileNumber == 1) viewController = [storyboard instantiateViewControllerWithIdentifier:@"SkinType"];
    else if (tileNumber == 2) viewController = [storyboard instantiateViewControllerWithIdentifier:@"SkinTypeRegion"];
    else if (tileNumber == 3) viewController = [storyboard instantiateViewControllerWithIdentifier:@"TimeToBurn"];
    
    [self.navigationController pushViewController:viewController animated:YES];
}


- (void)tileMenuDidDismiss:(MGTileMenuController *)tileMenu
{
	_tileController = nil;
}


#pragma mark - Gesture handling


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
	// Ensure that only touches on our own view are sent to the gesture recognisers.
	if (touch.view == self.view) {
		return YES;
	}
	
	return NO;
}


- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer
{
	// Find out where the gesture took place.
	CGPoint loc = [gestureRecognizer locationInView:self.view];
	if ([gestureRecognizer isMemberOfClass:[UITapGestureRecognizer class]] && ((UITapGestureRecognizer *)gestureRecognizer).numberOfTapsRequired == 2) {
		// This was a double-tap.
		// If there isn't already a visible TileMenu, we should create one if necessary, and show it.
		if (!_tileController || _tileController.isVisible == NO) {
			if (!_tileController) {
				// Create a tileController.
				_tileController = [[MGTileMenuController alloc] initWithDelegate:self];
				_tileController.dismissAfterTileActivated = NO; // to make it easier to play with in the demo app.
			}
			// Display the TileMenu.
			[_tileController displayMenuCenteredOnPoint:loc inView:self.view];
		}
		
	} else {
		// This wasn't a double-tap, so we should hide the TileMenu if it exists and is visible.
		if (_tileController && _tileController.isVisible == YES) {
			// Only dismiss if the tap wasn't inside the tile menu itself.
			if (!CGRectContainsPoint(_tileController.view.frame, loc)) {
				[_tileController dismissMenu];
                
                // LAL
			}
		}
	}
}


#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self disableSlidePanGestureForLeftMenu];
    [self disableSlidePanGestureForRightMenu];
    
    [self addLeftMenuButton];
    
    if (!_tileController || _tileController.isVisible == NO) {
        if (!_tileController) {
            // Create a tileController.
            _tileController = [[MGTileMenuController alloc] initWithDelegate:self];
            _tileController.dismissAfterTileActivated = NO; // to make it easier to play with in the demo app.
        }
        // Display the TileMenu.
        
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        CGFloat screenHeight = screenRect.size.height;
        
        [_tileController displayMenuCenteredOnPoint:CGPointMake(screenWidth/2, screenHeight/2) inView:self.view];
    }
    
	/*
	// Set up recognizers.
	UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
	doubleTapRecognizer.numberOfTapsRequired = 2;
	doubleTapRecognizer.delegate = self;
	[self.view addGestureRecognizer:doubleTapRecognizer];
	
	UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
	tapRecognizer.delegate = self;
	[self.view addGestureRecognizer:tapRecognizer];
     */
    
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end

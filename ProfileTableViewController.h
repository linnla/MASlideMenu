//
//  ProfileTableViewController.h
//  MASlideMenu
//
//  Created by Laure Linn on 2/22/15.
//  Copyright (c) 2015 LAL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+AMSlideMenu.h"
#import "UIColor+MLPFlatColors.h"
#import <QuartzCore/QuartzCore.h>

@interface ProfileTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIButton *skinType1;
@property (weak, nonatomic) IBOutlet UIButton *skinType2;
@property (weak, nonatomic) IBOutlet UIButton *skinType3;
@property (weak, nonatomic) IBOutlet UIButton *skinType4;
@property (weak, nonatomic) IBOutlet UIButton *skinType5;
@property (weak, nonatomic) IBOutlet UIButton *skinType6;

@property (weak, nonatomic) IBOutlet UIButton *buttonFemale;
@property (weak, nonatomic) IBOutlet UIButton *buttonMale;

@property (weak, nonatomic) IBOutlet UIButton *squamousCell;
@property (weak, nonatomic) IBOutlet UIButton *basalCell;
@property (weak, nonatomic) IBOutlet UIButton *melanoma;

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (weak, nonatomic) IBOutlet UIButton *buttonSPF1;
@property (weak, nonatomic) IBOutlet UIButton *buttonSPF2;
@property (weak, nonatomic) IBOutlet UIButton *buttonSPF3;
@property (weak, nonatomic) IBOutlet UIButton *buttonSPF4;
@property (weak, nonatomic) IBOutlet UIButton *buttonSPF5;
@property (weak, nonatomic) IBOutlet UIButton *buttonSPF6;


- (IBAction)buttonAction:(id)sender;
- (IBAction)sliderAction:(UISlider *)sender;
- (IBAction)segmentedControlAction:(UISlider *)sender;


@end

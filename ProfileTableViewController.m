//
//  ProfileTableViewController.m
//  MASlideMenu
//
//  Created by Laure Linn on 2/22/15.
//  Copyright (c) 2015 LAL. All rights reserved.
//

#import "ProfileTableViewController.h"
#import "UIViewController+AMSlideMenu.h"

@interface ProfileTableViewController ()

@end

@implementation ProfileTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self disableSlidePanGestureForLeftMenu];
    [self disableSlidePanGestureForRightMenu];
    
    [self addLeftMenuButton];
    
    UIImage *image;
    UIImage *imageSelected;
    UIImage *imageDefault;
    UIColor *colorDefault = [UIColor flatGrayColor];
    UIColor *colorSelected = [UIColor flatWhiteColor];
    UIColor *colorButton = [UIColor flatBlueColor];
    
    image = [UIImage imageNamed:@"glyphicons-36-woman.png"];
    imageDefault = [self imageWithTint:colorDefault image:image];
    imageSelected = [self imageWithTint:colorSelected image:image];
    [_buttonFemale setImage:imageDefault forState:UIControlStateNormal];
    [_buttonFemale setImage:imageSelected forState:UIControlStateSelected];
    
    image = [UIImage imageNamed:@"glyphicons-4-user.png"];
    imageDefault = [self imageWithTint:colorDefault image:image];
    imageSelected = [self imageWithTint:colorSelected image:image];
    [_buttonMale setImage:imageDefault forState:UIControlStateNormal];
    [_buttonMale setImage:imageSelected forState:UIControlStateSelected];
   
    image = [UIImage imageNamed:@"glyphicons-154-unchecked.png"];
    imageDefault = [self imageWithTint:colorSelected image:image];
    [_squamousCell setImage:imageDefault forState:UIControlStateNormal];
    [_basalCell setImage:imageDefault forState:UIControlStateNormal];
    [_melanoma setImage:imageDefault forState:UIControlStateNormal];
    
    image = [UIImage imageNamed:@"glyphicons-153-check.png"];
    imageSelected = [self imageWithTint:colorSelected image:image];
    [_squamousCell setImage:imageSelected forState:UIControlStateSelected];
    [_basalCell setImage:imageSelected forState:UIControlStateSelected];
    [_melanoma setImage:imageSelected forState:UIControlStateSelected];
    
    _buttonFemale.backgroundColor = colorButton;
    _buttonMale.backgroundColor = colorButton;
    _squamousCell.backgroundColor = colorButton;
    _basalCell.backgroundColor = colorButton;
    _melanoma.backgroundColor = colorButton;
    
    [[UITableViewCell appearance] setBackgroundColor:[UIColor blackColor]];
    self.tableView.backgroundColor = [UIColor blackColor];
    
    // This controls the tableviewheaderview color
    //UIImageView *imageView = [[UIImageView alloc] init];
    //imageView.image = [self imageWithColor:[UIColor whiteColor]];
    
    //[[UITableView appearance] setBackgroundView:imageView];
    
    [[UILabel appearance] setFont:[UIFont fontWithName:@"HelveticaNeue" size:18.0]];
    //[[UILabel appearance] setTextColor:[UIColor blackColor]];
    //[[UILabel appearance] setBackgroundColor:[UIColor clearColor]];
    
    //[_sunScreenSlider setMinimumTrackTintColor:[UIColor blackColor]];
    //[_sunScreenSlider setMaximumTrackTintColor:[UIColor flatGrayColor]];
    
    //[[UISlider appearance] setThumbTintColor:[UIColor flatDarkBlueColor]];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self setScrolling];
}

- (void)setScrolling {
    
    [self.tableView reloadData];
    
    if (self.tableView.contentSize.height < self.tableView.frame.size.height) {
        self.tableView.scrollEnabled = NO;
    }
    else {
        self.tableView.scrollEnabled = YES;
    }
}

- (void)resetSPFButtons {
    
    _buttonSPF1.backgroundColor = [UIColor flatBlueColor];
    _buttonSPF2.backgroundColor = [UIColor flatBlueColor];
    _buttonSPF3.backgroundColor = [UIColor flatBlueColor];
    _buttonSPF4.backgroundColor = [UIColor flatBlueColor];
    _buttonSPF5.backgroundColor = [UIColor flatBlueColor];
    _buttonSPF6.backgroundColor = [UIColor flatBlueColor];

    _buttonSPF1.selected = NO;
    _buttonSPF2.selected = NO;
    _buttonSPF3.selected = NO;
    _buttonSPF4.selected = NO;
    _buttonSPF5.selected = NO;
    _buttonSPF6.selected = NO;
    
    _buttonSPF1.layer.borderWidth = 1;
    _buttonSPF2.layer.borderWidth = 1;
    _buttonSPF3.layer.borderWidth = 1;
    _buttonSPF4.layer.borderWidth = 1;
    _buttonSPF5.layer.borderWidth = 1;
    _buttonSPF6.layer.borderWidth = 1;
    
    _buttonSPF1.layer.borderColor = [UIColor flatBlueColor].CGColor;
    _buttonSPF2.layer.borderColor = [UIColor flatBlueColor].CGColor;
    _buttonSPF3.layer.borderColor = [UIColor flatBlueColor].CGColor;
    _buttonSPF4.layer.borderColor = [UIColor flatBlueColor].CGColor;
    _buttonSPF5.layer.borderColor = [UIColor flatBlueColor].CGColor;;
    _buttonSPF6.layer.borderColor = [UIColor flatBlueColor].CGColor;
}

- (void)resetSkinTypeButtons {
    
    _skinType1.selected = NO;
    _skinType2.selected = NO;
    _skinType3.selected = NO;
    _skinType4.selected = NO;
    _skinType5.selected = NO;
    _skinType6.selected = NO;
    
    _skinType1.layer.borderWidth = 1;
    _skinType2.layer.borderWidth = 1;
    _skinType3.layer.borderWidth = 1;
    _skinType4.layer.borderWidth = 1;
    _skinType5.layer.borderWidth = 1;
    _skinType6.layer.borderWidth = 1;
    
    _skinType1.layer.borderColor = [UIColor flatWhiteColor].CGColor;
    _skinType2.layer.borderColor = [UIColor flatWhiteColor].CGColor;
    _skinType3.layer.borderColor = [UIColor flatWhiteColor].CGColor;
    _skinType4.layer.borderColor = [UIColor flatWhiteColor].CGColor;
    _skinType5.layer.borderColor = [UIColor flatWhiteColor].CGColor;
    _skinType6.layer.borderColor = [UIColor flatWhiteColor].CGColor;
}

- (void)resetPeopleButtons {
    
    _buttonMale.selected = NO;
    _buttonFemale.selected = NO;
    
    _buttonMale.backgroundColor = [UIColor flatBlueColor];
    _buttonFemale.backgroundColor = [UIColor flatBlueColor];
    
    _buttonMale.layer.borderWidth = 1;
    _buttonFemale.layer.borderWidth = 1;
    
    _buttonMale.layer.borderColor = [UIColor flatBlueColor].CGColor;
    _buttonFemale.layer.borderColor = [UIColor flatBlueColor].CGColor;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    float width = self.tableView.frame.size.width;
    float height = [self tableView:self.tableView heightForHeaderInSection:section];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    headerView.backgroundColor = [UIColor blackColor];
    
    CGRect labelFrame;
    if (section == 2) labelFrame = CGRectMake(10, 0, self.tableView.frame.size.width, 40);
    else labelFrame = CGRectMake(10, 0, self.tableView.frame.size.width, 40);
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:labelFrame];
    textLabel.textAlignment = NSTextAlignmentLeft;
    
    textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:18.0];
    textLabel.textColor = [UIColor whiteColor];

    if (section == 0) textLabel.text = @"Skin Type";
    else if (section == 1)textLabel.text = @"Sunscreen SPF";
    else if (section == 2) textLabel.text = @"Cancer History";
    else return nil;
    
    [headerView addSubview:textLabel];
    
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (UIImage *)imageWithTint:(UIColor *)tintColor image:(UIImage *)image
{
    // Begin drawing
    CGRect aRect = CGRectMake(0.f, 0.f, image.size.width, image.size.height);
    CGImageRef alphaMask;
    
    //
    // Compute mask flipping image
    //
    {
        UIGraphicsBeginImageContext(aRect.size);
        CGContextRef c = UIGraphicsGetCurrentContext();
        
        // draw image
        CGContextTranslateCTM(c, 0, aRect.size.height);
        CGContextScaleCTM(c, 1.0, -1.0);
        [image drawInRect: aRect];
        
        alphaMask = CGBitmapContextCreateImage(c);
        
        UIGraphicsEndImageContext();
    }
    
    //
    UIGraphicsBeginImageContext(aRect.size);
    
    // Get the graphic context
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    // Draw the image
    [image drawInRect:aRect];
    
    // Mask
    CGContextClipToMask(c, aRect, alphaMask);
    
    // Set the fill color space
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextSetFillColorSpace(c, colorSpace);
    
    // Set the fill color
    CGContextSetFillColorWithColor(c, tintColor.CGColor);
    
    UIRectFillUsingBlendMode(aRect, kCGBlendModeNormal);
    
    UIImage *imageTinted = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Release memory
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(alphaMask);
    
    return imageTinted;
}

- (UIImage *)imageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

-(IBAction)sliderAction:(UISlider *)sender
{
    _sliderLabel.text = [NSString stringWithFormat:@"%i", (int) sender.value];
}

-(IBAction)segmentedControlAction:(UISegmentedControl *)sender {
    
    if (_segmentedControl.selectedSegmentIndex == 0) {
        
        [sender setTitle:@"AAAAA" forSegmentAtIndex:0];
    }
    
    if (_segmentedControl.selectedSegmentIndex == 1) {

        [sender setTitle:@"BBBBB" forSegmentAtIndex:1];
    }
}

- (IBAction)buttonAction:(id)sender {
    
    UIButton *button = (UIButton *)sender;
    if (button.tag == 11) {
        
        [self resetSkinTypeButtons];
        _skinType1.selected = YES;
        
    } else if (button.tag == 12) {
        
        [self resetSkinTypeButtons];
        _skinType2.selected = YES;
        
    } else if (button.tag == 13) {
        
        [self resetSkinTypeButtons];
        _skinType3.selected = YES;
        
    } else if (button.tag == 14) {
        
        [self resetSkinTypeButtons];
        _skinType4.selected = YES;
        
    } else if (button.tag == 15) {
        
        [self resetSkinTypeButtons];
        _skinType5.selected = YES;
        
    } else if (button.tag == 16) {
        
        [self resetSkinTypeButtons];
        _skinType6.selected = YES;
        
    } else if (button.tag == 21) {
        
        [self resetPeopleButtons];
        _buttonFemale.selected = YES;
        _buttonMale.selected = NO;
        
    } else if (button.tag == 22) {
        
        [self resetPeopleButtons];
        _buttonFemale.selected = NO;
        _buttonMale.selected = YES;
        
    } else if (button.tag == 51) {
        
        _squamousCell.selected = !_squamousCell.isSelected;
        if (!_squamousCell.selected) {
            _squamousCell.backgroundColor = [UIColor flatBlueColor];
            _squamousCell.layer.borderWidth = 1;
            _squamousCell.layer.borderColor = [UIColor flatBlueColor].CGColor;
        }
        
    } else if (button.tag == 61) {
        
        _basalCell.selected = !_basalCell.isSelected;
        if (!_basalCell.selected) {
            _basalCell.backgroundColor = [UIColor flatBlueColor];
            _basalCell.layer.borderWidth = 1;
            _basalCell.layer.borderColor = [UIColor flatBlueColor].CGColor;
        }
        
    } else if (button.tag == 71) {
        
        _melanoma.selected = !_melanoma.isSelected;
        if (!_melanoma.selected) {
            _melanoma.backgroundColor = [UIColor flatBlueColor];
            _melanoma.layer.borderWidth = 1;
            _melanoma.layer.borderColor = [UIColor flatBlueColor].CGColor;
        }
        
    } if (button.tag == 41) {
        
        [self resetSPFButtons];
        _buttonSPF1.selected = YES;
        //_buttonSPF1.backgroundColor = [UIColor flatBlackColor];
        
    } else if (button.tag == 42) {
        
        [self resetSPFButtons];
        _buttonSPF2.selected = YES;
    } else if (button.tag == 43) {
        [self resetSPFButtons];
        _buttonSPF3.selected = YES;
    } else if (button.tag == 44) {
        [self resetSPFButtons];
        _buttonSPF4.selected = YES;
    } else if (button.tag == 45) {
        [self resetSPFButtons];
        _buttonSPF5.selected = YES;
    } else if (button.tag == 46) {
        [self resetSPFButtons];
        _buttonSPF6.selected = YES;
    }
    
    if (button.selected) {
        button.layer.borderWidth = 3;
        button.layer.borderColor = [UIColor flatOrangeColor].CGColor;
        button.backgroundColor = [UIColor flatBlackColor];
    }
}

@end

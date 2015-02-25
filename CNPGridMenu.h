//
//  CNPGridMenu.h
//  CNPGridMenu
//
//  Created by Carson Perrotti on 2014-10-18.
//  Copyright (c) 2014 Carson Perrotti. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CNPBlurEffectStyle) {
    CNPBlurEffectStyleExtraLight,
    CNPBlurEffectStyleLight,
    CNPBlurEffectStyleDark
};

@class CNPGridMenuItem;
@protocol CNPGridMenuDelegate;

typedef void (^SelectionHandler)(CNPGridMenuItem *item);

@interface CNPGridMenu : UICollectionViewController

@property (nonatomic, assign) CNPBlurEffectStyle blurEffectStyle;

@property (nonatomic, weak) id <CNPGridMenuDelegate> delegate;
@property (nonatomic, readonly) NSArray *menuItems;

- (instancetype)initWithMenuItems:(NSArray *)items;

@end

@protocol CNPGridMenuDelegate <NSObject>

@optional
- (void)gridMenuDidTapOnBackground:(CNPGridMenu *)menu;
- (void)gridMenu:(CNPGridMenu *)menu didTapOnItem:(CNPGridMenuItem *)item;

@end

@interface CNPGridMenuItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, copy) SelectionHandler selectionHandler;

@end

@interface UIViewController (CNPGridMenu)

@property (nonatomic, strong) CNPGridMenu *gridMenu;
@property (nonatomic, strong) UINavigationController *navigationController;

- (void)presentGridMenu:(CNPGridMenu *)menu animated:(BOOL)flag completion:(void (^)(void))completion;
- (void)dismissGridMenuAnimated:(BOOL)flag completion:(void (^)(void))completion;

@end

/*
 
@property (nonatomic, strong) UIButton *circleButton;
 
- (void)setupCell {
    UIVisualEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:[UIBlurEffect effectWithStyle:self.blurEffectStyle]];
    self.vibrancyView = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect];
    [self.contentView addSubview:self.vibrancyView];
    
    self.circleButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.circleButton setBackgroundColor:[UIColor clearColor]];
    self.circleButton.layer.borderWidth = 1.0f;
    self.circleButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.circleButton addTarget:self action:@selector(buttonTouchDown:) forControlEvents:UIControlEventTouchDown];
    [self.circleButton addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self.circleButton addTarget:self action:@selector(buttonTouchUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
    [self.vibrancyView.contentView addSubview:self.circleButton];
    
    self.iconView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.iconView.tintColor = [UIColor whiteColor];
    [self.iconView setContentMode:UIViewContentModeScaleAspectFit];
    [self.vibrancyView.contentView addSubview:self.iconView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [self.titleLabel setTextColor:[UIColor whiteColor]];
    [self.titleLabel setNumberOfLines:2];
    [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.vibrancyView.contentView addSubview:self.titleLabel];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.vibrancyView.frame = self.contentView.bounds;
    [self.circleButton setFrame:CGRectMake(10, 0, self.contentView.bounds.size.width-20, self.contentView.bounds.size.width-20)];
    [self.circleButton.layer setCornerRadius:self.circleButton.bounds.size.width/2];
    [self.iconView setFrame:CGRectMake(0, 0, 40, 40)];
    self.iconView.center = self.circleButton.center;
    [self.titleLabel setFrame:CGRectMake(0, CGRectGetMaxY(self.circleButton.bounds), self.contentView.bounds.size.width, self.contentView.bounds.size.height - CGRectGetMaxY(self.circleButton.bounds))];
}
self.itemSize = CGSizeMake(100, 140);
self.minimumInteritemSpacing = 10;
self.minimumLineSpacing = 10;
self.scrollDirection = UICollectionViewScrollDirectionVertical;
self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
CNPGridMenuItem *laterToday = [[CNPGridMenuItem alloc] init];
laterToday.icon = [UIImage imageNamed:@"LaterToday"];
laterToday.title = @"Later Today";
CNPGridMenu *gridMenu = [[CNPGridMenu alloc] initWithMenuItems:@[laterToday, thisEvening, tomorrow, thisWeekend, nextWeek, inAMonth, someday, desktop, pickDate]];
gridMenu.delegate = self;
[self presentGridMenu:gridMenu animated:YES completion:^{
    NSLog(@"Grid Menu Presented");
}];
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CNPGridMenuCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GridMenuCell" forIndexPath:indexPath];
    CNPGridMenuItem *item = [self.menuItems objectAtIndex:indexPath.row];
    cell.delegate = self;
    cell.blurEffectStyle = self.blurEffectStyle;
    cell.menuItem = item;
    cell.iconView.image = [item.icon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    cell.titleLabel.text = item.title;
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    return cell;
}

*/
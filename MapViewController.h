//
//  MapViewController.h
//  MASlideMenu
//
//  Created by Laure Linn on 2/25/15.
//  Copyright (c) 2015 LAL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "LocationServices.h"
#import "AMSlideMenuMainViewController.h"
#import "UIViewController+AMSlideMenu.h"

@interface MapViewController : AMSlideMenuMainViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonItem;

@end

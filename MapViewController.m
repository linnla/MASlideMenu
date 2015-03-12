//
//  MapViewController.m
//  MASlideMenu
//
//  Created by Laure Linn on 2/25/15.
//  Copyright (c) 2015 LAL. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.rightMenu.view.hidden = YES;
    [self addLeftMenuButton];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self checkLocationManager];
    _mapView.showsUserLocation = YES;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 1000, 1000);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) checkLocationManager {
    
    if (![LocationServices sharedLocationInstance]) [LocationServices sharedLocationInstance];
    
    if ([LocationServices sharedLocationInstance].locationManager) {
        
        if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedAlways) {
            
            if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
                
                NSLog(@"Location Manager Authorization Status: AuthorizationStatusNotDetermined");
                
                if ([CLLocationManager locationServicesEnabled]) {
                    
                    if ([[LocationServices sharedLocationInstance].locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
                        [[LocationServices sharedLocationInstance].locationManager requestAlwaysAuthorization];
                    } else [[LocationServices sharedLocationInstance].locationManager startUpdatingLocation];
                    
                    NSLog(@"%@", @"Requesting Location Manager Authorization");
                    
                } else {
                    
                    NSLog(@"Location Services Aren't Enabled");
                }
                
            } else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse ||
                       [CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
                
                if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse) NSLog(@"Location Manager Authorization Status: AuthorizationStatusAuthorizedWhenInUse");
                else NSLog(@"Location Manager Authorization Status: AuthorizationStatusDenied");
                
                if ([CLLocationManager locationServicesEnabled]) {
                    
                    NSString *title;
                    title = ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) ? @"Location Services Disabled for UVX" : @"Background location is not enabled";
                    NSString *message = @"To use background location you must turn on 'Always' in the Location Services Settings";
                    
                    NSLog(@"Location Services Enabled");
                    NSLog(@"%@", @"Requesting Location Manager Authorization");
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                                            message:message
                                                                           delegate:self
                                                                  cancelButtonTitle:@"Cancel"
                                                                  otherButtonTitles:@"Settings", nil];
                        [alertView show];
                        
                    });
                    
                } else {
                    
                    NSLog(@"Location Services Disabled");
                    NSLog(@"%@", @"Requesting Location Services be Enabled ");
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Location Services are Disabled"
                                                                            message:@"To re-enable, please go to Settings, Privacy and turn on Location Services."
                                                                           delegate:nil
                                                                  cancelButtonTitle:@"OK"
                                                                  otherButtonTitles:nil];
                        [alertView show];
                        
                    });
                }
                
            } else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted) NSLog(@"Location Manager Authorization Status: AuthorizationStatusRestricted");
            
        } else NSLog(@"Location Manager Authorization Status: AuthorizationStatusAuthorizedAlways");
        
    } else NSLog(@"Location Manager Error, Location Services Shared Instance Does Not Exist");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  LocationServices.m
//
//  Created by Laure Linn on 8/21/14.
//  Copyright (c) 2013 Laure Linn. All rights reserved.
//

#import "LocationServices.h"

#define ZIPCODEFILE @"ZipCodes"
#define DEBUG 0

NSString* const kLocationServicesError = @"Location Services Error";
NSString* const kUnicodeForDegreeSign = @"%g\u00B0";

@implementation LocationServices

+ (LocationServices *)sharedLocationInstance {
    
    static LocationServices *sharedLocationInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        NSLog(@"Starting Location Services");
        
        sharedLocationInstance = [[LocationServices alloc] init];
        
    });
    
    return sharedLocationInstance;
}

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        _locationManager.distanceFilter = 10;
        
        NSLog(@"Creating Location Manager");
        
    } else NSLog(@"Error Creating Location Manager");
   
    return self;
}

+ (void)startLocationUpdates {
    
    if (DEBUG && DEBUG == 1) NSLog(@"%@", NSStringFromSelector(_cmd));
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways) {
        
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        
            if (![LocationServices sharedLocationInstance]) [LocationServices sharedLocationInstance];
    
            if ([LocationServices sharedLocationInstance]) {
                [[LocationServices sharedLocationInstance].locationManager startUpdatingLocation];
                NSLog(@"Starting Location Updates");
            } else {
                NSLog(@"Location Manager ERROR");
            }
        });
    }
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    if (DEBUG && DEBUG == 1) NSLog(@"%@", NSStringFromSelector(_cmd));
    
    NSInteger objCount = [locations count];
    if (objCount > 1) _oldLocation = [locations objectAtIndex:objCount - 1];
    _lastLocation = [locations lastObject];
    
    // See how recent the event is
    NSDate* eventDate = _lastLocation.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    NSUInteger maxAgeInSeconds = 60;
    BOOL recent;
    
    if (abs(howRecent) < maxAgeInSeconds) recent = YES;
    else recent = NO;
    
    // Horizontal Accuracy in meters
    NSUInteger horizontalAccuracyRequiredInMeters = 66;
    BOOL horzontallyAccurate;
    
    if(_lastLocation.horizontalAccuracy < horizontalAccuracyRequiredInMeters) horzontallyAccurate = YES;
    else horzontallyAccurate = NO;
    
    // Vertically Accuracy in meters
    NSUInteger verticalAccuracyRequiredInMeters = 35;
    BOOL verticallyAccurate;
    
    if(_lastLocation.verticalAccuracy < verticalAccuracyRequiredInMeters) verticallyAccurate = YES;
    else verticallyAccurate = NO;
    
    if (recent == YES && horzontallyAccurate == YES && verticallyAccurate == YES) {
        
        if ([LocationServices sharedLocationInstance]) {
            
            dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
                
                [[LocationServices sharedLocationInstance].locationManager stopUpdatingLocation];
                NSLog(@"Stopped Location Updates");
            });
            
            NSLog(@"%@", @"\n");
            NSLog(@"%@", @"Location Accepted");
            NSLog(@"%@", @"\n");
            
            NSLog(@"Horzontal Accuracy: PASS");
            NSLog(@"Horzontal Accuracy: %f", _lastLocation.horizontalAccuracy);
            NSLog(@"Horzontal Accuracy Required: %lu", (unsigned long)horizontalAccuracyRequiredInMeters);
            NSLog(@"%@", @"\n");
                
            NSLog(@"Vertical Accuracy: PASS");
            NSLog(@"Vertical Accuracy: %f", _lastLocation.verticalAccuracy);
            NSLog(@"Vertical Accuracy Required: %lu", (unsigned long)verticalAccuracyRequiredInMeters);
            NSLog(@"%@", @"\n");
                
            NSLog(@"Recency: PASS");
            NSLog(@"Last Location Age in Seconds: %d", abs(howRecent));
            NSLog(@"Maximum Age in Seconds: %lu", (unsigned long)maxAgeInSeconds);
            NSLog(@"%@", @"\n");
        }
       
    } else {
        
        NSLog(@"%@", @"\n");
        NSLog(@"%@", @"Location Discarded");
        NSLog(@"%@", @"\n");
        
        if (horzontallyAccurate == NO) {
            
            NSLog(@"Horzontal Accuracy: FAIL");
            NSLog(@"Horzontal Accuracy: %f", _lastLocation.horizontalAccuracy);
            NSLog(@"Horzontal Accuracy Required: %lu", (unsigned long)horizontalAccuracyRequiredInMeters);
            NSLog(@"%@", @"\n");
            
        }
        
        if (verticallyAccurate == NO) {
            
            NSLog(@"Vertical Accuracy: FAIL");
            NSLog(@"Vertical Accuracy: %f", _lastLocation.verticalAccuracy);
            NSLog(@"Vertical Accuracy Required: %lu", (unsigned long)verticalAccuracyRequiredInMeters);
            NSLog(@"%@", @"\n");
            
        }
        
        if (recent == NO) {
            
            NSLog(@"Recency: FAIL");
            NSLog(@"Last Location Age in Seconds: %d", abs(howRecent));
            NSLog(@"Maximum Age in Seconds: %lu", (unsigned long)maxAgeInSeconds);
            NSLog(@"%@", @"\n");
            
        }
    }
}

#pragma mark - CLLocationManager Error Handling

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    
    if ([LocationServices sharedLocationInstance]) [[LocationServices sharedLocationInstance].locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) NSLog(@"Changed Location Manager Authorization Status to: AuthorizationStatusNotDetermined");
    else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted) NSLog(@"Changed Location Manager Authorization Status to: AuthorizationStatusRestricted");
    else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) NSLog(@"Changed Location Manager Authorization Status to: AuthorizationStatusDenied");
    else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways) NSLog(@"Changed Location Manager Authorization Status to: AuthorizationStatusAuthorizedAlways");
    else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse) NSLog(@"Changed Location Manager Authorization Status to: AuthorizationStatusAuthorizedWhenInUse");
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways) {
        
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
            
            [LocationServices startLocationUpdates];
        });
    }
}

- (void)requestAlwaysAuthorization {
    
    /*
     
     http://asciiwwdc.com/2014/sessions/706
     
     Authorization is a single request that is prompted implicitly on first usage of location by your app.
     This is for all location functionality including location directly in the app, location from the background,
     location use via region monitoring, and significant location changes.
     The text is also customizable by the app.
     
     Your app can make calls to these requests APIs repeatedly; 
     However, it will only prompt to the user the first time and not per type.
     
     In the information property list editor in Xcode add a key for NSLocationAlways UsageDescription providing a description to the user.
     
     */
    
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    // If the status is denied or only granted for when in use, display an alert
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusDenied) {
        NSString *title;
        title = (status == kCLAuthorizationStatusDenied) ? @"Location Services Disabled" : @"Background location is not enabled";
        NSString *message = @"To use background location you must turn on 'Always' in the Location Services Settings";
        
    }
}

@end
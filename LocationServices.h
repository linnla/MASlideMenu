//
//  LocationServices.h
//
//  Created by Laure Linn on 8/21/14.
//  Copyright (c) 2014 Laure Linn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocationManagerDelegate.h>

@interface LocationServices : NSObject <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *oldLocation;
@property (nonatomic, strong) CLLocation *lastLocation;

+ (LocationServices *)sharedLocationInstance;
+ (void)startLocationUpdates;


@end

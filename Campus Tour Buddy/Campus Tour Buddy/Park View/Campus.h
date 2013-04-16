//
//  PVPark.h
//  Park View
//
//  Created by Joseph Bustamante on 4/14/13.
//  Copyright (c) 2013 Chris Wagner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Campus : NSObject

@property (nonatomic, readonly) CLLocationCoordinate2D midCoordinate;
@property (nonatomic, readonly) CLLocationCoordinate2D overlayTopLeftCoordinate;
@property (nonatomic, readonly) CLLocationCoordinate2D overlayTopRightCoordinate;
@property (nonatomic, readonly) CLLocationCoordinate2D overlayBottomLeftCoordinate;
@property (nonatomic, readonly) CLLocationCoordinate2D overlayBottomRightCoordinate;

@property (nonatomic, readonly) MKMapRect overlayBoundingMapRect;

@property (nonatomic, strong) NSString *name;

- (instancetype)initWithFilename:(NSString *)filename;

@end

//
//  PVParkMapOverlay.h
//  Park View
//
//  Created by Joseph Bustamante on 4/14/13.
//  Copyright (c) 2013 Chris Wagner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@class Campus;

@interface MapOverlay : NSObject <MKOverlay>

- (instancetype)initWithPark:(Campus *)park;

@end
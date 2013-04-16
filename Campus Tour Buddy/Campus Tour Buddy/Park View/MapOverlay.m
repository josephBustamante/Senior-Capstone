//
//  PVParkMapOverlay.m
//  Park View
//
//  Created by Joseph Bustamante on 4/14/13.
//  Copyright (c) 2013 Chris Wagner. All rights reserved.
//

#import "MapOverlay.h"
#import "Campus.h"

@implementation MapOverlay

@synthesize coordinate;
@synthesize boundingMapRect;

- (instancetype)initWithPark:(Campus *)park {
    self = [super init];
    if (self) {
        boundingMapRect = park.overlayBoundingMapRect;
        coordinate = park.midCoordinate;
    }
    
    return self;
}

@end
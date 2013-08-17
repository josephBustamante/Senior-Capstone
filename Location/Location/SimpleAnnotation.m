//
//  SimpleAnnotation.m
//  Location
//
//  Created by Joseph Bustamante on 5/8/13.
//  Copyright (c) 2013 Joseph Bustamante. All rights reserved.
//

#import "SimpleAnnotation.h"

@implementation SimpleAnnotation

@synthesize coordinate = _coordinate;
@synthesize title = _title;
@synthesize subTitle = _subTitle;

+(id)annotationWithCoordinate:(CLLocationCoordinate2D)coord
{
    return [[[self class]alloc]initWithCoordinate:coord];
}

-(id)initWithCoordinate:(CLLocationCoordinate2D)coord
{
    if (self = [super init])
    {
        self.coordinate = coord;
    }
    return self;
}

@end

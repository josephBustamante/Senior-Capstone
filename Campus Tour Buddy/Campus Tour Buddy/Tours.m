//
//  Tours.m
//  Campus Tour Buddy
//
//  Created by Joseph Bustamante on 3/25/13.
//  Copyright (c) 2013 Joseph Bustamante. All rights reserved.
//

#import "Tours.h"

@implementation Tours

@synthesize tDescription,tLocations,tName;

-(id)initWithFrame:(NSString *)aTName tLocations:(NSArray *)aTLocations tDescription:(NSString *)aTDescription
{
    self =[super init];
    if(self)
    {
        self.tName = aTName;
        self.tLocations = aTLocations;
        self.tDescription = aTDescription;
    }
    return self;
}

@end

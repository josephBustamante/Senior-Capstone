//
//  SimpleAnnotation.h
//  Location
//
//  Created by Joseph Bustamante on 5/8/13.
//  Copyright (c) 2013 Joseph Bustamante. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SimpleAnnotation : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subTitle;

+(id)annotationWithCoordinate:(CLLocationCoordinate2D)coord;
-(id)initWithCoordinate:(CLLocationCoordinate2D)coord;

@end

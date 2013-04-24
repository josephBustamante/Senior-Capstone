//
//  MapViewController.h
//  Tour Buddy
//
//  Created by Joseph Bustamante on 4/24/13.
//  Copyright (c) 2013 Joseph Bustamante. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;


@end

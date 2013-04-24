//
//  MapViewController.m
//  Tour Buddy
//
//  Created by Joseph Bustamante on 4/24/13.
//  Copyright (c) 2013 Joseph Bustamante. All rights reserved.
//

#import "MapViewController.h"
#import "Campus.h"

@interface MapViewController ()

@property (nonatomic, strong) Campus *campus;

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.campus = [[Campus alloc] initWithFilename:@"DrakeUniversity"];
    
    
    CLLocationDegrees latDelta = self.campus.overlayTopLeftCoordinate.latitude - self.campus.overlayBottomRightCoordinate.latitude;
    
    // think of a span as a tv size, measure from one corner to another
    MKCoordinateSpan span = MKCoordinateSpanMake(fabsf(latDelta), 0.0);
    
    MKCoordinateRegion region = MKCoordinateRegionMake(self.campus.midCoordinate, span);
    
    self.mapView.region = region;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

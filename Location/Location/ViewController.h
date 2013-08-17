//
//  ViewController.h
//  Location
//
//  Created by Joseph Bustamante on 4/24/13.
//  Copyright (c) 2013 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SimpleAnnotation.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDelegate, MKMapViewDelegate>

@property (strong,nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UITableViewCell *mapCell;

@end

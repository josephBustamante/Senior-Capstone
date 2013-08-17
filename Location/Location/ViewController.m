//
//  ViewController.m
//  Location
//
//  Created by Joseph Bustamante on 4/24/13.
//  Copyright (c) 2013 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize  tableView = _tableView;

- (void)viewDidLoad
{
    self.mapView.layer.cornerRadius = 10.0;
    self.mapView.showsUserLocation = YES;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CLLocationCoordinate2D howard = {41.60145, -93.65149};
    SimpleAnnotation *howardAnnotation = [[SimpleAnnotation alloc]initWithCoordinate:howard];
    howardAnnotation.title = @"Howard Hall";
    howardAnnotation.subTitle = @"41.60145, -93.65149";
    [self.mapView addAnnotation:howardAnnotation];
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tv
didSelectRowAtIndexPath:(NSIndexPath *)indexPath { // Add code here
}
#pragma mark UITableViewDataSource Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tv
{
    return 3;
}
- (NSInteger) tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger) section
{
    if (section ==0)
    {
        return 1;
    }
    else if(section == 1)
    {
        return 5;
    }
    else
    {
        return 1;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (indexPath.section ==0)
    {
        cell = self.mapCell;

    } else
    {
    static NSString *identifier = @"cell";
    cell =[tv dequeueReusableCellWithIdentifier:@"cell"];
    if ( cell == nil )
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    cell.textLabel.text = [delegate.rows objectAtIndex:indexPath.row];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger height;
    if (indexPath.section == 0)
    {
        height = 170;
    }
    else
    {
        height = 44;
    }
    return height;
}
-(void)viewDidAppear:(BOOL)animated
{
        
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(41.60145, -93.65149);
    CLLocationDistance radius = 100;
    MKCircle *circle = [MKCircle circleWithCenterCoordinate:center radius:radius];
    [circle setTitle:@"Howard Hall"];
    [self.mapView addOverlay:circle];
    [super viewDidAppear:animated];

}

-(MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay
{
    NSLog(@"Overlaying circle");
    MKCircle *circle = overlay;
    MKCircleView *circleView = [[MKCircleView alloc] initWithCircle:overlay];
    
    if ([circle.title isEqualToString:@"Howard Hall"])
    {
        circleView.fillColor = [UIColor redColor];
        circleView.alpha = 0.5;
    }
    return circleView;
}

@end

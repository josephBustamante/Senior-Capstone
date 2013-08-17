//
//  AppDelegate.m
//  Location
//
//  Created by Joseph Bustamante on 4/24/13.
//  Copyright (c) 2013 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize  viewController = _viewController;
@synthesize locationManager = _locationManager;
@synthesize rows = _rows;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //Creates the Region
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(41.60145, -93.65149);
    CLLocationDistance radius = 100; // 100m
    CLRegion *region = [[CLRegion alloc] initCircularRegionWithCenter:center radius:radius identifier:@"Howard Hall"];
    
    if ( [CLLocationManager locationServicesEnabled] )
    {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        if ( [CLLocationManager significantLocationChangeMonitoringAvailable] )
        {
            [self.locationManager startMonitoringSignificantLocationChanges];
        } else{
            NSLog(@"Significant location change service not available.");
        }
        if ([CLLocationManager regionMonitoringAvailable])
        {
            CLLocationAccuracy accuracy = 1.0;
            [self.locationManager startMonitoringForRegion:region desiredAccuracy:accuracy];
            NSLog(@"Enable Region monitoring");
        } else {
            NSLog(@"Warning: Region monitoring not supported with this device.");
        }
    } else{
        NSLog(@"Location services not enabled.");
    }
    
    self.rows = [[NSMutableArray alloc] initWithCapacity:5];
    [self.rows insertObject:@"Lat." atIndex:0];
    [self.rows insertObject:@"Long." atIndex:1];
    [self.rows insertObject:@"Alt." atIndex:2];
    [self.rows insertObject:@"Speed" atIndex:3];
    [self.rows insertObject:@"Course" atIndex:4];
    self.viewController =[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController; [self.window makeKeyAndVisible];
    
    UILocalNotification *localNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if (localNotification)
    {
        NSLog(@"Notification Body: %@", localNotification.alertBody);
    }
    application.applicationIconBadgeNumber = 0;
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    return YES;
}

-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = [NSDate date];
    notification.timeZone = [NSTimeZone defaultTimeZone];
    
    notification.alertBody = @"entered region";
    notification.soundName = UILocalNotificationDefaultSoundName;
    notification.applicationIconBadgeNumber = 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];    
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = [NSDate date];
    notification.timeZone = [NSTimeZone defaultTimeZone];
    
    notification.alertBody = @"Exited region";
    notification.soundName = UILocalNotificationDefaultSoundName;
    notification.applicationIconBadgeNumber = 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"Location: %@", [newLocation description]);
    
    NSString *latitude = [NSString stringWithFormat:@"Lat. %f degrees", newLocation.coordinate.latitude];
    NSString *longitude = [NSString stringWithFormat:@"Long. %f degrees", newLocation.coordinate.longitude];
    NSString *altitude = [NSString stringWithFormat:@"Alt. %f m", newLocation.altitude];
    NSString *speed = [NSString stringWithFormat:@"Speed %f m/s", newLocation.speed];
    NSString *course = [NSString stringWithFormat:@"Course %f degrees", newLocation.course];
    
    [self.rows insertObject:latitude atIndex:0];
    [self.rows insertObject:longitude atIndex:1];
    [self.rows insertObject:altitude atIndex:2];
    [self.rows insertObject:speed atIndex:3];
    [self.rows insertObject:course atIndex:4];
    [self.viewController.tableView reloadData];
    
    double miles = 200.0;
    double scalingFactor = ABS(cos(2 * M_PI * newLocation.coordinate.latitude / 360.0));
    MKCoordinateSpan span;
    span.latitudeDelta = miles/69.0;
    span.longitudeDelta = miles/(scalingFactor*69.0);
    MKCoordinateRegion region;
    region.span = span;
    region.center = newLocation.coordinate;
    
    [self.viewController.mapView setRegion:region animated:YES];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Error: %@",[error description]);
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    application.applicationIconBadgeNumber = 0;
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

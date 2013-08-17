//
//  AppDelegate.h
//  Location
//
//  Created by Joseph Bustamante on 4/24/13.
//  Copyright (c) 2013 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
//Added CLLocationManagerDelegate
@interface AppDelegate : UIResponder <UIApplicationDelegate,CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
//This declares an instace of a CLLocationManager
@property (strong, nonatomic) CLLocationManager *locationManager;

@property (strong,nonatomic)NSMutableArray *rows;

@end

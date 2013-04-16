#import "MapViewController.h"
#import "Tours.h"
#import "Campus.h"
#import "MapOverlay.h"
#import "MapOverlayView.h"

@interface MapViewController ()

@property (nonatomic, strong) NSMutableArray *selectedOptions;
@property (nonatomic, strong) Campus *park;

@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.selectedOptions = [NSMutableArray array];
    self.park = [[Campus alloc] initWithFilename:@"DrakeUniversity"];
    
    
    CLLocationDegrees latDelta = self.park.overlayTopLeftCoordinate.latitude - self.park.overlayBottomRightCoordinate.latitude;
    
    // think of a span as a tv size, measure from one corner to another
    MKCoordinateSpan span = MKCoordinateSpanMake(fabsf(latDelta), 0.0);
    
    MKCoordinateRegion region = MKCoordinateRegionMake(self.park.midCoordinate, span);
    
    self.mapView.region = region;
    [self addOverlay];
    
}
- (void)loadSelectedOptions {
    // To be implemented ...
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    Tours *optionsViewController = segue.destinationViewController;
    optionsViewController.selectedOptions = self.selectedOptions;
}

- (IBAction)closeOptions:(UIStoryboardSegue *)exitSegue {
    Tours *optionsViewController = exitSegue.sourceViewController;
    self.selectedOptions = optionsViewController.selectedOptions;
    [self loadSelectedOptions];
}

- (IBAction)mapTypeChanged:(id)sender {
    // To be implemented ...
}

- (void)addOverlay {
    MapOverlay *overlay = [[MapOverlay alloc] initWithPark:self.park];
    [self.mapView addOverlay:overlay];
}

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay {
    if ([overlay isKindOfClass:MapOverlay.class]) {
        UIImage *magicMountainImage = [UIImage imageNamed:@"CampusOverlay"];
        MapOverlayView *overlayView = [[MapOverlayView alloc] initWithOverlay:overlay overlayImage:magicMountainImage];
        
        return overlayView;
    }
    
    return nil;
}

@end

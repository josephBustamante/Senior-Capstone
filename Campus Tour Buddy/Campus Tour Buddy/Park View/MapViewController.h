#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *mapTypeSegmentedControl;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)mapTypeChanged:(id)sender;

@end

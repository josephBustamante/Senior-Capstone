
#import <MapKit/MapKit.h>

@interface MapOverlayView : MKOverlayView

- (instancetype)initWithOverlay:(id<MKOverlay>)overlay overlayImage:(UIImage *)overlayImage;

@end
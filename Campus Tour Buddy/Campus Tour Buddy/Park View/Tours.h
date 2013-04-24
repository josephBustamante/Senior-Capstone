#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PVMapOption ) {
    Athletic = 0,
    Scholastic,
    General,
    Dorm,
    ComputerSci
};

@interface Tours : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *selectedOptions;

@end

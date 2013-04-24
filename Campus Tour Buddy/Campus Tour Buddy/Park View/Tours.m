#import "Tours.h"

@implementation Tours

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
//This is where the options page is made. Can change this. 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OptionCell"];
    switch (indexPath.row) {
        case Athletic:
            cell.textLabel.text = @"Athletic Tour";
            break;
        case Scholastic:
            cell.textLabel.text = @"Scholastic Tour";
            break;
        case General:
            cell.textLabel.text = @"General Tour";
            break;
        case Dorm:
            cell.textLabel.text = @"Dorm Tour";
            break;
        case ComputerSci:
            cell.textLabel.text = @"Computer Science Tour";
            break;
        default:
            break;
    }
    
    if ([self.selectedOptions containsObject:[NSNumber numberWithInt:indexPath.row]]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [self.selectedOptions removeObject:[NSNumber numberWithInt:indexPath.row]];
    } else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.selectedOptions addObject:[NSNumber numberWithInt:indexPath.row]];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end

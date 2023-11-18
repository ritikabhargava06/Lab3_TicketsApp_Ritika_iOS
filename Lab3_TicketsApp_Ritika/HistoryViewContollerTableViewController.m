//
//  HistoryViewContollerTableViewController.m
//  Lab3_TicketsApp_Ritika
//
//  Created by user246866 on 9/29/23.
//

#import "HistoryViewContollerTableViewController.h"
#import "DetailViewController.h"

@interface HistoryViewContollerTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic) NSInteger userRow;
@end

@implementation HistoryViewContollerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) viewDidAppear:(BOOL)animated{
    [self.myTableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.userRow = indexPath.row;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.hvcTicketStore getPurchaseHistoryListCount];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"historyCell" forIndexPath:indexPath];
    cell.textLabel.text = [self.hvcTicketStore getHistoryTicketType:indexPath.row];
    NSString* ticketQntity = [NSString stringWithFormat:@"%d", [self.hvcTicketStore getHistoryTicketQuantity:indexPath.row]];
    cell.detailTextLabel.text = ticketQntity;
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailViewController *dvc = segue.destinationViewController;
   // dvc.dvcUserRow = self.userRow;
    dvc.dvcUserRow = [self.tableView indexPathForSelectedRow].row;
    dvc.dvcTicketStore = self.hvcTicketStore;
}
    


@end

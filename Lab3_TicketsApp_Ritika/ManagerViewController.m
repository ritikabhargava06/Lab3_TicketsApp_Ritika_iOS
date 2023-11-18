//
//  ManagerViewController.m
//  Lab3_TicketsApp_Ritika
//
//  Created by user246866 on 9/28/23.
//

#import "ManagerViewController.h"
#import "ResetViewController.h"
#import "HistoryViewContollerTableViewController.h"

@interface ManagerViewController ()

@end

@implementation ManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"Reset"]){
        ResetViewController *rvc = (ResetViewController*)segue.destinationViewController;
        rvc.rvcTicketStore = self.mvcTicketStore;
    }else if([segue.identifier isEqualToString:@"History"]){
        HistoryViewContollerTableViewController *hvc = (HistoryViewContollerTableViewController*)segue.destinationViewController;
        hvc.hvcTicketStore = self.mvcTicketStore;
    }
    
}


@end

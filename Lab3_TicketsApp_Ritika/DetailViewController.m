//
//  DetailViewController.m
//  Lab3_TicketsApp_Ritika
//
//  Created by user246866 on 9/29/23.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *itemLabel;
@property (weak, nonatomic) IBOutlet UILabel *quantityLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.itemLabel.text = [self.dvcTicketStore getHistoryTicketType:self.dvcUserRow];
    self.quantityLabel.text = [NSString stringWithFormat:@"%d", [self.dvcTicketStore getHistoryTicketQuantity:self.dvcUserRow]];
    self.priceLabel.text = [NSString stringWithFormat:@"%.2f", [self.dvcTicketStore getHistoryTicketPrice:self.dvcUserRow]];
    NSString* date = [NSDateFormatter localizedStringFromDate:[self.dvcTicketStore getHistoryTicketDate:self.dvcUserRow] dateStyle:NSDateFormatterFullStyle timeStyle:NSDateFormatterMediumStyle];
    
    self.dateLabel.text = date;
    
   //[self reloadInputViews];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

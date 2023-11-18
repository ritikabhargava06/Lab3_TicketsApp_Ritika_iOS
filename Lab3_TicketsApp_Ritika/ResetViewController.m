//
//  ResetViewController.m
//  Lab3_TicketsApp_Ritika
//
//  Created by user246866 on 9/29/23.
//

#import "ResetViewController.h"

@interface ResetViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *resetTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *resetPickerView;
@property int userRowIndex;
@end

@implementation ResetViewController

- (IBAction)exitButtonPressed:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
     
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)cancelButtonPressed {
    self.resetTextField.text = @"";
}

- (IBAction)okButtonPressed {
    if(![self.resetTextField.text isEqualToString:@""]){
        int qnt = [self.resetTextField.text intValue];
       // [self.rvcTicketStore restockTickets:self.userRowIndex withQuantity:qnt andWithTicket:self.rvcTicketStore];
        [self.rvcTicketStore restockTickets:self.userRowIndex withQuantity:qnt];
        [self.resetPickerView reloadAllComponents];
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.rvcTicketStore getTicketListCount];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.rvcTicketStore ticketToString:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.userRowIndex = (int)row;
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

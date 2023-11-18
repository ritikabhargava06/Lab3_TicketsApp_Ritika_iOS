//
//  ViewController.m
//  Lab3_TicketsApp_Ritika
//
//  Created by user246866 on 9/28/23.
//

#import "ViewController.h"
#import "TicketsStore.h"
#import "ManagerViewController.h"

@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *ticketTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *quantityLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (nonatomic) TicketsStore* myTicketStore;
@property bool isNewQnty;
@property int userQnty;
@property (weak, nonatomic) IBOutlet UIPickerView *myPickerView;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;
@property int userTicketIndex;
@end

@implementation ViewController

-(TicketsStore*) myTicketStore{
    if(_myTicketStore ==nil){
        _myTicketStore = [[TicketsStore alloc]init];
    }
    return _myTicketStore;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isNewQnty= YES;
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    [self.myPickerView reloadAllComponents];
}

- (IBAction)digitBtnPressed:(UIButton *)sender {
    //self.quantityLabel.text=@"";
    //self.priceLabel.text=@"";
    if(self.isNewQnty){
        self.quantityLabel.text = sender.titleLabel.text;
        self.isNewQnty = NO;
    }else{
        self.quantityLabel.text= [NSString stringWithFormat:@"%@%@",self.quantityLabel.text,sender.titleLabel.text];
    }
    
}

- (IBAction)buyBtnPressed {
    double totalPrice=[self.myTicketStore purchaseTicketswith:self.userTicketIndex andQuantity:[self.quantityLabel.text intValue]];
    if(!isnan(totalPrice)){
        self.priceLabel.text = [NSString stringWithFormat:@"%.2f",totalPrice];
        [self.myPickerView reloadAllComponents];
    }else{
        self.errorLabel.text = @"Item out of stock!";
    }
    self.isNewQnty = YES;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.myTicketStore getTicketListCount];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.myTicketStore ticketToString:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.quantityLabel.text=@"";
    self.priceLabel.text=@"";
    self.errorLabel.text=@"";
    self.ticketTypeLabel.text = [self.myTicketStore getTicketType:row];
    self.userTicketIndex = (int)row;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ManagerViewController *mvc = segue.destinationViewController;
    mvc.mvcTicketStore = self.myTicketStore;
}



@end

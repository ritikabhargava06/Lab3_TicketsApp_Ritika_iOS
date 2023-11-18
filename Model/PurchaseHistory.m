//
//  PurchaseHistory.m
//  Lab3_TicketsApp_Ritika
//
//  Created by user246866 on 9/28/23.
//

#import "PurchaseHistory.h"

@implementation PurchaseHistory
- (instancetype)initWithticketType:(NSString*) ticketType andWithQuantity:(int) qnty andWithPrice:(double) totalPrice andDate:(NSDate*) date
{
    self = [super init];
    if (self) {
        self = [super initWithTitle:ticketType withPrice:totalPrice withqnty:qnty];
        self.purchaseDate = date;
    }
    return self;
}
@end

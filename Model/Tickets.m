//
//  Tickets.m
//  Lab3_TicketsApp_Ritika
//
//  Created by user246866 on 9/28/23.
//

#import "Tickets.h"

@implementation Tickets

-(instancetype) initWithTitle:(NSString*)ticketType withPrice:(double) price withqnty:(int) qnty{
    self = [super init];
    if (self) {
        self.ticketType = ticketType;
        self.priceValue = price;
        self.quantity = qnty;
    }
    return self;
}

@end

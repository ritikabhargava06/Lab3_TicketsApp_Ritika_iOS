//
//  TicketsStore.m
//  Lab3_TicketsApp_Ritika
//
//  Created by user246866 on 9/28/23.
//

#import "TicketsStore.h"
#import "Tickets.h"
#import "PurchaseHistory.h"

@interface TicketsStore()
@property (nonatomic) NSMutableArray *ticketsList;
@property (nonatomic) NSMutableArray *purchaseHistoryList;
@end

@implementation TicketsStore
-(NSMutableArray *) ticketsList{
    if(_ticketsList==nil){
        Tickets* ticket1 = [[Tickets alloc]initWithTitle:@"Balcony Level" withPrice:150.0 withqnty:20];
        Tickets* ticket2 = [[Tickets alloc]initWithTitle:@"Lower Level" withPrice:100.0 withqnty:15];
        Tickets* ticket3 = [[Tickets alloc]initWithTitle:@"Courtside" withPrice:50.0 withqnty:10];
        
        _ticketsList = [[NSMutableArray alloc]initWithObjects:ticket1,ticket2,ticket3,nil];
    }
    return _ticketsList;
}

-(NSInteger) getTicketListCount{
    return self.ticketsList.count;
}

-(NSInteger) getPurchaseHistoryListCount{
    return self.purchaseHistoryList.count;
}

-(NSMutableArray*) purchaseHistoryList{
    if(_purchaseHistoryList==nil){
        _purchaseHistoryList = [[NSMutableArray alloc]init];
    }
    return _purchaseHistoryList;
}

-(NSString*) getTicketType:(NSInteger)index{
    Tickets* t = [self.ticketsList objectAtIndex:index];
    return t.ticketType;
}

-(NSString*) ticketToString:(NSInteger)index{
    Tickets* t = [self.ticketsList objectAtIndex:index];
    return [NSString stringWithFormat:@"%@ Quantity: %d Price: %.2f", t.ticketType,t.quantity,t.priceValue];

}

-(double) purchaseTicketswith:(int)index andQuantity:(int) qnt{
    Tickets* t = [self.ticketsList objectAtIndex:index];
    if(qnt>t.quantity){
        return NAN;;
    }else{
        t.quantity = t.quantity-qnt;
        double totalPrice = t.priceValue*qnt;
        PurchaseHistory* historyItem = [[PurchaseHistory alloc]initWithticketType:t.ticketType andWithQuantity:qnt andWithPrice:totalPrice andDate:[NSDate date]];
        [self.purchaseHistoryList addObject:historyItem];
        return totalPrice;
    }
}

-(void) restockTickets:(int)index withQuantity:(int) qnt{
    Tickets* t = [self.ticketsList objectAtIndex:index];
    t.quantity = t.quantity+qnt;
}

-(NSString*) getHistoryTicketType:(NSInteger)index{
    PurchaseHistory* ph = [self.purchaseHistoryList objectAtIndex:index];
    return ph.ticketType;
}

-(int) getHistoryTicketQuantity:(NSInteger)index{
    PurchaseHistory* ph = [self.purchaseHistoryList objectAtIndex:index];
    return ph.quantity;
}

-(double) getHistoryTicketPrice:(NSInteger)index{
    PurchaseHistory* ph = [self.purchaseHistoryList objectAtIndex:index];
    return ph.priceValue;
}
-(NSDate*) getHistoryTicketDate:(NSInteger)index{
    PurchaseHistory* ph = [self.purchaseHistoryList objectAtIndex:index];
    return ph.purchaseDate;
}

@end

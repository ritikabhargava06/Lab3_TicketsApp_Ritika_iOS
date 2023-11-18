//
//  TicketsStore.h
//  Lab3_TicketsApp_Ritika
//
//  Created by user246866 on 9/28/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TicketsStore : NSObject

-(NSString*) ticketToString:(NSInteger)index;
-(NSString *) getTicketType:(NSInteger)index;
-(double) purchaseTicketswith:(int)index andQuantity:(int) qnt;
-(void) restockTickets:(int)index withQuantity:(int) qnt;
-(NSInteger) getTicketListCount;
-(NSInteger) getPurchaseHistoryListCount;
-(NSString*) getHistoryTicketType:(NSInteger)index;
-(int) getHistoryTicketQuantity:(NSInteger)index;
-(double) getHistoryTicketPrice:(NSInteger)index;
-(NSDate*) getHistoryTicketDate:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END

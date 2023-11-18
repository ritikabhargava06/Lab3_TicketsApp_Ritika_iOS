//
//  PurchaseHistory.h
//  Lab3_TicketsApp_Ritika
//
//  Created by user246866 on 9/28/23.
//

#import "Tickets.h"

NS_ASSUME_NONNULL_BEGIN

@interface PurchaseHistory : Tickets
@property (nonatomic) NSDate* purchaseDate;
-(instancetype)initWithticketType:(NSString*) ticketType andWithQuantity:(int) qnty andWithPrice:(double) totalPrice andDate:(NSDate*) date;
@end

NS_ASSUME_NONNULL_END

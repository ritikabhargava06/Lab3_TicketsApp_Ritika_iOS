//
//  Tickets.h
//  Lab3_TicketsApp_Ritika
//
//  Created by user246866 on 9/28/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tickets : NSObject
@property (nonatomic) NSString *ticketType;
@property int quantity;
@property double priceValue;
-(instancetype) initWithTitle:(NSString*)ticketType withPrice:(double) price withqnty:(int) qnty;
@end

NS_ASSUME_NONNULL_END

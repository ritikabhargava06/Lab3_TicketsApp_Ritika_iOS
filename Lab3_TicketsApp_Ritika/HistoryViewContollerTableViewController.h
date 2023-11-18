//
//  HistoryViewContollerTableViewController.h
//  Lab3_TicketsApp_Ritika
//
//  Created by user246866 on 9/29/23.
//

#import <UIKit/UIKit.h>
#import "TicketsStore.h"

NS_ASSUME_NONNULL_BEGIN

@interface HistoryViewContollerTableViewController : UITableViewController
@property (nonatomic) TicketsStore* hvcTicketStore;
@end

NS_ASSUME_NONNULL_END

//
//  ManagerViewController.h
//  Lab3_TicketsApp_Ritika
//
//  Created by user246866 on 9/28/23.
//

#import <UIKit/UIKit.h>
#import "TicketsStore.h"

NS_ASSUME_NONNULL_BEGIN

@interface ManagerViewController : UIViewController
@property (nonatomic) TicketsStore* mvcTicketStore;
@end

NS_ASSUME_NONNULL_END

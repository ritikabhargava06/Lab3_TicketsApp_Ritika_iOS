//
//  DetailViewController.h
//  Lab3_TicketsApp_Ritika
//
//  Created by user246866 on 9/29/23.
//

#import <UIKit/UIKit.h>
#import "TicketsStore.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController
@property NSInteger dvcUserRow;
@property (nonatomic) TicketsStore* dvcTicketStore;
@end

NS_ASSUME_NONNULL_END

//
//  DetailsViewController.h
//  Hadia_todoApp
//
//  Created by Hadia Yehia on 30/04/2023.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "EditViewController.h"
#import "EditDelegationProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController<EditDelegationProtocol>
@property id<EditDelegationProtocol>  mainVC;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *priorityImg;
- (IBAction)editBtn:(UIButton *)sender;

@property Task *myTask;

@end

NS_ASSUME_NONNULL_END

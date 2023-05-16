//
//  EditViewController.h
//  Hadia_todoApp
//
//  Created by Hadia Yehia on 30/04/2023.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "EditDelegationProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface EditViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
@property NSArray *priority;
@property NSArray *status;
@property id<EditDelegationProtocol> detailsVC;
@property (weak, nonatomic) IBOutlet UILabel *taskNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *descTxtField;
@property Task* editTask;
- (IBAction)saveEditBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@end

NS_ASSUME_NONNULL_END

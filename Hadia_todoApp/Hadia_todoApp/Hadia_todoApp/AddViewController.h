//
//  AddViewController.h
//  Hadia_todoApp
//
//  Created by Hadia Yehia on 30/04/2023.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "ViewController.h"
#import "AddDelegationProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
@property NSArray *priority;
@property NSArray *status;
@property Task *taskToBeAdded;
@property id<AddDelegationProtocol> mainVC;
@property (weak, nonatomic) IBOutlet UITextField *nameTxtField;
@property (weak, nonatomic) IBOutlet UITextField *descTxtField;
- (IBAction)saveBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;


@end

NS_ASSUME_NONNULL_END

//
//  AddViewController.m
//  Hadia_todoApp
//
//  Created by Hadia Yehia on 30/04/2023.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _priority=@[@"high",@"medium",@"low"];
    _status=@[@"to do",@"in progress",@"done"];
    _taskToBeAdded=[Task new];
    self.pickerView.delegate=self;
    self.pickerView.dataSource=self;

    
    
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component==0){
        return _priority.count;
    }else{
            return _status.count;
    }
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component==0){
        return _priority[row];
    }
        else{
            return _status[row];
        }
    
    
   
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(component==0){
        _taskToBeAdded.priority=_priority[row];
        switch(row){
            case 0:
                _taskToBeAdded.imgPath=@"high_prior";
                break;
            case 1:
                _taskToBeAdded.imgPath=@"med";
                break;
            case 2:
                _taskToBeAdded.imgPath=@"low_priority";
                break;
        }
    }else{
            _taskToBeAdded.state=_status[row];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveBtn:(UIButton *)sender {
    
    _taskToBeAdded.name=self.nameTxtField.text;
    _taskToBeAdded.desc=self.descTxtField.text;
    _taskToBeAdded.date= [NSDate date];
    if(_taskToBeAdded.priority==NULL){
        _taskToBeAdded.priority=@"high";
        _taskToBeAdded.imgPath=@"high_prior";

    }
    if(_taskToBeAdded.state==NULL){
        _taskToBeAdded.state=@"to do";
    }
   
    [_mainVC addTask:_taskToBeAdded];
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end

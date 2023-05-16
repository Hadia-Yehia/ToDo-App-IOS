//
//  EditViewController.m
//  Hadia_todoApp
//
//  Created by Hadia Yehia on 30/04/2023.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.nameLabel.text=_editTask.name;
    self.descTxtField.text=_editTask.desc;
    self.taskNameLabel.text=_editTask.name;
    _priority=@[@"high",@"medium",@"low"];
    _status=@[@"to do",@"in progress",@"done"];
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
        _editTask.priority=_priority[row];
        switch(row){
            case 0:
                _editTask.imgPath=@"high_prior";
                break;
            case 1:
                _editTask.imgPath=@"med";
                break;
            case 2:
                _editTask.imgPath=@"low_priority";
                break;
        }
    }else{
            _editTask.state=_status[row];
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

- (IBAction)saveEditBtn:(UIButton *)sender {
    _editTask.desc=self.descTxtField.text;
    if(_editTask.priority==NULL){
        _editTask.priority=@"high";
        _editTask.imgPath=@"high_prior";

    }
    if(_editTask.state==NULL){
        _editTask.state=@"to do";
    }
   
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"confirmition" message:@"Do you finish editing" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionOk=[UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        NSLog(@"ok action");
        [self.detailsVC editTask:self.editTask];
        [self.navigationController popViewControllerAnimated:YES];
    }];
    UIAlertAction *actionCancel=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action){
        NSLog(@"cancel action");
    }];
    [alert addAction:actionOk];
    [alert addAction:actionCancel];
    [self presentViewController:alert animated:YES completion:nil];
                              
}
@end

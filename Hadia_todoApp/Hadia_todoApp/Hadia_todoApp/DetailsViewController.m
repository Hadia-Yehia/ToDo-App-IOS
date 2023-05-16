//
//  DetailsViewController.m
//  Hadia_todoApp
//
//  Created by Hadia Yehia on 30/04/2023.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm"];

    self.nameLabel.text=_myTask.name;
    self.descLabel.text=_myTask.desc;
    self.statusLabel.text=_myTask.state;
    self.priorityLabel.text=_myTask.priority;
    self.dateLabel.text=[dateFormat stringFromDate:_myTask.date];
    self.priorityImg.image=[UIImage imageNamed:_myTask.imgPath];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)editBtn:(UIButton *)sender {
    EditViewController *editVC=[self.storyboard instantiateViewControllerWithIdentifier:@"edit"];
    editVC.editTask=_myTask;
    NSLog(@"ahoh=%@",_myTask.desc);
    editVC.detailsVC=self;
    [self.navigationController pushViewController:editVC animated:YES];
}
- (void)editTask:(Task *)task{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm"];
    self.nameLabel.text=task.name;
    self.descLabel.text=task.desc;
    self.statusLabel.text=task.state;
    self.priorityLabel.text=task.priority;
    self.dateLabel.text=[dateFormat stringFromDate:task.date];
    self.priorityImg.image=[UIImage imageNamed:task.imgPath];
    [_mainVC editTask:task];
}
@end

//
//  ViewController.h
//  Hadia_todoApp
//
//  Created by Hadia Yehia on 30/04/2023.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "DetailsViewController.h"
#import "AddViewController.h"
#import "AddDelegationProtocol.h"
#import "EditDelegationProtocol.h"

@interface ViewController : UIViewController<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource,AddDelegationProtocol,EditDelegationProtocol>
- (IBAction)segAct:(UISegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segout;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property NSMutableArray<Task*> *tasks;
@property NSMutableArray<Task*> *filteredTasks;
@property NSMutableArray<Task*> *todoTasks;
@property NSMutableArray<Task*> *doneTasks;
@property NSMutableArray<Task*> *inProgressTasks;
@property NSMutableArray<Task*> *highPriorityTasks;
@property NSMutableArray<Task*> *medPriorityTasks;
@property NSMutableArray<Task*> *lowPriorityTasks;

@property NSMutableArray<Task*> *updatedHighPriorityTasks;
@property NSMutableArray<Task*> *updatedMedPriorityTasks;
@property NSMutableArray<Task*> *updatedLowPriorityTasks;



@property NSMutableArray<Task*> *currentTasks;
@property NSString *name;
@property BOOL isFiltered;
@property (weak, nonatomic) IBOutlet UITableView *myTable;


@end


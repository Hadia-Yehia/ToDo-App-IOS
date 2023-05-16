//
//  ViewController.m
//  Hadia_todoApp
//
//  Created by Hadia Yehia on 30/04/2023.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    _tasks=[NSMutableArray new];
    _todoTasks=[NSMutableArray new];
    _doneTasks=[NSMutableArray new];
    _highPriorityTasks=[NSMutableArray new];
    _medPriorityTasks=[NSMutableArray new];
    _lowPriorityTasks=[NSMutableArray new];
    _inProgressTasks=[NSMutableArray new];
    _currentTasks=[NSMutableArray new];
    _filteredTasks=[NSMutableArray new];
    
    
           _currentTasks=_tasks;
    self.searchBar.delegate=self;
    _myTable.reloadData;
    _myTable.delegate=self;
    _myTable.dataSource=self;
    
    _updatedLowPriorityTasks=[NSMutableArray new];
    _updatedMedPriorityTasks=[NSMutableArray new];
    _updatedHighPriorityTasks=[NSMutableArray new];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"New Task" style:UIBarButtonItemStyleDone target:self action:@selector(add)];
}
-(void) add{
    AddViewController *addVC=[self.storyboard instantiateViewControllerWithIdentifier:@"add"];
    addVC.mainVC=self;
    [self.navigationController pushViewController:addVC animated:YES];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    switch(_segout.selectedSegmentIndex){
        case 4:
            return 3;
            break;
        default:
            return 1;
            break;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch(_segout.selectedSegmentIndex){
        case 4:
            switch(section){
                case 0:
                    return _highPriorityTasks.count;
                    break;
                case 1:
                    return _medPriorityTasks.count;
                    break;
                case 2:
                    return _lowPriorityTasks.count;
                    break;
                default:
                    break;
            }
            break;
        default:
            return _filteredTasks.count;
            break;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static  NSString *strCell = @"cell";
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
   if(cell==nil)
   {
     cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
   }
    switch(_segout.selectedSegmentIndex){
        case 4:
            switch(indexPath.section){
                case 0:
                    if(_updatedHighPriorityTasks.count==0){
                        _updatedHighPriorityTasks=_highPriorityTasks;
                    }
        cell.textLabel.text = _updatedHighPriorityTasks[indexPath.row].name;
        cell.imageView.image =[UIImage imageNamed:_highPriorityTasks[indexPath.row].imgPath];
                    break;
                case 1:
                    if(_updatedMedPriorityTasks.count==0){
                        _updatedMedPriorityTasks=_medPriorityTasks;
                    }
        cell.textLabel.text = _updatedMedPriorityTasks[indexPath.row].name;
        cell.imageView.image =[UIImage imageNamed:_medPriorityTasks[indexPath.row].imgPath];
                    break;
                case 2:
                    if(_updatedLowPriorityTasks.count==0){
                        _updatedLowPriorityTasks=_lowPriorityTasks;
                    }
        cell.textLabel.text = _updatedLowPriorityTasks[indexPath.row].name;
        cell.imageView.image =[UIImage imageNamed:_lowPriorityTasks[indexPath.row].imgPath];
                    break;
            }
            break;
        default:
            
            cell.textLabel.text = _filteredTasks[indexPath.row].name;
        cell.imageView.image =[UIImage imageNamed:_filteredTasks[indexPath.row].imgPath];
            break;
    }
    

   return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch(_segout.selectedSegmentIndex){
        case 4:
            switch(section){
                case 0:
                    return @"High priority";
                    break;
                case 1:
                    return @"Medium priority";
                    break;
                case 2:
                    return @"Low priority";
                    break;
                default:
                    return @"";
            }
        default:
            return @"";
    }
  
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    DetailsViewController *detailsVC=[self.storyboard instantiateViewControllerWithIdentifier:@"details"];
    detailsVC.myTask=[_filteredTasks objectAtIndex:indexPath.row];

[self.navigationController pushViewController:detailsVC animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
   
    _updatedLowPriorityTasks.removeAllObjects;
    _updatedMedPriorityTasks.removeAllObjects;
    _updatedHighPriorityTasks.removeAllObjects;
   if([searchText length]>0){
       NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[cd] %@", searchText];
           _filteredTasks = [_currentTasks filteredArrayUsingPredicate:resultPredicate];
          }
   else if (searchText.length==0){
       _filteredTasks=_currentTasks;
   }
    for(int i=0;i<_filteredTasks.count;i++){
        if([_filteredTasks[i].priority isEqual:@"high"]){
            [_updatedHighPriorityTasks addObject:_filteredTasks[i]];
        }else if ([_filteredTasks[i].priority isEqual:@"medium"]){
            [_updatedMedPriorityTasks addObject:_filteredTasks[i]];
        }else{
            [_updatedLowPriorityTasks addObject:_filteredTasks[i]];
        }
    }
           [_myTable reloadData];
}


- (IBAction)segAct:(UISegmentedControl *)sender {
    switch(_segout.selectedSegmentIndex){
        case 0:
            _currentTasks=_tasks;
            break;
        case 1:
            _currentTasks=_todoTasks;
            break;
        case 2:
            _currentTasks=_inProgressTasks;
            break;
        case 3:
            _currentTasks=_doneTasks;
            break;
        case 4:
            _currentTasks=_tasks;
        default:
            break;
    }
   _filteredTasks=_currentTasks;
    [_myTable reloadData];
}
- (void)addTask:(Task *) task{
    [_tasks addObject:task];
    if([task.state isEqual:@"to do"]){
        [_todoTasks addObject:task];
    }else if ([task.state isEqual:@"in progress"]){
        [_inProgressTasks addObject:task];
    }
    else{
        [_doneTasks addObject:task];
    }
    
    if([task.priority isEqual:@"high"]){
        [_highPriorityTasks addObject:task];
    }else if ([task.priority isEqual:@"medium"]){
        [_medPriorityTasks addObject:task];
    }else{
        [_lowPriorityTasks addObject:task];
    }
    _filteredTasks=_currentTasks;
    [_myTable reloadData];
}
- (void)editTask:(Task *)task{
    for(int i=0;i<_tasks.count;i++){
        if(_tasks[i].name==task.name){
            [_tasks replaceObjectAtIndex:i withObject:task];
        }
        
    }
    [_myTable reloadData];
}


@end

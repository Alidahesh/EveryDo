//
//  MasterViewController.m
//  EveryDo1
//
//  Created by Ali Dahesh on 2016-11-15.
//  Copyright © 2016 Ali Dahesh. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController



//objects[0] = ToDo.title

//objects = [@"@Name is Ali", @"My Laptop is MAC"];

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.objects = [[NSMutableArray alloc] init];
  
    ToDo *todo = [ToDo new];
    todo.title = @"Buy Milk";
    todo.toDoDescription = @"Today";
    todo.priorityNum = 1;
    todo.isCompleted = NO;
    [self.objects addObject:todo];

    ToDo *todo1 = [ToDo new];
    todo1.title = @"Get Papers";
    todo1.toDoDescription = @"tomorrow";
    todo1.priorityNum = 1;
    todo1.isCompleted = YES;
    [self.objects addObject:todo1];
    
//    self.objects = [[NSMutableArray alloc] init];
//
//    [_objects addObject:todo];
//    ToDo *str = _objects[0];
//    NSLog(@"%@",str.title);
    
    
    //ToDo.title = @"@Ali";
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(newCellNotification:)
     name:@"Notification"
     object:nil];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

-(void)newCellNotification:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    ToDo *todo3 = [ToDo new];
    todo3.title = userInfo[@"titleTextFieldText"];
    todo3.toDoDescription = userInfo[@"descriptionTextFieldText"];
    NSString *a = userInfo[@"prTExtFieldText"];
    todo3.priorityNum = [a integerValue];
    [self.objects addObject:todo3];
    [self.tableView reloadData];
    
}
//
//NSString *a = @"123abc";
//NSInteger b = [a integerValue];
- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    
    
    UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"DestinationController"];
    [self.navigationController pushViewController:controller animated:YES];
    
//    [self.objects insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    ToDo *cellObject = _objects[indexPath.row];
    cell.textLabel.text = cellObject.title;

    
//    ToDo *cellObject1 = _objects[1];
//    cell.textLabel.text = cellObject1.title ;
//  
    //NSDate *object = self.objects[indexPath.row];
    //cell.textLabel.text = [object description];
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


@end

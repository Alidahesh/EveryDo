//
//  MasterViewController.h
//  EveryDo1
//
//  Created by Ali Dahesh on 2016-11-15.
//  Copyright © 2016 Ali Dahesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoCell.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;


@end


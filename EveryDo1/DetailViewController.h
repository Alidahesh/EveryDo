//
//  DetailViewController.h
//  EveryDo1
//
//  Created by Ali Dahesh on 2016-11-15.
//  Copyright © 2016 Ali Dahesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDate *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end


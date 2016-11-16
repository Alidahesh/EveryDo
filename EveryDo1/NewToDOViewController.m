//
//  NewToDOViewController.m
//  EveryDo1
//
//  Created by Ali Dahesh on 2016-11-15.
//  Copyright © 2016 Ali Dahesh. All rights reserved.
//

#import "NewToDOViewController.h"

@interface NewToDOViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *prTextField;

@end

@implementation NewToDOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
}

- (IBAction)saveButtonTapped:(id)sender {
    
    NSString *enteredText1 = [self.titleTextField text];
    
    NSString *enteredText2 = [self.descriptionTextField text];
    
    NSString *enteredText3 = [self.prTextField text];
    
//    NSLog(@"%@ %@ %@", enteredText1, enteredText2, enteredText3);

  
    NSString *notificationName = @"Notification";
    
    NSDictionary *dic = @{ @"titleTextFieldText" : enteredText1,
                           @"descriptionTextFieldText" : enteredText2,
                           @"prTExtFieldText" : enteredText3};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notificationName
                                                        object:nil
                                                      userInfo:dic];
    
    
//    
//    [[NSNotificationCenter defaultCenter]
//     addObserver:self
//     selector:@selector(Notification:)
//     name:notificationName
//     object:nil];
//    
    
}

/*
 
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

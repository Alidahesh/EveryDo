//
//  ToDo.h
//  EveryDo1
//
//  Created by Ali Dahesh on 2016-11-15.
//  Copyright © 2016 Ali Dahesh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *toDoDescription;
@property (nonatomic) int priorityNum;
@property (nonatomic) BOOL isCompleted;



@end

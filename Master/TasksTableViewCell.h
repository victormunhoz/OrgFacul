//
//  TasksTableViewCell.h
//  Master
//
//  Created by Victor Munhoz Theodoro on 05/08/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"

@interface TasksTableViewCell : SWTableViewCell

@property NSManagedObject *tarefa;
+ (NSArray *)rightButtons;
+ (NSArray *)rightButtons2;

@end

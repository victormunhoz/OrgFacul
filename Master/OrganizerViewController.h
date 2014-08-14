//
//  OrganizerViewController.h
//  OrgFacul_Org01
//
//  Created by GABRIEL FARIA DE CARVALHO TAVARES on 04/08/14.
//  Copyright (c) 2014 GABRIEL FARIA DE CARVALHO TAVARES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "MenuFilterViewController.h"
#import "ECSlidingViewController.h"
#import "GerenciadorBD.h"
#import "TasksTableViewCell.h"
#import "TaskListColor.h"

@interface OrganizerViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, MenuFilterViewControllerDelegate, SWTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSMutableArray *taskList;
@property NSString *taskCategory;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@end

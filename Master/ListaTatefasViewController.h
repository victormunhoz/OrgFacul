//
//  ListaTatefasViewController.h
//  Master
//
//  Created by ICARO NASCIMENTO FERREIRA on 04/08/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ECSlidingViewController.h"
#import "MenuFilterViewController.h"
#import "GerenciadorBD.h"

@interface ListaTatefasViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, MenuFilterViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSMutableArray* exibitionTasks;

- (IBAction)Filtro:(id)sender;

- (IBAction)allTasks:(id)sender;

@end

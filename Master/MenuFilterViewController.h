//
//  MenuFilterViewController.h
//  OrgFacul_Org01
//
//  Created by GABRIEL FARIA DE CARVALHO TAVARES on 05/08/14.
//  Copyright (c) 2014 GABRIEL FARIA DE CARVALHO TAVARES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"

@protocol MenuFilterViewControllerDelegate;

@interface MenuFilterViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) id <MenuFilterViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *categoryList;

@end

@protocol MenuFilterViewControllerDelegate
-(void)menuFilterViewControllerDidFinishWithCategoryId:(NSString*)categoryId;
@end
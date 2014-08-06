//
//  ListaTatefasViewController.m
//  Master
//
//  Created by ICARO NASCIMENTO FERREIRA on 04/08/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import "ListaTatefasViewController.h"

@interface ListaTatefasViewController ()

@end

@implementation ListaTatefasViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //self.taskList = [GerenciadorBD getTarefas];
    //self.taskCategory = @"all";
    
    _exibitionTasks = [[NSMutableArray alloc]initWithArray:[GerenciadorBD getTarefas]];
    NSLog(@"%i",[_exibitionTasks count]);
    
    [self.tableView reloadData];
    
    // Add a shadow to the top view so it looks like it is on top of the others
    self.view.layer.shadowOpacity = 0.80f;
    self.view.layer.shadowRadius = 5.0f;
    self.view.layer.shadowColor = [[UIColor blackColor] CGColor];
    
    // Tell it which view should be created under left
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuFilterViewController class]]) {
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuFilter"];
        
        [(MenuFilterViewController *)self.slidingViewController.underLeftViewController setCategoryList:[[NSMutableArray alloc] initWithObjects:@"estudo",@"trabalho",nil]];
        [(MenuFilterViewController *)self.slidingViewController.underLeftViewController setDelegate:self];
    }
    
    // Add the pan gesture to allow sliding
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_exibitionTasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    //cell.textLabel.text = _txtTest[indexPath.row];
    
    [cell.textLabel setText:[[_exibitionTasks objectAtIndex:indexPath.row]valueForKey:@"titulo"]];
    
    return cell;
}

- (void)menuFilterViewControllerDidFinishWithCategoryId:(NSString*)categoryId
{
    [_exibitionTasks removeAllObjects];
    _exibitionTasks = [GerenciadorBD getTarefasType:categoryId];
    [self.tableView reloadData];
    
    //codico para resetar
    [self.slidingViewController resetTopView];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

- (IBAction)Filtro:(id)sender {
    [_exibitionTasks removeAllObjects];
    _exibitionTasks = [GerenciadorBD getTarefasType:@"estudo"];
    [self.tableView reloadData];
}

- (IBAction)allTasks:(id)sender {
    [_exibitionTasks removeAllObjects];
    _exibitionTasks = [GerenciadorBD getTarefas];
    [self.tableView reloadData];
}
@end

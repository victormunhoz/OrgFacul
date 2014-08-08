//
//  OrganizerViewController.m
//  OrgFacul_Org01
//
//  Created by GABRIEL FARIA DE CARVALHO TAVARES on 04/08/14.
//  Copyright (c) 2014 GABRIEL FARIA DE CARVALHO TAVARES. All rights reserved.
//

#import "OrganizerViewController.h"

@interface OrganizerViewController ()

@end

@implementation OrganizerViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
}


-(void)viewDidAppear:(BOOL)animated{
    // reseta a view de listas para o topo
    [self.slidingViewController resetTopView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.taskList = [GerenciadorBD getTarefas];
    //INCOMPLETO
    self.taskCategory = @"all";
    
    [self.tableView reloadData];
    
    // Tell it which view should be created under left
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuFilterViewController class]]) {
        //seta a view do menuFilter para ser instanciada na esquerda
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuFilter"];
        
        //INCOMPLETO
        //passa a lista de categorias
        [(MenuFilterViewController *)self.slidingViewController.underLeftViewController setCategoryList:[[NSMutableArray alloc] initWithObjects:@"estudo",@"trabalho",nil]];
        //seta essa view como delegate para a passegem de categoria selecionada na viewFilter
        [(MenuFilterViewController *)self.slidingViewController.underLeftViewController setDelegate:self];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.taskList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TasksTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.rightUtilityButtons = [TasksTableViewCell rightButtons];
    
    [cell.textLabel setText:[[self.taskList objectAtIndex:indexPath.row]valueForKey:@"titulo"]];
    cell.delegate = self;
    
    return cell;
}

//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        // Delete the row from the data source
//        
//        [GerenciadorBD deletaTarefa:[self.taskList objectAtIndex:indexPath.row]];
//        [self.taskList removeObjectAtIndex:indexPath.row];
//        
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }
//}

- (void)menuFilterViewControllerDidFinishWithCategoryId:(NSString*)categoryId
{
    //faz uma busca com a categoria selecionada
    self.taskList = [GerenciadorBD getTarefasType:categoryId];
    [self.tableView reloadData];
    
    // resetar a possicao dessa view para o topo
    [self.slidingViewController resetTopView];
}

//botao que aciona a lista de categorias
- (IBAction)showFilter:(id)sender {
    [self.slidingViewController anchorTopViewTo:ECRight];
}


- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    
    NSIndexPath *cellIndexPath = [self.tableView indexPathForCell:cell];
    
    switch (index) {
        case 0:
            [self.taskList removeObjectAtIndex:index];
            [[self tableView]deleteRowsAtIndexPaths:@[cellIndexPath] withRowAnimation:UITableViewRowAnimationFade];

            NSLog(@"More button was pressed");
            break;
        case 1:
        {
            NSLog(@"teste botao menu");
            break;
        }
        case 2:
        {
            [GerenciadorBD deletaTarefa:[self.taskList objectAtIndex:cellIndexPath.row]];
            
            [self.taskList removeObjectAtIndex:cellIndexPath.row];
            [[self tableView]deleteRowsAtIndexPaths:@[cellIndexPath] withRowAnimation:UITableViewRowAnimationRight];

            NSLog(@"teste botao menu 2");
            break;
        }
        default:
            break;
    }
}

- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell{
    return YES;
}

@end

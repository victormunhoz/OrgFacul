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
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //[[self view]setBackgroundColor:[UIColor colorWithRed:99 green:99 blue:99 alpha:1.0]];
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
    
    self.taskList = [GerenciadorBD getTarefasIncompletas];
    [self.titleLabel setText:@"Todas"];
    
    [GerenciadorBD getTypes];
    
    self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuFilter"];
    
    //passa a lista de categorias
    NSMutableArray *categorias = [[NSMutableArray alloc] initWithObjects:@"Todas",@"Completas",@"Prova",@"Trabalho",@"Estudo", nil];
    [categorias addObjectsFromArray:[[GerenciadorBD getTypes] valueForKey:@"nome"]];
    [(MenuFilterViewController *)self.slidingViewController.underLeftViewController setCategoryList:categorias];
    
    //seta essa view como delegate para a passegem de categoria selecionada na viewFilter
    [(MenuFilterViewController *)self.slidingViewController.underLeftViewController setDelegate:self];
    
    [self.tableView reloadData];
    
    
    /* CODIGO DO VITOR ALTERADO
    // Tell it which view should be created under left
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuFilterViewController class]]) {
        //seta a view do menuFilter para ser instanciada na esquerda
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuFilter"];
        
        //passa a lista de categorias
        NSMutableArray *categorias = [[NSMutableArray alloc] initWithObjects:@"Todas",@"Prova",@"Trabalho",@"Estudo", nil];
        [categorias addObjectsFromArray:[[GerenciadorBD getTypes] valueForKey:@"nome"]];
        [(MenuFilterViewController *)self.slidingViewController.underLeftViewController setCategoryList:categorias];
        //seta essa view como delegate para a passegem de categoria selecionada na viewFilter
        [(MenuFilterViewController *)self.slidingViewController.underLeftViewController setDelegate:self];
        NSLog(@"appear");
    }
     */
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
    
    int completada = [[[self.taskList objectAtIndex:indexPath.row] valueForKey:@"completada"] integerValue];
    
    if(completada == 1){
        cell.rightUtilityButtons = [TasksTableViewCell rightButtons2];
    
        [cell.textLabel setText:[[self.taskList objectAtIndex:indexPath.row]valueForKey:@"titulo"]];
        cell.delegate = self;
    }
    else{
        cell.rightUtilityButtons = [TasksTableViewCell rightButtons];
        
        [cell.textLabel setText:[[self.taskList objectAtIndex:indexPath.row]valueForKey:@"titulo"]];
        cell.delegate = self;
    }
    
    cell.backgroundColor = [TaskListColor RGBbyNumber:indexPath.row AndTotal:_taskList.count];
    
    return cell;
}

- (void)menuFilterViewControllerDidFinishWithCategoryId:(NSString*)categoryId
{
    [[self titleLabel]setText:categoryId];
    
    if([categoryId isEqualToString:@"Todas"]){
        self.taskList = [GerenciadorBD getTarefasIncompletas];
        [self.tableView reloadData];
        NSLog(@"todas");
    }
    else if([categoryId isEqualToString:@"Completas"]){
        self.taskList = [GerenciadorBD getTarefasCompletas];
        [self.tableView reloadData];
    }
    else{
        //faz uma busca com a categoria selecionada
        self.taskList = [GerenciadorBD getTarefasType:categoryId];
        [self.tableView reloadData];
        
    }
    
    
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
            [GerenciadorBD completaTarefa:[self.taskList objectAtIndex:cellIndexPath.row]];
            [self.tableView reloadData];

            NSLog(@"comp button was pressed");
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

//
//  MenuFilterViewController.m
//  OrgFacul_Org01
//
//  Created by GABRIEL FARIA DE CARVALHO TAVARES on 05/08/14.
//  Copyright (c) 2014 GABRIEL FARIA DE CARVALHO TAVARES. All rights reserved.
//

#import "MenuFilterViewController.h"

@interface MenuFilterViewController ()

@end

@implementation MenuFilterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //seta o tamanho da distancia  da sobreposicao entre as duas views
    [self.slidingViewController setAnchorRightRevealAmount:170.0f];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.categoryList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [cell.textLabel setText:[self.categoryList objectAtIndex:indexPath.row]];
    
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //seleciona o texto da categoria e inicia o delegate
    NSString *str = [self.categoryList objectAtIndex:indexPath.row];
    [self.delegate menuFilterViewControllerDidFinishWithCategoryId:str];
}

@end

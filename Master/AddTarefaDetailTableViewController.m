//
//  AddTarefaDetailTableViewController.m
//  master
//
//  Created by Icaro Nascimento Ferreira on 07/08/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import "AddTarefaDetailTableViewController.h"

@interface AddTarefaDetailTableViewController ()

@end

@implementation AddTarefaDetailTableViewController
@synthesize categoria;

//Cancelar e voltar
- (IBAction)cancelBTtap:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneBTtap:(id)sender {
    if ((self.tituloInput.text.length != 0) && !([self.tituloInput.text isEqual:@" "]) && (self.tituloInput.text.length<20)){
        Tarefa* newTarefa =[[Tarefa alloc] init];
        [newTarefa setTipo:self.categoria];
        [newTarefa setTitulo:self.tituloInput.text];
        [newTarefa setDescricao:self.descricaoInput.text];
        [newTarefa setDataCriacao:[[NSDate alloc] initWithTimeIntervalSinceNow:0]];
        NSNumber *notifyIndex = [NSNumber numberWithInteger:self.notifySegment.selectedSegmentIndex];
        [newTarefa setNotificacao:notifyIndex];
        
        if(self.dateSwitch.on){
            [newTarefa setDataFinal:self.datePicker.date];
        }
        
        [GerenciadorBD criaTarefa:newTarefa];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.datePicker.minimumDate = [[ NSDate alloc ] initWithTimeIntervalSinceNow: (NSTimeInterval) 5 ];
    NSLog(@"%@",categoria);

}



- (IBAction)dateSwitchTap:(id)sender {
    if(self.dateSwitch.on){
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd/MM/yyyy"];
        NSString *stringFromDate = [formatter stringFromDate:[self.datePicker date]];
        NSLog(@"%@",stringFromDate);
        [self.indicadorData setText:stringFromDate];
    }
    if(!self.dateSwitch.on){
        [self.indicadorData setText:@"Adicionar Data"];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //Caso selecionar a celula de DATA, expandir
    if(indexPath.section == 1){
        if(!self.cellDateExpand){
            self.cellDateExpand = true;
            [self.datePicker setHidden:NO];
            //[self.indicadorData setHidden:YES];
            [self.tableView reloadData];
        }
        //COLAPSE
        else{
            self.cellDateExpand = false;
            [self.datePicker setHidden:YES];
            [self.indicadorData setHidden:NO];
            [self.tableView reloadData];
        }
    }
    //Caso selecioar a celula de DESCRICAO, expandir
    if(indexPath.section == 2){
        if(!self.cellDescriExpand){
            self.cellDescriExpand = true;
            [self.descricaoInput setHidden:NO];
            [self.indicadorDescri setHidden:YES];
            [self.tableView reloadData];
        }
        // COLLAPSE
        else{
            self.cellDescriExpand = false;
            [self.descricaoInput setHidden:YES];
            [self.indicadorDescri setHidden:NO];
            [self.tableView reloadData];
        }
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height =0.0f;
    
    //Aumenta a altura da Celula de DATA
    if((indexPath.section==1) && self.cellDateExpand){
        [self.dateSwitch setHidden:NO];
        height=230.0f;
    }
    //Aumenta a altura da Celula de DESCRICAO
    else if((indexPath.section==2) && self.cellDescriExpand){
        height=230.0f;
        [self.descricaoInput becomeFirstResponder];
    }
    //Altura Padrao
    else{
        height=44.0f;
    }
    return height;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidDisappear:(BOOL)animated{
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

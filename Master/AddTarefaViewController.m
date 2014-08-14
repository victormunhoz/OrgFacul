//
//  TarefaViewController.m
//  Master
//
//  Created by Icaro Nascimento Ferreira on 06/08/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import "AddTarefaViewController.h"

@interface AddTarefaViewController ()

@property NSMutableArray *frames;
@property NSMutableArray* buttonArray;
@end

@implementation AddTarefaViewController

//metodo que cria os locais onde os botes podem ficar
-(void)criaFrames{
    
    self.frames = [[NSMutableArray alloc] init];
    
    CGRect frame1 = CGRectMake(20, 240, 80, 80);
    CGRect frame2 = CGRectMake(120, 240, 80, 80);
    CGRect frame3 = CGRectMake(220, 240, 80, 80);
    
    [self.frames addObject:[NSValue valueWithCGRect:frame1]];
    [self.frames addObject:[NSValue valueWithCGRect:frame2]];
    [self.frames addObject:[NSValue valueWithCGRect:frame3]];
    
    CGRect frame4 = CGRectMake(20, 340, 80, 80);
    CGRect frame5 = CGRectMake(120, 340, 80, 80);
    CGRect frame6 = CGRectMake(220, 340, 80, 80);
    
    [self.frames addObject:[NSValue valueWithCGRect:frame4]];
    [self.frames addObject:[NSValue valueWithCGRect:frame5]];
    [self.frames addObject:[NSValue valueWithCGRect:frame6]];
    
}

//Metodo que adiciona os botoes com as opcoes de tipos personalizados
-(void)adicionaCustom{
    
    int i = 0;
    for(; i< self.customTipos.count; i++){
        CategoriasBT *customBT = [[CategoriasBT alloc] init];
        //configura o botao
        
        [customBT setBackgroundColor:[UIColor lightGrayColor]];
        [customBT setFrame:[[self.frames objectAtIndex:i] CGRectValue]];
        [customBT setTitle:[[self.customTipos objectAtIndex:i] valueForKey:@"nome"] forState:UIControlStateNormal];
        UIImage *snapIcon = [UIImage imageWithData:[[self.customTipos objectAtIndex:i]valueForKey:@"snapIcon"]];
        [customBT setImage:snapIcon forState:UIControlStateNormal];
        [customBT setTitleColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0 ] forState:UIControlStateNormal];
        [customBT addTarget:self action:@selector(customBTtap:) forControlEvents:UIControlEventTouchUpInside];
        [customBT setDbobject:[self.customTipos objectAtIndex:i]];
        [customBT setDelegate:self];
        
        
        //adiciona na view
        [self.view addSubview:customBT];
        
        //adiciona no array de botoes
        [self.buttonArray addObject:customBT];
        
        //NSLog(@"%@",[[self.customTipos objectAtIndex:i] valueForKey:@"nome"]);
    }
    
    //ao final do for adiocina o botao de Add novo Tipo
    if(self.customTipos.count <6){
        [self.addCustomBT setFrame:[[self.frames objectAtIndex:i] CGRectValue]];
        [self.view addSubview:self.addCustomBT];
    }
    
}
-(void)customBTtap: (id)sender{
    CategoriasBT* referenciaBT = sender;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddTarefaDetailTableViewController *addTarefaDetailVC = (AddTarefaDetailTableViewController *)[storyboard instantiateViewControllerWithIdentifier:@"addTarefaDetailVC"];
    [addTarefaDetailVC setCategoria:[referenciaBT.dbobject valueForKey:@"nome"]];
    [self presentViewController:addTarefaDetailVC animated:YES completion:nil];

}

//metodo que limpa a tela e a recria
-(void)limpaERecria{
    
    //remove os botoes da superview
    for(int i = 0; i<self.buttonArray.count ;i++){
        [[self.buttonArray objectAtIndex:i] removeFromSuperview];
    }
    
    [[self customTipos]removeAllObjects];
    self.customTipos = [GerenciadorBD getTypes];
    [[self buttonArray]removeAllObjects];
    
    
    [self adicionaCustom];
    
    for(int i = 0; i<self.buttonArray.count;i++){
        [[[self.buttonArray objectAtIndex:i] removeBT] setHidden:YES];
    }
}
//delegate do botao customizado
-(void)didRemoveCategoria:(NSManagedObject *)objetoAdeletar{
    [self.alertaConfirmacao show];
    self.tempDelTipo = objetoAdeletar;
}
//alerta de confirmacao para deletar
-(void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 1){
        
        [GerenciadorBD deletaType:self.tempDelTipo];
        [self limpaERecria];
        self.tempDelTipo = nil;
        
    }
    else{
        self.tempDelTipo = nil;
    }
}
-(void)addCustomTipoBTtap: (id)sender{
    
    UIStoryboard *storyBoard = [self storyboard];
    NewTypeViewController *modalNewTypeViewController = [storyBoard instantiateViewControllerWithIdentifier:@"NewTypeViewController"];
    [self presentViewController:modalNewTypeViewController animated:YES completion:nil];
    

}
-(void)viewWillAppear:(BOOL)animated{
    [self limpaERecria];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setModalPresentationStyle:UIModalPresentationCurrentContext];
    
    //inits e Allocs
    self.customTipos = [[NSMutableArray alloc] init];
    self.buttonArray = [[NSMutableArray alloc] init];
    self.addCustomBT=[[UIButton alloc] init];
    
    [self setAlertaConfirmacao:[[UIAlertView alloc] initWithTitle:@"Você tem Certeza?" message:@"Isto deletara as tarefas desta categoria permanentemente" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"Ok",nil]];
    
    [self criaFrames];
    
    //Configura o botao de Adcionar categoria
    [self.addCustomBT setTitle:@"+" forState:UIControlStateNormal];
    [self.addCustomBT setBackgroundColor:[UIColor lightGrayColor]];
    [self.addCustomBT addTarget:self action:@selector(addCustomTipoBTtap:) forControlEvents:UIControlEventTouchDown];
    
    [self limpaERecria];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"Prova"]) {
        
        AddTarefaDetailTableViewController *vc = [segue destinationViewController];
        
        [vc setCategoria:@"Prova"];
    }
    if ([[segue identifier] isEqualToString:@"Trabalho"]) {
        
        AddTarefaDetailTableViewController *vc = [segue destinationViewController];
        
        [vc setCategoria:@"Trabalho"];
    }
    if ([[segue identifier] isEqualToString:@"Estudo"]) {
        
        AddTarefaDetailTableViewController *vc = [segue destinationViewController];
        
        [vc setCategoria:@"Estudo"];
    }
}

@end

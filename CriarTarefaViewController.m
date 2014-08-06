//
//  CriarTarefaViewController.m
//  Master
//
//  Created by ICARO NASCIMENTO FERREIRA on 04/08/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import "CriarTarefaViewController.h"

@interface CriarTarefaViewController ()

@end

@implementation CriarTarefaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)makeTasks:(id)sender {
    [GerenciadorBD criaTarefa:@"estudar swift" :@"estudo"];
    [GerenciadorBD criaTarefa:@"estudar matematica" :@"estudo"];
    [GerenciadorBD criaTarefa:@"ler livro de design" :@"estudo"];
    [GerenciadorBD criaTarefa:@"fazer as apresentacoes" :@"trabalho"];
    [GerenciadorBD criaTarefa:@"criar o prototipo" :@"trabalho"];
}

- (IBAction)getTasks:(id)sender {
    [GerenciadorBD getTarefas];
}
@end

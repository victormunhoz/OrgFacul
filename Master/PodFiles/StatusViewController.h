//
//  StatusViewController.h
//  Master
//
//  Created by Victor Munhoz Theodoro on 07/08/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GerenciadorBD.h"

@interface StatusViewController : UIViewController

@property NSMutableArray *tarefasStatus; //pega todas as tarefas em aberto
@property NSMutableArray *tarefaStatusTipo; //pega as tarefas por tipo
@property NSMutableArray *menssagens; //array de mensagens aleatórias

@property UILabel *labelMaior;//label de texto feed back para o maior valor de tarefa
@property UILabel *labelMsg;//label de texto da msg motivacional

@property NSString *textoMaior;//texto da labelMaior

//botao encerra a view;
- (IBAction)closeView:(id)sender;

@end

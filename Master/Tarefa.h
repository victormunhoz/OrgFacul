//
//  Tarefas.h
//  master
//
//  Created by Icaro Nascimento Ferreira on 08/08/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tarefa : NSObject

@property NSString *prioridade;
@property NSString *titulo;
@property NSString *tipo;
@property NSString *descricao;
@property NSNumber *notificacao;
@property NSDate *dataCriacao;
@property NSDate *dataFinal;

@end

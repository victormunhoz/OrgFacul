//
//  GerenciadorBD.h
//  Proto01
//
//  Created by Icaro Nascimento Ferreira on 28/07/14.
//  Copyright (c) 2014 Icaro Nascimento Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tarefa.h"

@interface GerenciadorBD : NSObject

+(NSMutableArray *)getTarefas;
+(void)deletaTarefa: (id)tarefaAdeletar;
+(void)criaTarefa:(Tarefa *)tarefa;
+(NSMutableArray *)getTarefasType:(NSString *)tipo;

+(void)criaType:(NSString *)name;
+(NSMutableArray *)getTypes;
+(void)deletaType: (id)typeAdeletar;

@end

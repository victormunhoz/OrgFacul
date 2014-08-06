//
//  GerenciadorBD.h
//  Proto01
//
//  Created by Icaro Nascimento Ferreira on 28/07/14.
//  Copyright (c) 2014 Icaro Nascimento Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GerenciadorBD : NSObject

+(void)criaTarefa;
+(NSMutableArray *)getTarefas;
+(void)deletaTarefa: (id)tarefaAdeletar;
+(void)criaTarefa:(NSString *)name :(NSString *)type;
+(NSMutableArray *)getTarefasType:(NSString *)tipo;

@end

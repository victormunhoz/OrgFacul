//
//  GerenciadorBD.m
//  Proto01
//
//  Created by Icaro Nascimento Ferreira on 28/07/14.
//  Copyright (c) 2014 Icaro Nascimento Ferreira. All rights reserved.
//

#import "GerenciadorBD.h"

@implementation GerenciadorBD

//metodo que gera o cotexto para o coredata
+ (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

+(void)criaTarefa:(Tarefa *)tarefa{
    //Cria novo ManagedObject
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSManagedObject *newTarefa = [NSEntityDescription insertNewObjectForEntityForName:@"Tarefa" inManagedObjectContext:context];
    
    [newTarefa setValue:tarefa.titulo forKey:@"titulo"];
    [newTarefa setValue:tarefa.tipo forKey:@"tipo"];
    [newTarefa setValue:tarefa.descricao forKey:@"descricao"];
    [newTarefa setValue:tarefa.dataCriacao forKey:@"dataCriacao"];
    [newTarefa setValue:tarefa.dataFinal forKey:@"dataFinal"];
    [newTarefa setValue:tarefa.notificacao forKey:@"notificacao"];
    [newTarefa setValue:tarefa.prioridade forKey:@"prioridade"];
    //NSLog(@"%@",[newTarefa valueForKey:@"titulo"]);
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Não salvou no banco. Erro: %@ %@", error, [error localizedDescription]);
    }
}

+(void)deletaTarefa: (id)tarefaAdeletar{
    // Delete object from database
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *tarefa = tarefaAdeletar;
    
    [context deleteObject:tarefa];
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
        return;
    }
}

+(NSMutableArray *)getTarefas{
    NSMutableArray *tarefas;
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Tarefa"];
    tarefas = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    return tarefas;
}

+(NSMutableArray *)getTarefasType: (NSString *)tipo{
    // Fetch the musicas from persistent data store
    
    NSMutableArray *tasksType;
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Tarefa"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"tipo == %@", tipo];
    [fetchRequest setPredicate:predicate];
    
    tasksType = [[managedObjectContext executeFetchRequest:fetchRequest error:nil]mutableCopy];
    
    return  tasksType;
}

//Tipos customizados

+(void)criaType:(NSString *)name{
    //Cria novo ManagedObject
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *newType = [NSEntityDescription insertNewObjectForEntityForName:@"Tipo" inManagedObjectContext:context];
    
    [newType setValue:name forKey:@"nome"];
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Não salvou no banco. Erro: %@ %@", error, [error localizedDescription]);
    }
}
+(NSMutableArray *)getTypes{
    NSMutableArray *types;
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Tipo"];
    types = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    //NSLog(@"%i",types.count);
    
    NSMutableArray* typesStrings;
    for(int i=0; i<types.count; i++){
        [typesStrings addObject:[[types objectAtIndex:i] valueForKey:@"nome"]];
    }
    
    return types;
}

+(void)deletaType: (id)typeAdeletar{
    // Delete object from database
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *tipo = typeAdeletar;
    
    [context deleteObject:tipo];
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
        return;
    }
}



@end

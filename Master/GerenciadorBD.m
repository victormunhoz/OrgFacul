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

+(void)criaTarefa:(NSString *)name :(NSString *)type{
    //Cria novo ManagedObject
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *newTarefa = [NSEntityDescription insertNewObjectForEntityForName:@"Tarefa" inManagedObjectContext:context];
    
    [newTarefa setValue:name forKey:@"titulo"];
    [newTarefa setValue:type forKey:@"prioridade"];
    
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
    NSLog(@"get : %i", tarefas.count);
    
    return tarefas;
}

+(NSMutableArray *)getTarefasType: (NSString *)tipo{
    // Fetch the musicas from persistent data store
    
    NSMutableArray *tasksType;
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Tarefa"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"prioridade == %@", tipo];
    [fetchRequest setPredicate:predicate];
    
    tasksType = [[managedObjectContext executeFetchRequest:fetchRequest error:nil]mutableCopy];
    
    return  tasksType;
}

+(void)criaTarefa{
}

@end

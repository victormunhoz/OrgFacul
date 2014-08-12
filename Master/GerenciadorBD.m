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

//Cria Tarefa no banco
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
    [newTarefa setValue:[NSNumber numberWithBool:NO] forKey:@"completada"];
    //NSLog(@"%@",[newTarefa valueForKey:@"completada"]);
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Não salvou no banco. Erro: %@ %@", error, [error localizedDescription]);
    }
}

//Deleta tarefa do banco
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

//Recebe as tarefas do banco
+(NSMutableArray *)getTarefas{
    NSMutableArray *tarefas;
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Tarefa"];
    tarefas = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    NSLog(@"tem %i",tarefas.count);
    return tarefas;
}

//pega todas as tarefas Incompletas
+(NSMutableArray *)getTarefasIncompletas{
    
    NSMutableArray *tasks;
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Tarefa"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"completada == %@",[NSNumber numberWithBool:NO]];
    [fetchRequest setPredicate:predicate];
    
    tasks = [[managedObjectContext executeFetchRequest:fetchRequest error:nil]mutableCopy];
    return  tasks;
}

//pega todas as tarefas completas
+(NSMutableArray *)getTarefasCompletas{
    
    NSMutableArray *tasks;
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Tarefa"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"completada == %@", [NSNumber numberWithBool:YES]];
    [fetchRequest setPredicate:predicate];
    
    tasks = [[managedObjectContext executeFetchRequest:fetchRequest error:nil]mutableCopy];
    
    return  tasks;
}

//Recebe as tarefas pelo tipo especifico, somente as incompletas
+(NSMutableArray *)getTarefasType: (NSString *)tipo{
    
    NSMutableArray *tasksType;
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Tarefa"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"tipo == %@", tipo];
    NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"completada == %@",[NSNumber numberWithBool:NO]];
    NSPredicate *compPredic = [NSCompoundPredicate andPredicateWithSubpredicates:[NSArray arrayWithObjects:predicate,predicate2, nil]];
    [fetchRequest setPredicate:compPredic];
    
    tasksType = [[managedObjectContext executeFetchRequest:fetchRequest error:nil]mutableCopy];
    
    
    return  tasksType;
}


+(void)completaTarefa:(NSManagedObject *)tarefa{
    NSManagedObjectContext *context = [self managedObjectContext];
    [tarefa setValue:[NSNumber numberWithBool:YES] forKey:@"completada"];
    
    NSError *error = nil;
    if (![context save:&error]) {
        //NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
        return;
    }
    
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

//
//  TarefaViewController.h
//  Master
//
//  Created by Icaro Nascimento Ferreira on 06/08/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GerenciadorBD.h"
#import "CategoriasBT.h"
#import "AddTarefaDetailTableViewController.h"
#import "NewTypeViewController.h"

@interface AddTarefaViewController : UIViewController <CategoriasBTDelegate,UIAlertViewDelegate,NewTypeDelegate>

@property NSMutableArray *customTipos;
@property UIAlertView *alertaConfirmacao;
@property NSManagedObject *tempDelTipo;
@property UIButton* addCustomBT;




@end

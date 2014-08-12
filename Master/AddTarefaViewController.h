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

@interface AddTarefaViewController : UIViewController <CategoriasBTDelegate,UIAlertViewDelegate>

@property NSMutableArray *customTipos;
@property (weak, nonatomic) IBOutlet UITextField *textInput;
@property (weak, nonatomic) IBOutlet UIButton *okBT;
@property UIAlertView *alertaConfirmacao;
@property NSManagedObject *tempDelTipo;
@property UIButton* addCustomBT;


@end

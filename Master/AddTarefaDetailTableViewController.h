//
//  AddTarefaDetailTableViewController.h
//  master
//
//  Created by Icaro Nascimento Ferreira on 07/08/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddTarefaViewController.h"
#import "Tarefa.h"
@interface AddTarefaDetailTableViewController : UITableViewController

@property NSString* categoria;

//Dados da tarefa

@property (weak, nonatomic) IBOutlet UITextField *tituloInput;
@property (strong, nonatomic) IBOutlet UIView *descriCell;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextView *descricaoInput;
@property (weak, nonatomic) IBOutlet UISwitch *dateSwitch;
@property (strong, nonatomic) IBOutlet UISegmentedControl *notifySegment;

//Verificadores de Expand e Collapse
@property BOOL cellDateExpand;
@property BOOL cellDescriExpand;

//Indicadores
@property (weak, nonatomic) IBOutlet UILabel *indicadorData;
@property (weak, nonatomic) IBOutlet UILabel *indicadorDescri;

@end

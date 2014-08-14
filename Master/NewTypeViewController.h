//
//  NewTypeViewController.h
//  master
//
//  Created by Victor Munhoz Theodoro on 10/08/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TypeCell.h"
#import "GerenciadorBD.h"

@protocol NewTypeDelegate;

@interface NewTypeViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate>

//label para receber o nome da nova categoria
@property (strong, nonatomic) IBOutlet UITextField *typeNameLaber;

//collection view da view controller
@property IBOutlet UICollectionView *typeIconsColle;

//Array das imagens dos icones de categoria
@property NSMutableArray *iconsArray;

//Array que pega todas as categorias do DB
@property NSMutableArray *dbTypes;

//Recebe a imagem selecionada
@property NSMutableArray *imageTypePick;

@property (nonatomic, weak) id <NewTypeDelegate> delegate;

- (IBAction)createType:(id)sender;

- (IBAction)cancelType:(id)sender;


@end

@protocol NewTypeDelegate
-(void)limpaERecria;
@end
//
//  CategoriasBT.h
//  Master
//
//  Created by ICARO NASCIMENTO FERREIRA on 06/08/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GerenciadorBD.h"

@protocol CategoriasBTDelegate
-(void)didRemoveCategoria:(NSManagedObject *) objetoAdeletar;
@end

@interface CategoriasBT : UIButton

@property (nonatomic, assign) id delegate;
@property NSManagedObject* dbobject;
@property UIButton *removeBT;


@end


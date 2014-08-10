//
//  CategoriasBT.m
//  Master
//
//  Created by ICARO NASCIMENTO FERREIRA on 06/08/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import "CategoriasBT.h"



@implementation CategoriasBT
@synthesize dbobject;
- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        [longPress setMinimumPressDuration:1.5];
        [self addGestureRecognizer:longPress];
        
    }
    return self;
}

- (void)longPress:(UILongPressGestureRecognizer*)gesture {
    if (gesture.state != UIGestureRecognizerStateEnded) {
       
        [self showRemoveBT];
        
        
    }
    else{
        return;
    }
}

-(void)showRemoveBT {
    UIButton *removeBT = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [removeBT setBackgroundColor:[UIColor redColor]];
    [removeBT addTarget:self action:@selector(removeBTtap) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:removeBT];
}

-(void)removeBTtap{
    NSLog(@"removido");
    [GerenciadorBD deletaType:self.dbobject];
    [self removeFromSuperview];
     [self.delegate didRemoveCategoria];
  
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


@end

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
        
        self.removeBT = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self.removeBT setBackgroundColor:[UIColor redColor]];
        [self.removeBT addTarget:self action:@selector(removeBTtap) forControlEvents:UIControlEventTouchUpInside];
        [self.removeBT setHidden:YES];
        [self addSubview:self.removeBT];
        
    }
    return self;
}

- (void)longPress:(UILongPressGestureRecognizer*)gesture {
    if (gesture.state != UIGestureRecognizerStateEnded) {
       
        [self.removeBT setHidden:NO];
        
        
    }
    else{
        return;
    }
}

//aciona o delegate para o tratamento ser feito na superview
-(void)removeBTtap{
    NSLog(@"removido");
    [self.delegate didRemoveCategoria:self.dbobject];
  
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

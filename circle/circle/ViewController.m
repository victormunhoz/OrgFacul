//
//  ViewController.m
//  circle
//
//  Created by VICTOR MUNHOZ THEODORO on 11/06/14.
//  Copyright (c) 2014 VICTOR MUNHOZ THEODORO. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.circleArray = [[NSMutableArray alloc]init];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)circleCreate:(id)sender {
    
 
    CircleView *circleView = [[CircleView alloc]init];
    [[self view]addSubview:circleView];
    [[self circleArray]addObject:circleView];

     [self drawLines];
    
}


-(void)drawLines{
    
    if (_circleArray.count >= 2) {
        
        for (int i = 1; i < self.circleArray.count; i++) {
            
            CircleView *c = [_circleArray objectAtIndex:i];
            CircleView *cn = [_circleArray objectAtIndex:i-1];
            
            UIBezierPath *path = [UIBezierPath bezierPath];
            [path moveToPoint:CGPointMake(c.center.x, c.center.y)];
            [path addLineToPoint:CGPointMake(cn.center.x, cn.center.y)];
            
            CAShapeLayer *shapeLayer = [CAShapeLayer layer];
            shapeLayer.path = [path CGPath];
            shapeLayer.strokeColor = [[UIColor blueColor]CGColor];
            shapeLayer.lineWidth = 3.0;
            shapeLayer.fillColor = [[UIColor clearColor]CGColor];
            
            [self.view.layer addSublayer:shapeLayer];    }
    }

    
    

}
@end

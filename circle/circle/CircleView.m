//
//  CircleView.m
//  circle
//
//  Created by VICTOR MUNHOZ THEODORO on 11/06/14.
//  Copyright (c) 2014 VICTOR MUNHOZ THEODORO. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.alpha = 0.5;
        self.layer.cornerRadius = 25;
        self.backgroundColor = [UIColor blueColor];
        self.x = arc4random()%320;
        self.y = arc4random()%560;
        self.frame = CGRectMake(self.x, self.y, 50, 50);
    }
    return self;
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

//
//  SlidingViewController.m
//  OrgFacul_Org01
//
//  Created by GABRIEL FARIA DE CARVALHO TAVARES on 04/08/14.
//  Copyright (c) 2014 GABRIEL FARIA DE CARVALHO TAVARES. All rights reserved.
//

#import "SlidingViewController.h"

@interface SlidingViewController ()
@end


@implementation SlidingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TaskList"];
}

@end

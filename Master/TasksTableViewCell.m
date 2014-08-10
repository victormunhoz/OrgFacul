//
//  TasksTableViewCell.m
//  Master
//
//  Created by Victor Munhoz Theodoro on 05/08/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import "TasksTableViewCell.h"

@implementation TasksTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (NSArray *)rightButtons
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.7f green:0.7f blue:0.7f alpha:1.0f] title:@"Edit"];
    
    
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.5f green:0.7f blue:1.0f alpha:1.0f]
                                                title:@"Drop"];
    
    //    [rightUtilityButtons sw_addUtilityButtonWithColor:[UIColor colorWithRed:0.5f green:0.7f blue:1.0f alpha:1.0f]
    //                                           normalIcon:[UIImage imageNamed:@"addLibrary.png"]
    //                                         selectedIcon:[UIImage imageNamed:@"play.png"]];
    
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
                                                title:@"Del"];
    
    return rightUtilityButtons;
}


@end

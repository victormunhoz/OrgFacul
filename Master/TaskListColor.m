//
//  TaskListColor.m
//  Master
//
//  Created by GABRIEL FARIA DE CARVALHO TAVARES on 07/08/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import "TaskListColor.h"

@implementation TaskListColor


+(UIColor*)RGBbyNumber:(NSInteger)num AndTotal:(NSInteger)total{
    // red [255, 0, 0]
    // yel [255, 255, 0]
    
    float media  = 150.0f / total;
    
    
    UIColor *RGB = [UIColor colorWithRed:225.0f/255.0f
                    green:105.0f/255.0f
                     blue:105.0f/255.0f
                    alpha:1.0f];
    
    float increment = media;
    
    float cnt = 105.0f;

    for (int i = 1; i <= total; i++) {
        if (i == num) {
            RGB = [UIColor colorWithRed:255.0f/255.0f
                              green:cnt/255.0f
                               blue:105.0f/255.0f
                              alpha:1.0f];
        }
        
    
        cnt += increment;
    }
    
    return RGB;
}


@end

//
//  BasicNavViewController.m
//  sideslip
//
//  Created by 赵小嘎 on 15-1-15.
//  Copyright (c) 2015年 赵小嘎. All rights reserved.
//

#import "BasicNavViewController.h"

@implementation BasicNavViewController
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
    if (self.viewControllers.count == 1) {
        viewController.hidesBottomBarWhenPushed = NO;
    }
    
}
@end

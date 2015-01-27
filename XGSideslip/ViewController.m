//
//  ViewController.m
//  XGSideslip
//
//  Created by 赵小嘎 on 15-1-27.
//  Copyright (c) 2015年 赵小嘎. All rights reserved.
//

#import "ViewController.h"
#import "XGSideMenuViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISwipeGestureRecognizer *recognize = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    
    [recognize setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [[self view] addGestureRecognizer:recognize];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)handleSwipeFrom:(id)GesturePan {
    
    [self.sideMenuViewController openMenuAnimated:YES completion:nil];
    
}

@end

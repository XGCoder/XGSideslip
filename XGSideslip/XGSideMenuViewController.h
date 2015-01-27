//
//  XGSideMenuViewController.h
//  sideslip
//
//  Created by 赵小嘎 on 15-1-15.
//  Copyright (c) 2015年 赵小嘎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XGSideMenuViewController : UIViewController
/*
 * 初始化侧边栏和menu
 */
- (instancetype)initWithSideControl:(UIViewController*)side
                     andMenuControl:(UIViewController*)menu;

/*
 * side控制器
 */
@property(nonatomic,weak)UIViewController *side;
/*
 * menu控制器
 */
@property(nonatomic,weak)UIViewController *menu;
@end



@interface XGSideMenuViewController (MenuActions)

/*
 *  开始动画
 */
- (void)openMenuAnimated:(BOOL)animated completion:(void (^)())completion;

/*
 *  返回动画
 */
- (void)closeMenuAnimated:(BOOL)animated completion:(void (^)())completion;

@end



@interface UIViewController (XGSideMenuViewController)

@property (nonatomic, weak) XGSideMenuViewController *sideMenuViewController;


@end

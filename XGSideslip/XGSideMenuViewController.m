//
//  XGSideMenuViewController.m
//  sideslip
//
//  Created by 赵小嘎 on 15-1-15.
//  Copyright (c) 2015年 赵小嘎. All rights reserved.
//

#import "XGSideMenuViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>


#define kAnimationTime 0.3   //动画时间
#define kAnimationSX 258    //侧边栏位移距离



@interface XGEnvelop : UIView
@property(nonatomic,weak)id delegate;
@end
@implementation XGEnvelop
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.delegate respondsToSelector:@selector(closeMenuAnimated:completion:)]) {
        [self.delegate closeMenuAnimated:YES completion:nil];
    }
}
@end

@interface XGSideMenuViewController ()
@property(nonatomic,assign)BOOL animation;
/*
 *  遮盖view
 */
@property(nonatomic,weak)XGEnvelop *envelop;

@end

@implementation XGSideMenuViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.side.view.frame = self.view.bounds;
    [self.view addSubview:self.side.view];
    
    self.menu.view.frame = self.view.bounds;
    [self.view addSubview:self.menu.view];
}

- (instancetype)initWithSideControl:(UIViewController *)side andMenuControl:(UIViewController *)menu
{
    if (self = [super init]) {
        self.side = side;
        self.menu = menu;
        
        [self addChildViewController:side];
        [self addChildViewController:menu];
    }
    return self;
}
#pragma mark 这是策划动画方法
/*
 *  开始动画
 */
- (void)openMenuAnimated:(BOOL)animated completion:(void (^)())completion{
    if (self.animation)  return;
    
    
    
    
    //在menu上添加遮盖
    XGEnvelop * envelop = [[XGEnvelop alloc]init];
    envelop.delegate = self;
    envelop.frame = [UIScreen mainScreen].bounds;
    [self.menu.view addSubview:envelop];
    self.envelop = envelop;
    
    UIViewController *menu = self.childViewControllers.lastObject;
    CGAffineTransform trans = CGAffineTransformMakeTranslation(kAnimationSX, 0);
    trans = CGAffineTransformScale(trans, 1, 0.8);
    [UIView animateWithDuration:animated?kAnimationTime:0 animations:^{
        menu.view.layer.affineTransform = trans;
    } completion:^(BOOL finished) {
        self.animation = YES;
        if (completion) {
            completion();
        }
    }];
}

/*
 *  返回动画
 */
- (void)closeMenuAnimated:(BOOL)animated completion:(void (^)())completion{
    if (!self.animation)  return;
    UIViewController *menu = self.childViewControllers.lastObject;
    [UIView animateWithDuration:animated?kAnimationTime:0 animations:^{
        menu.view.layer.affineTransform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        self.animation = NO;
        self.envelop.delegate = nil;
        [self.envelop removeFromSuperview];
        if (completion) {
            completion();
        }
    }];
    
}
- (void)addChildViewController:(UIViewController *)childController
{
    [super addChildViewController:childController];
    childController.sideMenuViewController = self;
    
}


@end


@implementation UIViewController (XGSideMenuViewController)

- (void)setSideMenuViewController:(XGSideMenuViewController *)sideMenuViewController
{
    //RUNTIME
    objc_setAssociatedObject(self, @selector(sideMenuViewController), sideMenuViewController, OBJC_ASSOCIATION_ASSIGN);
    
}

- (XGSideMenuViewController *)sideMenuViewController
{
    XGSideMenuViewController *sideMenuController = objc_getAssociatedObject(self, @selector(sideMenuViewController));
    if (!sideMenuController) {
        sideMenuController = self.parentViewController.sideMenuViewController;
    }
    return sideMenuController;
}

@end

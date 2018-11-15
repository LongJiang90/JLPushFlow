//
//  SVProgressHUD+HUDTools.m
//  YWOAManagementSystem
//
//  Created by xp on 16/9/5.
//  Copyright © 2016年 yunwangnet.com. All rights reserved.
//

#import "SVProgressHUD+HUDTools.h"

@implementation SVProgressHUD (HUDTools)

#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 设置HUD背景色为亮色
    [SVProgressHUD showWithStatus:text];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleLight];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeFlat];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD dismissWithDelay:1.5];
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
//    [self show:error icon:@"error.png" view:view];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeFlat];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setMinimumDismissTimeInterval:1.5];
//    [SVProgressHUD dismissWithDelay:1.5];
    
    [self showImage:[UIImage imageNamed:@"MBProgressHUD.bundle/error.png"] status:error];
    
}

#pragma mark 显示成功信息
+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
//    [self show:success icon:@"success.png" view:view];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeFlat];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setMinimumDismissTimeInterval:1.5];
//    [SVProgressHUD dismissWithDelay:1.5];
    
    [self showImage:[UIImage imageNamed:@"MBProgressHUD.bundle/success.png"] status:success];
}

#pragma mark 显示一些信息
+ (void)showSomeMessage:(NSString *)message {
    [self showWithStatus:message];
}

+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}

+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
//    [self hideHUDForView:view animated:YES];
    [self dismiss];
}

+ (void)hideHUD
{
//    [self hideHUDForView:nil];
    [self dismiss];
}

@end

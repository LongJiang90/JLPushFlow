//
//  HomeVC.m
//  JLPushFlow
//
//  Created by Long on 2018/11/19.
//  Copyright © 2018 Long. All rights reserved.
//

#import "HomeVC.h"
#import "JLLiveVC.h"
#import "JLPlayerVC.h"
#import "Defines.h"

@interface HomeVC ()



@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - 按钮响应函数

#pragma mark - 协议函数

#pragma mark - 网络请求

#pragma mark - 自定义方法
-(void) gotoLiveVC {
    JLLiveVC *aVC = [appDelegate.mainSB instantiateViewControllerWithIdentifier:@"JLLiveVC"];
    [self.navigationController pushViewController:aVC animated:YES];
    
}

-(void) gotoPlayVC {
    JLPlayerVC *aVC = [appDelegate.mainSB instantiateViewControllerWithIdentifier:@"JLPlayerVC"];
    [self.navigationController pushViewController:aVC animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

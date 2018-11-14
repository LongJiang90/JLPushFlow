//
//  JLLiveVC.m
//  JLPushFlow
//
//  Created by Long on 2018/11/13.
//  Copyright © 2018 Long. All rights reserved.
//

#import "JLLiveVC.h"
#import "LFLiveKit.h"


static NSString *RTMP_URL = @"rtmp://192.168.1.8:1935/rtmplive/room";

@interface JLLiveVC ()<LFLiveSessionDelegate>

@property (nonatomic, strong) LFLiveSession *session;

@end

@implementation JLLiveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startLive];
    });
    
    
    
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self rtmpInit];
}



#pragma mark - 按钮响应函数


#pragma mark - 协议函数
#pragma mark - LFLiveSessionDelegate
-(void)liveSession:(LFLiveSession *)session liveStateDidChange:(LFLiveState)state {
    switch (state) {
        case 0:
            NSLog(@"准备...");
            break;
        case 1:
            NSLog(@"连接中...");
            break;
        case 2:
            NSLog(@"已连接...");
            break;
        case 3:
            NSLog(@"已断开...");
            break;
        case 4:
            NSLog(@"连接出错...");
            break;
        case 5:
            NSLog(@"正在刷新...");
            break;
        default:
            break;
    }
}

-(void)liveSession:(LFLiveSession *)session errorCode:(LFLiveSocketErrorCode)errorCode {
    NSLog(@"%lu",(unsigned long)errorCode);
}

-(void)liveSession:(LFLiveSession *)session debugInfo:(LFLiveDebug *)debugInfo {
    NSLog(@"%@",debugInfo);
}


#pragma mark - 自定义方法


-(void)rtmpInit {
    if (!self.session) {
        self.session = [[LFLiveSession alloc] initWithAudioConfiguration:[LFLiveAudioConfiguration defaultConfiguration] videoConfiguration:[LFLiveVideoConfiguration defaultConfiguration] captureType:(LFLiveCaptureDefaultMask)];
        self.session.preView = self.view;
        
        self.session.delegate = self;
        self.session.running = YES;
    }
}

-(void)startLive {
    LFLiveStreamInfo *stream = [LFLiveStreamInfo new];
    stream.url = RTMP_URL;
    [self.session startLive:stream];
}

-(void)stopLive {
    [self.session stopLive];
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

//
//  ViewController.m
//  DelegateDemo
//
//  Created by 舒煜进 on 15-4-13.
//  Copyright (c) 2015年 启能教育. All rights reserved.
//

#import "ViewController.h"
#import "DaYiJi.h"
#import "DaYiJiProtocl.h"

@interface ViewController ()<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *ping;
@property (weak, nonatomic) IBOutlet UIButton *Button1;
@property (weak, nonatomic) IBOutlet UIButton *Button2;
@property (weak, nonatomic) IBOutlet UILabel *jinduLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *Progress;

//定义一个委托对象
@property id<DaYiJiProtocl>delegate;

@property DaYiJi * dyj;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dyj = [DaYiJi new];
    //将打印机指定为我们的委托对象
    self.delegate = self.dyj;

}
- (IBAction)But1:(id)sender {
    
//让我的委托给我打印weizi
    [self.delegate dayiweizi];
    
    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"系统更新" message:@"有新版本更新，版本号8.3。是否更新" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"更新",nil];
    [alertView show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    if (buttonIndex == 1) {
        self.view.backgroundColor=[UIColor blackColor];
        self.Progress.hidden = NO;
        self.jinduLabel.hidden = NO;
        self.Button2.hidden = YES;
        self.Button1.hidden = YES;
        self.ping.hidden = NO;
        NSTimer * timer = [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(ProgressView) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    }
    if (buttonIndex == 0) {
        self.view.backgroundColor = [UIColor blackColor];
        self.jinduLabel.hidden = NO;
        self.jinduLabel.text = @"更新失败";
        self.jinduLabel.textColor = [UIColor whiteColor];
        self.Button2.hidden = YES;
    }
}
- (void)ProgressView{
    
    if (self.Progress.progress <1) {
        self.Progress.progress+=0.03;
        self.jinduLabel.hidden = NO;
        
        if (self.Progress.progress == 1) {
        self.Button1.hidden = YES;
        self.Button2.hidden = YES;
        self.view.backgroundColor = [UIColor whiteColor];
        
        }
    }
}
- (IBAction)But2:(id)sender {
    
    //判断是否可以打印    不加判断会挂掉  加判断打印不出来 因为没有实现这个方法 只是定义这个委托的可选方法
    if ([self.delegate respondsToSelector:@selector(dayiji)]) {

    [self.delegate dayiji];
    }
    
}

@end

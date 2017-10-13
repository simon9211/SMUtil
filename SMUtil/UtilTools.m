//
//  UtilTools.m
//  H2P
//
//  Created by xiwang wang on 2017/3/29.
//  Copyright © 2017年 xiwang wang. All rights reserved.
//

#import "UtilTools.h"

@implementation UtilTools

+ (UIColor *)colorWithHexString:(NSString *)hexString{
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if (cString.length < 6)
        return [UIColor clearColor];
    
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if (cString.length == 6) {
        cString = [@"ff" stringByAppendingString:cString];
    }
    if (cString.length != 8) {
        return [UIColor clearColor];
    }
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *aString = [cString substringWithRange:range];
    range.location = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 4;
    NSString *gString = [cString substringWithRange:range];
    range.location = 6;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int a, r, g, b;
    [[NSScanner scannerWithString:aString] scanHexInt:&a];
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    // 注意：myColor是自定义宏
    //#define myColor(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
        return [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a / 255.0];
}


/**
 渐变色

 @param view <#view description#>
 */
+ (void)addRampShaderColorWithView:(UIView *)view{
    CAGradientLayer *test = nil;
    for (id l in view.layer.sublayers) {
        if ([l isKindOfClass:[CAGradientLayer class]]) {
            CAGradientLayer *cal = (CAGradientLayer *)l;
            test = cal;
        }
    }
    if (test) {
        [test removeFromSuperlayer];
    }
    
    CAGradientLayer * layer = [CAGradientLayer layer];
    layer.startPoint = CGPointMake(0, 0.5);
    layer.endPoint = CGPointMake(1, 0.5);
    layer.colors = [NSArray arrayWithObjects:(id)UIColorFromHexadecimal(0x5fe3c1).CGColor,(id)UIColorFromHexadecimal(0x0ab5bf).CGColor, nil];
    layer.locations = @[@0.0f,@1.0f];
    layer.frame = CGRectMake(0, 0, view.bounds.size.width, view.bounds.size.height);
    [view.layer insertSublayer:layer atIndex:0];
}


/**
开启倒计时效果

 @param t 倒计时长
 @param btn 倒计时按钮
 */
+ (void)openCountdownTime:(NSInteger)t button:(UIButton *)btn{
    
    __block NSInteger time = t - 1; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮的样式
                [btn setTitle:@"重新发送" forState:UIControlStateNormal];
                [btn setTitleColor:UIColorFromHexadecimal(0xfb8557) forState:UIControlStateNormal];
                btn.enabled = YES;
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [btn setTitle:[NSString stringWithFormat:@"%ds", seconds] forState:UIControlStateDisabled];
                [btn setTitleColor:UIColorFromHexadecimal(0x979797) forState:UIControlStateDisabled];
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}

+ (void)showAlertViewInController:(UIViewController *)ctrl title:(NSString *)title Message:(NSString *)message verifyAction:(SEL)verifyAction hasCancel:(BOOL)hasCancel hasDestructive:(BOOL)hasDes{
    UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (hasCancel) {
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alertCtrl addAction:cancel];
    }
    
    PMPWeak(ctrl);
    UIAlertAction *verify = [UIAlertAction actionWithTitle:@"确认" style:hasDes?UIAlertActionStyleDestructive:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (verifyAction) {
            IMP imp = [weak_ctrl methodForSelector:verifyAction];
            void (*func)(id,SEL) = (void *)imp;
            func(weak_ctrl,verifyAction);
        }
    }];
    
    [alertCtrl addAction:verify];
    
    [ctrl presentViewController:alertCtrl animated:YES completion:nil];
}

@end

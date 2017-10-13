//
//  UtilTools.h
//  H2P
//
//  Created by xiwang wang on 2017/3/29.
//  Copyright © 2017年 xiwang wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define UIColorFromHexadecimal(RGBValue) [UIColor colorWithRed:((float)((RGBValue & 0xFF0000) >> 16))/255.0 \
green:((float)((RGBValue & 0xFF00) >> 8))/255.0 \
blue:((float)(RGBValue & 0xFF))/255.0 \
alpha:1.0]

#define PMPWeak(object) __weak typeof(object)weak##_##object = object


@interface UtilTools : NSObject

+ (UIColor *)colorWithHexString:(NSString *)hexString;

+ (void)addRampShaderColorWithView:(UIView *)view;

+ (void)openCountdownTime:(NSInteger)t button:(UIButton *)btn;

+ (void)showAlertViewInController:(UIViewController *)ctrl title:(NSString *)title Message:(NSString *)message verifyAction:(SEL)verifyAction hasCancel:(BOOL)hasCancel hasDestructive:(BOOL)hasDes;

@end

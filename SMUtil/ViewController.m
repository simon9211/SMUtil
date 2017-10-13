//
//  ViewController.m
//  SMUtil
//
//  Created by xiwang wang on 2017/10/13.
//  Copyright © 2017年 xiwang wang. All rights reserved.
//

#import "ViewController.h"
#import "Function.h"
@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController
{
    UIButton *_btn;
    UITextField *_textField;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _btn = ({
        [UIButton sm_makeButton:^(UIButton *btn) {
            btn.sm_titleWithState(@"hah",UIControlStateNormal).sm_titleFontSize(19).sm_titleColorWithState([UIColor redColor],UIControlStateNormal).sm_frame(CGRectMake(200, 100, 100, 100)).sm_addTargetAction (self,@selector(test1),UIControlEventTouchUpInside).sm_backgroundColor([UIColor grayColor]);
            [self.view addSubview:btn];
        }];
    });
    
    _textField = ({
        [UITextField sm_makeTextField:^(UITextField *textField) {
            textField.sm_frame(CGRectMake(20, 64, 200, 30)).sm_delegate(self).sm_backgroundColor(UIColor.blueColor).sm_addTargetAction(self,@selector(textFieldChange:),UIControlEventEditingChanged);
            [self.view addSubview:textField];
        }];
    });
}

- (void)test1{
    NSLog(@"test 1");
    _btn.sm_removeTargetAction(self, @selector(test1),UIControlEventTouchUpInside).sm_addTargetAction(self,@selector(test2),UIControlEventTouchUpInside);
}

- (void)test2{
    NSLog(@"test 2");
    _btn.sm_removeTargetAction(self, @selector(test2),UIControlEventTouchUpInside).sm_addTargetAction(self,@selector(test1),UIControlEventTouchUpInside);
}

- (void)textFieldChange:(UITextField*)textField1{
    NSLog(@"%@",textField1.text);
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"%@",_textField.text);
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"%@",_textField.text);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"%@",_textField.text);

    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  Function.h
//  MasonryTestDemo
//
//  Created by xiwang wang on 2017/10/9.
//  Copyright © 2017年 xiwang wang. All rights reserved.
//

#import <UIKit/UIKit.h>

//#define CustomBlock(blockName, returnType, argType, argName)  typedef returnType (^blockName) (argType argName);
//CustomBlock(buttonBlock, UIButton *, NSInteger, i)
//#define CustomBlock(returnType)     typedef returnType(^blockName)(UILabel* argName);

#define SM_SAFE_BLOCK(BlockName, ...) ({ !BlockName ? nil : BlockName(__VA_ARGS__); })

//0个参数
#define __CreateCustomNoArgBlock(returnType)                        returnType (^)()
#define  _CreateCustomNoArgBlock(returnType)                        __CreateCustomNoArgBlock(returnType)

#define CreateButtonNoArgBlock                                      _CreateCustomNoArgBlock(UIButton*)
#define CreateLabelNoArgBlock                                       _CreateCustomNoArgBlock(UILabel*)
#define CreateImageViewNoArgBlock                                   _CreateCustomNoArgBlock(UIImageView*)
#define CreateTextFieldNoArgBlock                                   _CreateCustomNoArgBlock(UITextField*)

//一个参数
#define __CreateCustomOneArgBlock(returnType,argType,argName)       returnType (^)(argType  argName)
#define  _CreateCustomOneArgBlock(returnType,argType,argName)       __CreateCustomOneArgBlock(returnType, argType, argName)

#define CreateButtonOneArgBlock(argType,argName)                    _CreateCustomOneArgBlock(UIButton*, argType,argName)
#define CreateLabelOneArgBlock(argType,argName)                     _CreateCustomOneArgBlock(UILabel*, argType,argName)
#define CreateImageViewOneArgBlock(argType,argName)                 _CreateCustomOneArgBlock(UIImageView*, argType,argName)
#define CreateTextFieldOneArgBlock(argType,argName)                 _CreateCustomOneArgBlock(UITextField*, argType,argName)


//两个参数
#define  __CreateCustomTwoArgBlock(returnType,argType1,argName1,argType2,argName2)     returnType (^)(argType1  argName1,argType2  argName2)
#define   _CreateCustomTwoArgBlock(returnType,argType1,argName1,argType2,argName2)     __CreateCustomTwoArgBlock(returnType, argType1,argName1,argType2,argName2)

#define  CreateButtonTwoArgBlock(argType1,argName1,argType2,argName2)                  _CreateCustomTwoArgBlock(UIButton*, argType1,argName1,argType2,argName2)
#define  CreateLabelTwoArgBlock(argType1,argName1,argType2,argName2)                   _CreateCustomTwoArgBlock(UILabel*, argType1,argName1,argType2,argName2)
#define  CreateImageViewTwoArgBlock(argType1,argName1,argType2,argName2)               _CreateCustomTwoArgBlock(UIImageView*, argType1,argName1,argType2,argName2)
#define  CreateTextFieldTwoArgBlock(argType1,argName1,argType2,argName2)               _CreateCustomTwoArgBlock(UITextField*, argType1,argName1,argType2,argName2)

//target action
#define __CreateCustomTargetActionBlock(returnType)            returnType (^)(id target, SEL sel, UIControlEvents event)
#define  _CreateCustomTargetActionBlock(returnType)            __CreateCustomTargetActionBlock(returnType)

#define CreateButtonTargetActionBlock                          _CreateCustomNoArgBlock(UIButton*)
#define CreateTextFieldTargetActionBlock                       _CreateCustomNoArgBlock(UITextField*)


@interface UIButton (Function)

- (CreateButtonTwoArgBlock(NSString *,name,UIControlState,state))sm_imageNameWithState;
- (CreateButtonTwoArgBlock(NSString *,title,UIControlState,state))sm_titleWithState;
- (CreateButtonOneArgBlock(CGFloat, fontSize))sm_titleFontSize;
- (CreateButtonTwoArgBlock(UIColor *,titleColor,UIControlState,state))sm_titleColorWithState;
- (CreateButtonOneArgBlock(CGRect, frame))sm_frame;
- (CreateButtonOneArgBlock(CGSize, size))sm_size;
- (CreateButtonOneArgBlock(CGPoint, origin))sm_origin;
- (CreateButtonOneArgBlock(CGPoint, center))sm_center;
- (CreateButtonOneArgBlock(UIColor *,backgroundColor))sm_backgroundColor;
- (CreateButtonTargetActionBlock)sm_addTargetAction;
- (CreateButtonTargetActionBlock)sm_removeTargetAction;

+ (UIButton *)sm_makeButton:(void(^)(UIButton *btn))block;

@end

@interface UILabel (Function)

- (CreateLabelOneArgBlock(CGRect,frame))sm_frame;
- (CreateLabelOneArgBlock(CGSize,size))sm_size;
- (CreateLabelOneArgBlock(CGPoint,origin))sm_origin;
- (CreateLabelOneArgBlock(CGPoint,center))sm_center;
- (CreateLabelOneArgBlock(NSString *,text))sm_text;
- (CreateLabelOneArgBlock(CGFloat,fontSize))sm_fontSize;
- (CreateLabelOneArgBlock(UIColor *,textColor))sm_textColor;
- (CreateLabelOneArgBlock(UIColor *,backgroundColor))sm_backgroundColor;
- (CreateLabelOneArgBlock(UIColor *,shadowColor))sm_shadowColor;
- (CreateLabelOneArgBlock(NSTextAlignment,textAlignment))sm_textAlignment;
- (CreateLabelOneArgBlock(BOOL,userInteractionEnabled))sm_userInteractionEnabled;
- (CreateLabelOneArgBlock(NSAttributedString *,attributedText))sm_attributedText;
- (CreateLabelOneArgBlock(NSInteger,numberOfLines))sm_numberOfLines;

+ (UILabel *)sm_makeLabel:(void(^)(UILabel *label))block;

@end

@interface UIImageView (Function)

- (CreateImageViewOneArgBlock(CGRect,frame))sm_frame;
- (CreateImageViewOneArgBlock(CGSize,size))sm_size;
- (CreateImageViewOneArgBlock(CGPoint,origin))sm_origin;
- (CreateImageViewOneArgBlock(CGPoint,center))sm_center;
- (CreateImageViewOneArgBlock(NSString *,imageName))sm_imageName;
- (CreateImageViewOneArgBlock(NSString *,highlightedImageName))sm_highlightedImageName;
- (CreateImageViewOneArgBlock(BOOL,highlighted))sm_highlighted;
- (CreateImageViewOneArgBlock(NSTimeInterval,animationDuration))sm_animationDuration;
- (CreateImageViewOneArgBlock(NSInteger,animationRepeatCount))sm_animationRepeatCount;
- (CreateImageViewOneArgBlock(NSArray *,animationImages))sm_animationImages;
- (CreateImageViewOneArgBlock(NSArray *,highlightedAnimationImages))sm_highlightedAnimationImages;
- (CreateImageViewNoArgBlock)sm_startAnimating;
- (CreateImageViewNoArgBlock)sm_stopAnimating;

+ (UIImageView *)sm_makeImageView:(void(^)(UIImageView *imageView))block;

@end

@interface UITextField (Function)

- (CreateTextFieldOneArgBlock(CGRect,frame))sm_frame;
- (CreateTextFieldOneArgBlock(CGSize,size))sm_size;
- (CreateTextFieldOneArgBlock(CGPoint,origin))sm_origin;
- (CreateTextFieldOneArgBlock(CGPoint,center))sm_center;
- (CreateTextFieldOneArgBlock(UIColor *,backgroundColor))sm_backgroundColor;
- (CreateTextFieldOneArgBlock(NSString *, text))sm_text;
- (CreateTextFieldOneArgBlock(NSAttributedString *,attributedText))sm_attributedText;
- (CreateTextFieldOneArgBlock(UIColor *, textColor))sm_textColor;
- (CreateTextFieldOneArgBlock(CGFloat, fontSize))sm_fontSize;
- (CreateTextFieldOneArgBlock(NSTextAlignment, textAlignment))sm_textAlignment;
- (CreateTextFieldOneArgBlock(UITextBorderStyle, borderStyle))sm_borderStyle;
- (CreateTextFieldOneArgBlock(NSString *, placeholder))sm_placeholder;
- (CreateTextFieldOneArgBlock(NSAttributedString *, attributedPlaceholder))sm_attributedPlaceholder;
- (CreateTextFieldOneArgBlock(BOOL, clearsOnBeginEditing))sm_clearsOnBeginEditing;
- (CreateTextFieldOneArgBlock(BOOL, adjustsFontSizeToFitWidth))sm_adjustsFontSizeToFitWidth;
- (CreateTextFieldOneArgBlock(CGFloat, minimumFontSize))sm_minimumFontSize;
- (CreateTextFieldOneArgBlock(id<UITextFieldDelegate>, delegate))sm_delegate;
- (CreateTextFieldOneArgBlock(UIImage *, background))sm_background;
- (CreateTextFieldOneArgBlock(UIImage *, disabledBackground))sm_disabledBackground;
- (CreateTextFieldOneArgBlock(UITextFieldViewMode, clearButtonMode))sm_clearButtonMode;
- (CreateTextFieldOneArgBlock(UIView *, left))sm_leftView;
- (CreateTextFieldOneArgBlock(UITextFieldViewMode, leftViewMode))sm_leftViewMode;
- (CreateTextFieldOneArgBlock(UIView *, right))sm_rightView;
- (CreateTextFieldOneArgBlock(UITextFieldViewMode, rightViewMode))sm_rightViewMode;
- (CreateTextFieldOneArgBlock(CGRect, rect))sm_drawTextInRect;
- (CreateTextFieldOneArgBlock(CGRect, rect))sm_drawPlaceholderInRect;

- (CreateTextFieldTargetActionBlock)sm_addTargetAction;
- (CreateTextFieldTargetActionBlock)sm_removeTargetAction;

+ (UITextField *)sm_makeTextField:(void(^)(UITextField *textField))block;


@end




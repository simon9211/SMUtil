//
//  Function.m
//  MasonryTestDemo
//
//  Created by xiwang wang on 2017/10/9.
//  Copyright © 2017年 xiwang wang. All rights reserved.
//

#import "Function.h"


@implementation UIButton (Function)

- (UIButton *(^)(NSString *, UIControlState))sm_imageNameWithState{
    return ^UIButton *(NSString *name, UIControlState state){
        [self setImage:[UIImage imageNamed:name] forState:state];
        return self;
    };
}

- (UIButton *(^)(NSString *, UIControlState))sm_titleWithState{
    return ^UIButton *(NSString *title, UIControlState state){
        [self setTitle:title forState:state];
        return self;
    };
}

- (UIButton *(^)(CGFloat))sm_titleFontSize{
    return ^UIButton *(CGFloat font){
        self.titleLabel.font = [UIFont systemFontOfSize:font];
        return self;
    };
}

- (UIButton *(^)(UIColor *, UIControlState))sm_titleColorWithState{
    return ^UIButton *(UIColor *color,UIControlState state){
        [self setTitleColor:color forState:state];
        return self;
    };
}

- (UIButton *(^)(CGRect))sm_frame{
    return ^UIButton *(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UIButton *(^)(CGSize))sm_size{
    return ^UIButton *(CGSize size){
        CGRect frame = self.frame;
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, size.width, size.height);
        return self;
    };
}

- (UIButton *(^)(CGPoint))sm_origin{
    return ^UIButton *(CGPoint origin){
        CGRect frame = self.frame;
        self.frame = CGRectMake(origin.x, origin.y, frame.size.width, frame.size.height);
        return self;
    };
}

- (UIButton *(^)(CGPoint))sm_center{
    return ^UIButton *(CGPoint center){
        self.center = center;
        return self;
    };
}

- (UIButton *(^)(UIColor *))sm_backgroundColor{
    return ^UIButton *(UIColor *backgroundColor){
        self.backgroundColor = backgroundColor;
        return self;
    };
}

- (UIButton *(^)())sm_addTargetAction{
    return ^UIButton *(id target, SEL sel, UIControlEvents event){
        [self addTarget:target action:sel forControlEvents:event];
        return self;
    };
}

- (UIButton *(^)())sm_removeTargetAction{
    return ^UIButton *(id target, SEL sel, UIControlEvents event){
        [self removeTarget:target action:sel forControlEvents:event];
        return self;
    };

}

+ (UIButton*)sm_makeButton:(void (^)(UIButton*))block{
    UIButton*btn = [[UIButton alloc] init];
    SM_SAFE_BLOCK(block,btn);
    return btn;
}


@end

@implementation UILabel (Function)

- (UILabel *(^)(CGRect))sm_frame{
    return ^UILabel *(CGRect rect){
        self.frame = rect;
        return self;
    };
}

- (UILabel *(^)(CGSize))sm_size{
    return ^UILabel *(CGSize size){
        CGRect frame = self.frame;
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, size.width, size.height);
        return self;
    };
}

- (UILabel *(^)(CGPoint))sm_origin{
    return ^UILabel *(CGPoint origin){
        CGRect frame = self.frame;
        self.frame = CGRectMake(origin.x, origin.y, frame.size.width, frame.size.height);
        return self;
    };
}

- (UILabel *(^)(CGPoint))sm_center{
    return ^UILabel *(CGPoint center){
        self.center = center;
        return self;
    };
}

- (UILabel *(^)(NSString *))sm_text{
    return ^UILabel*(NSString *text){
        [self setText:text];
        return self;
    };

}

- (UILabel *(^)(CGFloat))sm_fontSize{
    return ^UILabel *(CGFloat fontSize){
        self.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}

- (UILabel *(^)(UIColor *))sm_textColor{
    return ^UILabel *(UIColor *color){
        self.textColor = color;
        return self;
    };
}

- (UILabel *(^)(UIColor *))sm_backgroundColor{
    return ^UILabel *(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

- (UILabel *(^)(UIColor *))sm_shadowColor{
    return ^UILabel *(UIColor *color){
        self.shadowColor = color;
        return self;
    };
}

- (UILabel *(^)(NSTextAlignment))sm_textAlignment{
    return ^UILabel *(NSTextAlignment alignment){
        self.textAlignment = alignment;
        return self;
    };
}

- (UILabel *(^)(BOOL))sm_userInteractionEnabled{
    return ^UILabel *(BOOL userInteractionEnabled){
        self.userInteractionEnabled = userInteractionEnabled;
        return self;
    };
}

- (UILabel *(^)(NSAttributedString *))sm_attributedText{
    return ^UILabel *(NSAttributedString *attributedString){
        self.attributedText = attributedString;
        return self;
    };
}

- (UILabel *(^)(NSInteger))sm_numberOfLines{
    return ^UILabel *(NSInteger numberOfLines){
        self.numberOfLines = numberOfLines;
        return self;
    };
}

+ (UILabel *)sm_makeLabel:(void(^)(UILabel *label))block{
    UILabel *label = [[UILabel alloc] init];
    SM_SAFE_BLOCK(block,label);
    return label;
}

@end

@implementation UIImageView (Function)

- (UIImageView *(^)(CGRect))sm_frame{
    return ^UIImageView *(CGRect rect){
        self.frame = rect;
        return self;
    };
}

- (UIImageView *(^)(CGSize))sm_size{
    return ^UIImageView *(CGSize size){
        CGRect frame = self.frame;
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, size.width, size.height);
        return self;
    };
}

- (UIImageView *(^)(CGPoint))sm_origin{
    return ^UIImageView *(CGPoint origin){
        CGRect frame = self.frame;
        self.frame = CGRectMake(origin.x, origin.y, frame.size.width, frame.size.height);
        return self;
    };
}

- (UIImageView *(^)(CGPoint))sm_center{
    return ^UIImageView *(CGPoint center){
        self.center = center;
        return self;
    };
}

- (UIImageView *(^)(NSString *))sm_imageName{
    return ^UIImageView *(NSString *imageName){
        self.image = [UIImage imageNamed:imageName];
        return self;
    };
}

- (UIImageView *(^)(NSString *))sm_highlightedImageName{
    return ^UIImageView *(NSString *higthlightedImageName){
        self.highlightedImage = [UIImage imageNamed:higthlightedImageName];
        return self;
    };
}

- (UIImageView *(^)(BOOL))sm_highlighted{
    return ^UIImageView *(BOOL hightlighted){
        self.highlighted = hightlighted;
        return self;
    };
}

- (UIImageView *(^)(NSTimeInterval))sm_animationDuration{
    return ^UIImageView *(NSTimeInterval timeIntveral){
        self.animationDuration = timeIntveral;
        return self;
    };
}

- (UIImageView *(^)(NSInteger))sm_animationRepeatCount{
    return ^UIImageView *(NSInteger animationRepeatCount){
        self.animationRepeatCount = animationRepeatCount;
        return self;
    };
}

- (UIImageView *(^)(NSArray *))sm_animationImages{
    return ^UIImageView *(NSArray *images){
        self.animationImages = images;
        return self;
    };
}

- (UIImageView *(^)(NSArray *))sm_highlightedAnimationImages{
    return ^UIImageView *(NSArray *images){
        self.highlightedAnimationImages = images;
        return self;
    };
}

- (UIImageView *(^)())sm_startAnimating{
    return ^UIImageView *(){
        [self startAnimating];
        return self;
    };
}

- (UIImageView *(^)())sm_stopAnimating{
    return ^UIImageView *(){
        [self stopAnimating];
        return self;
    };
}

+ (UIImageView *)sm_makeImageView:(void(^)(UIImageView *imageView))block{
    UIImageView *imageView = [[UIImageView alloc] init];
    SM_SAFE_BLOCK(block,imageView);
    return imageView;
}

@end

@implementation UITextField (Function)

- (UITextField *(^)(CGRect))sm_frame{
    return ^UITextField *(CGRect rect){
        self.frame = rect;
        return self;
    };
}

- (UITextField *(^)(CGSize))sm_size{
    return ^UITextField *(CGSize size){
        CGRect frame = self.frame;
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, size.width, size.height);
        return self;
    };
}

- (UITextField *(^)(CGPoint))sm_origin{
    return ^UITextField *(CGPoint origin){
        CGRect frame = self.frame;
        self.frame = CGRectMake(origin.x, origin.y, frame.size.width, frame.size.height);
        return self;
    };
}

- (UITextField *(^)(CGPoint))sm_center{
    return ^UITextField *(CGPoint center){
        self.center = center;
        return self;
    };
}

- (UITextField *(^)(UIColor *))sm_backgroundColor{
    return ^UITextField *(UIColor *backgroundColor){
        self.backgroundColor = backgroundColor;
        return self;
    };
}

- (UITextField *(^)(NSString *))sm_text{
    return ^UITextField *(NSString *text){
        self.text = text;
        return self;
    };
}

- (UITextField *(^)(NSAttributedString *))sm_attributedText{
    return ^UITextField *(NSAttributedString *attributedText){
        self.attributedText = attributedText;
        return self;
    };
}

- (UITextField *(^)(UIColor *))sm_textColor{
    return ^UITextField *(UIColor *textColor){
        self.textColor = textColor;
        return self;
    };
}

- (UITextField *(^)(CGFloat))sm_fontSize{
    return ^UITextField *(CGFloat fontSize){
        self.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}

- (UITextField *(^)(NSTextAlignment))sm_textAlignment{
    return ^UITextField *(NSTextAlignment textAlignment){
        self.textAlignment = textAlignment;
        return self;
    };
}

- (UITextField *(^)(UITextBorderStyle))sm_borderStyle{
    return ^UITextField *(UITextBorderStyle borderStyle){
        self.borderStyle = borderStyle;
        return self;
    };
}

- (UITextField *(^)(NSString *))sm_placeholder{
    return ^UITextField *(NSString *placeholder){
        self.placeholder = placeholder;
        return self;
    };
}

- (UITextField *(^)(NSAttributedString *))sm_attributedPlaceholder{
    return ^UITextField *(NSAttributedString *attributedPlaceholder){
        self.attributedPlaceholder = attributedPlaceholder;
        return self;
    };
}

- (UITextField *(^)(BOOL))sm_clearsOnBeginEditing{
    return ^UITextField *(BOOL clearsOnBeginEditing){
        self.clearsOnBeginEditing = clearsOnBeginEditing;
        return self;
    };
}

- (UITextField *(^)(BOOL))sm_adjustsFontSizeToFitWidth{
    return ^UITextField *(BOOL adjustsFontSizeToFitWidth){
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
        return self;
    };
}

- (UITextField *(^)(CGFloat))sm_minimumFontSize{
    return ^UITextField *(CGFloat minimumFontSize){
        self.minimumFontSize = minimumFontSize;
        return self;
    };
}


- (UITextField *(^)(id<UITextFieldDelegate>))sm_delegate{
    return ^UITextField *(id<UITextFieldDelegate> delegate){
        self.delegate = delegate;
        return self;
    };
}

- (UITextField *(^)(UIImage *))sm_background{
    return ^UITextField *(UIImage *background){
        self.background = background;
        return self;
    };
}

- (UITextField *(^)(UIImage *))sm_disabledBackground{
    return ^UITextField *(UIImage *disabledBackground){
        self.disabledBackground = disabledBackground;
        return self;
    };
}

- (UITextField *(^)(UITextFieldViewMode))sm_clearButtonMode{
    return ^UITextField *(UITextFieldViewMode clearButtonMode){
        self.clearButtonMode = clearButtonMode;
        return self;
    };
}

- (UITextField *(^)(UIView *))sm_leftView{
    return ^UITextField *(UIView *leftView){
        self.leftView = leftView;
        return self;
    };
}

- (UITextField *(^)(UITextFieldViewMode))sm_leftViewMode{
    return ^UITextField *(UITextFieldViewMode leftViewMode){
        self.leftViewMode = leftViewMode;
        return self;
    };
}

- (UITextField *(^)(UIView *))sm_rightView{
    return ^UITextField *(UIView *rightView){
        self.rightView = rightView;
        return self;
    };
}

- (UITextField *(^)(UITextFieldViewMode))sm_rightViewMode{
    return ^UITextField *(UITextFieldViewMode rightViewMode){
        self.rightViewMode = rightViewMode;
        return self;
    };
}

- (UITextField *(^)(CGRect))sm_drawTextInRect{
    return ^UITextField *(CGRect rect){
        [self drawTextInRect:rect];
        return self;
    };
}

- (UITextField *(^)(CGRect))sm_drawPlaceholderInRect{
    return ^UITextField *(CGRect rect){
        [self drawPlaceholderInRect:rect];
        return self;
    };
}

- (UITextField *(^)())sm_addTargetAction{
    return ^UITextField *(id target, SEL sel, UIControlEvents event){
        [self addTarget:target action:sel forControlEvents:event];
        return self;
    };
}

- (UITextField *(^)())sm_removeTargetAction{
    return ^UITextField *(id target, SEL sel, UIControlEvents event){
        [self removeTarget:target action:sel forControlEvents:event];
        return self;
    };
}

+ (UITextField *)sm_makeTextField:(void (^)(UITextField *))block{
    UITextField *textField = UITextField.new;
    SM_SAFE_BLOCK(block,textField);
    return textField;
}

@end

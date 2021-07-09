//
//  UITextField+Category.m
//  fenleiCate
//
//  Created by huhuhu on 2021/7/7.
//

#import "UITextField+Category.h"
#import "ColorTool.h"
@implementation UITextField (Category)


+ (instancetype)creatTextFieldWithFrame:(CGRect)frame
                          placeholder:(NSString *)placeholder
                                 font:(CGFloat)font
                            textColor:(UIColor *)textColor
                                  tag:(NSInteger)tag {
    
    UITextField *textField = [[UITextField alloc]init];
    textField.clearsOnBeginEditing  = NO;
    if (!CGRectIsNull(frame))textField.frame             = frame;
    if (placeholder)    textField.placeholder       = placeholder;
    if (font)           textField.font              = FontNoR(font);
    if (textColor)      textField.textColor         = textColor;
    if (textField)      textField.borderStyle       = UITextBorderStyleNone;
    if (tag)            textField.tag               = tag;
    textField.clearButtonMode=UITextFieldViewModeWhileEditing;
    
    return textField;
}

+ (instancetype)creatTextFieldWithFrame:(CGRect)frame
                          placeholder:(NSString *)placeholder
                                 font:(CGFloat)font
                            textColor:(UIColor *)textColor
                        keyboardType:(UIKeyboardType)keyboardType
                      secureTextEntry:(BOOL)secureTextEntry
                                  tag:(NSInteger)tag {
    
    UITextField *textField = [self creatTextFieldWithFrame:frame
                                             placeholder:placeholder
                                                    font:font
                                               textColor:textColor
                                                     tag:tag];
    
    textField.keyboardType = keyboardType;
    textField.secureTextEntry = secureTextEntry;
    
    textField.clearButtonMode=UITextFieldViewModeWhileEditing;
    
    return textField;
}

+ (instancetype)creatTextFieldWithFrame:(CGRect)frame
                      backgroundColor:(UIColor *)backgroundColor
                          placeholder:(NSString *)placeholder
                                 font:(CGFloat)font
                            textColor:(UIColor *)textColor
                          borderStyle:(UITextBorderStyle)borderStyle
                                  tag:(NSInteger)tag {

    UITextField *textField = [self creatTextFieldWithFrame:frame
                                             placeholder:placeholder
                                                    font:font
                                               textColor:textColor
                                                     tag:tag];
    
    if (backgroundColor) textField.backgroundColor = backgroundColor;
    textField.borderStyle = borderStyle;
    
    textField.clearButtonMode=UITextFieldViewModeWhileEditing;
    
    return textField;
}


#define Can_SETUI(x,y)                   \
self;                       \
return ^(x) {                   \
y;                              \
return self;                \
}

- (CanTextFieldFrame)can_frame {
    Can_SETUI(CGRect frame, self.frame = frame);
}

- (CanTextFieldBackGroundColor)can_backGroundColor {
    Can_SETUI(UIColor *color, self.backgroundColor = color);
}

- (CanTextFieldTag)can_tag {
    Can_SETUI(NSInteger tag, self.tag = tag);
}

- (CanTextFieldPlaceholder)can_placeholder {
    Can_SETUI(NSString * placeholder, self.placeholder = placeholder);
}

- (CanTextFieldFont)can_font {
    Can_SETUI(CGFloat font, self.font = [UIFont systemFontOfSize:font]);
}

- (CanTextFieldTextColor)can_textColor {
    Can_SETUI(UIColor *color, self.textColor = color);
}

- (CanTextFieldBorderStyle)can_borderStyle {
    Can_SETUI(UITextBorderStyle borderStyle, self.borderStyle = borderStyle);
}

- (CanTextFieldKeyboardType)can_keyboardType {
    Can_SETUI(UIKeyboardType keyboardType, self.keyboardType = keyboardType);
}

- (CanTextSecureTextEntry)can_secureTextEntry {
    Can_SETUI(BOOL secureTextEntry, self.secureTextEntry = secureTextEntry);
}

- (CanTextFieldLeftImage)can_leftImage {
    Can_SETUI(UIImage * image,
             UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 32, 18)];
             UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(12, 0, 18, 18)];
             iv.image = image;
             [backView addSubview:iv];
             self.leftView = backView;
             self.leftViewMode = UITextFieldViewModeAlways);
}

- (CanTextFieldBorderColor)can_borderColor {
    Can_SETUI(UIColor *borderColor, self.layer.borderColor = borderColor.CGColor);
}

- (CanTextFieldBorderWidth)can_borderWidth {
    Can_SETUI(CGFloat borderWidth, self.layer.borderWidth = borderWidth);
}

- (CanTextFieldLeftView)can_leftView {
    Can_SETUI(NSString *str,
              UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 16, 18)];
              UILabel *paddingView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 10, 25)];
              paddingView.text = @" ";
              paddingView.textColor = [UIColor darkGrayColor];
              paddingView.backgroundColor = [UIColor clearColor];
              [backView addSubview:paddingView];
              self.leftView = backView;
              self.leftViewMode = UITextFieldViewModeAlways;
    );
}


@end

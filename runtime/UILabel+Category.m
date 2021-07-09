//
//  UILabel+Category.m
//  fenleiCate
//
//  Created by huhuhu on 2021/7/7.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)

+ (instancetype)creatLabelWithFrame:(CGRect)frame
                             font:(UIFont *)font
                        textColor:(UIColor *)textColor {
    return [self creatLabelWithFrame:frame
                              font:font
                         textColor:textColor
                     textAlignment:NSTextAlignmentLeft];
}
+ (instancetype)creatLabelWithFrame:(CGRect)frame
                             font:(UIFont *)font
                        textColor:(UIColor *)textColor
                    textAlignment:(NSTextAlignment)textAlignment {
    return [self creatLabelWithFrame:frame
                              font:font
                         textColor:textColor
                     textAlignment:textAlignment
                       borderWidth:0
                       borderColor:nil
                      cornerRadius:0];
}

+ (instancetype)creatLabelWithFrame:(CGRect)frame
                             font:(UIFont *)font
                        textColor:(UIColor *)textColor
                    textAlignment:(NSTextAlignment)textAlignment
                      borderWidth:(CGFloat)borderWidth
                      borderColor:(UIColor *)borderColor
                     cornerRadius:(CGFloat)cornerRadius {
    
    UILabel *label = [[self alloc] init];
    label.backgroundColor = [UIColor clearColor];
    if (!CGRectIsNull(frame))label.frame             = frame;
    if (font) label.font = font;
    if (textColor) label.textColor = textColor;
    if (borderWidth) label.layer.borderWidth = borderWidth;
    if (borderColor) label.layer.borderColor = borderColor.CGColor;
    if (cornerRadius) {
        label.clipsToBounds = YES;
        label.layer.cornerRadius = cornerRadius;
    }
//    label.numberOfLines = 0;
    label.textAlignment = textAlignment;
    return label;
}

#define CAN_SETUI(x,y)\
self;\
return ^(x) {\
y;\
return self;\
}

- (CanLabelFrame)can_frame {
    CAN_SETUI(CGRect frame, self.frame = frame);
}

- (CanLabelBackGroundColor)can_backGroundColor {
    CAN_SETUI(UIColor *color, self.backgroundColor = color);
}

- (CanLabelTag)can_tag {
    CAN_SETUI(NSInteger tag, self.tag = tag);
}

- (CanLabelBorderColor)can_borderColor {
    CAN_SETUI(UIColor *borderColor, self.layer.borderColor = borderColor.CGColor);
}

- (CanLabelBorderWidth)can_borderWidth {
    CAN_SETUI(CGFloat borderWidth, self.layer.borderWidth = borderWidth);
}

- (CanLabelCornerRadius)can_cornerRadius {
    CAN_SETUI(CGFloat cornerRadius, self.clipsToBounds = YES; self.layer.cornerRadius = cornerRadius);
}

- (CanLabelFont)can_font {
    return ^(CGFloat font , BOOL bold) {
        if (bold) self.font = [UIFont boldSystemFontOfSize:font];
        else self.font = [UIFont systemFontOfSize:font];
        return self;
    };
}

- (CanLabelText)can_text {
    CAN_SETUI(NSString *text, self.text = text);
}

- (CanLabelTextColor)can_textColor {
    CAN_SETUI(UIColor *color, self.textColor = color);
}

- (CanLabelTextAlignment)can_textAlignment {
    CAN_SETUI(NSTextAlignment index, self.textAlignment = index);
}

- (CanLabelNumberOfLines)can_numberOfLines {
    CAN_SETUI(NSInteger num, self.numberOfLines = num);
}

- (CanLabelLineBreakMode)can_linebreakMode {
    CAN_SETUI(NSLineBreakMode index, self.lineBreakMode = index);
}


+(void)setAttributeFontSize:(CGFloat)fontSize
                      Color:(UIColor *)color
           attributedString:(NSMutableAttributedString *)attributedString
                     string:(NSString *)string
              rangeOfString:(NSString *)str{
    
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:[string rangeOfString:str]];
    [attributedString addAttribute:NSForegroundColorAttributeName value:color range:[string rangeOfString:str]];
    
}

+(void)setAttributeLineSpacing:(CGFloat)lineSpacing
              paragraphSpacing:(CGFloat)paragraphSpacing
              attributedString:(NSMutableAttributedString *)attributedString
                        string:(NSString *)string
                 rangeOfString:(NSString *)str{
    
    NSMutableParagraphStyle *paragraphTitle = [[NSMutableParagraphStyle alloc] init];
    if (lineSpacing) {
        paragraphTitle.lineSpacing = lineSpacing;
    }
    if (paragraphSpacing) {
        paragraphTitle.paragraphSpacing = paragraphSpacing;
    }
    paragraphTitle.alignment = NSTextAlignmentJustified;
    
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphTitle range:[string rangeOfString:str]];
    
}

/** 设置选定字符颜色 */
+(NSMutableAttributedString*)changeSelectedStringColorWithOriginalString:(NSString*)originalString andSelectedString:(NSString*)selectedString andWantedColor:(UIColor*)WantSetColor andWantedFontSize:(CGFloat)wantedFontSize{
    NSMutableAttributedString *contentStr = [[NSMutableAttributedString alloc]initWithString:originalString];
    //找出特定字符在整个字符串中的位置
    NSRange redRange = NSMakeRange([[contentStr string] rangeOfString:selectedString].location, [[contentStr string] rangeOfString:selectedString].length);
    //修改特定字符的颜色
    [contentStr addAttribute:NSForegroundColorAttributeName value:WantSetColor range:redRange];
    //修改特定字符的字体大小
    [contentStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:wantedFontSize] range:redRange];
    
    return contentStr;
}

/** 设置 行间距 */
+(NSAttributedString*)setLineSpacingWithText:(NSString*)text andLineSpacingValue:(CGFloat)value{
    
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    
    paragraphStyle.lineSpacing = value;
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    
    [attributes setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
    
    NSAttributedString*attributedString=[[NSAttributedString alloc]initWithString:text attributes:attributes];
    
    return attributedString;
    
}

/** 设置 下划线 */
+(void)setUnderLineWithLabel:(UILabel*)label{
    // 下划线
    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:label.text attributes:attribtDic];
    
    //赋值
    label.attributedText = attribtStr;
}

@end

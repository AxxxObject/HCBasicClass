//
//  UILabel+Category.h
//  fenleiCate
//
//  Created by huhuhu on 2021/7/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Category)

/** 默认UILabel */
+ (instancetype)creatLabelWithFrame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)textColor;


/** 默认UILabel+对齐方式 */
+ (instancetype)creatLabelWithFrame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment;


/** 默认UILabel+对齐方式+边框 */
+ (instancetype)creatLabelWithFrame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius;

typedef UILabel *(^CanLabelFrame)(CGRect frame);
typedef UILabel *(^CanLabelBackGroundColor)(UIColor *color);
typedef UILabel *(^CanLabelTag)(NSInteger tag);
typedef UILabel *(^CanLabelBorderWidth)(CGFloat borderWidth);
typedef UILabel *(^CanLabelBorderColor)(UIColor *borderColor);
typedef UILabel *(^CanLabelCornerRadius)(CGFloat radius);
typedef UILabel *(^CanLabelFont)(CGFloat font , BOOL bold);
typedef UILabel *(^CanLabelText)(NSString *text);
typedef UILabel *(^CanLabelTextColor)(UIColor *color);
typedef UILabel *(^CanLabelTextAlignment)(NSTextAlignment index);
typedef UILabel *(^CanLabelNumberOfLines)(NSInteger num);
typedef UILabel *(^CanLabelLineBreakMode)(NSLineBreakMode index);

/** 位置大小 */
@property (nonatomic, copy , readonly)CanLabelFrame can_frame;
/** 背景颜色 */
@property (nonatomic, copy , readonly)CanLabelBackGroundColor can_backGroundColor;
/** 标识 */
@property (nonatomic, copy , readonly)CanLabelTag can_tag;
/** 边框宽度 */
@property (nonatomic, copy , readonly)CanLabelBorderWidth can_borderWidth;
/** 边框颜色 */
@property (nonatomic, copy , readonly)CanLabelBorderColor can_borderColor;
/** 设置圆角 */
@property (nonatomic, copy , readonly)CanLabelCornerRadius can_cornerRadius;
/** 字体大小 是否加粗*/
@property (nonatomic, copy , readonly)CanLabelFont can_font;
/** 文字内容 */
@property (nonatomic, copy , readonly)CanLabelText can_text;
/** 字体颜色 */
@property (nonatomic, copy , readonly)CanLabelTextColor can_textColor;
/** 对齐方式 */
@property (nonatomic, copy , readonly)CanLabelTextAlignment can_textAlignment;
/** 显示行数 */
@property (nonatomic, copy , readonly)CanLabelNumberOfLines can_numberOfLines;
/** 省略方式 */
@property (nonatomic, copy , readonly)CanLabelLineBreakMode can_linebreakMode;


/** 设置富文本字体颜色 */
+ (void)setAttributeFontSize:(CGFloat)fontSize
                       Color:(UIColor*)color
            attributedString:(NSMutableAttributedString*)attributedString
                      string:(NSString *)string
               rangeOfString:(NSString *)str;

/** 设置富文本字体行距和段距 **/
+ (void)setAttributeLineSpacing:(CGFloat)lineSpacing
               paragraphSpacing:(CGFloat)paragraphSpacing
               attributedString:(NSMutableAttributedString*)attributedString
                         string:(NSString *)string
                  rangeOfString:(NSString *)str;

/** 设置选定字符颜色 */
+(NSMutableAttributedString*)changeSelectedStringColorWithOriginalString:(NSString*)originalString andSelectedString:(NSString*)selectedString andWantedColor:(UIColor*)WantSetColor andWantedFontSize:(CGFloat)wantedFontSize;

/** 设置 行间距 */
+(NSAttributedString*)setLineSpacingWithText:(NSString*)text andLineSpacingValue:(CGFloat)value;

/** 设置 下划线 */
+(void)setUnderLineWithLabel:(UILabel*)label;

@end

NS_ASSUME_NONNULL_END

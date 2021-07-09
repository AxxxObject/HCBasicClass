//
//  UITextField+Category.h
//  fenleiCate
//
//  Created by huhuhu on 2021/7/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Category)
/** 默认textField */
+ (instancetype)creatTextFieldWithFrame:(CGRect)frame
                          placeholder:(NSString *)placeholder
                                 font:(CGFloat)font
                            textColor:(UIColor *)textColor
                                  tag:(NSInteger)tag;

/** 默认textField + 风格设置 + 背景颜色 */
+ (instancetype)creatTextFieldWithFrame:(CGRect)frame
                      backgroundColor:(UIColor *)backgroundColor
                          placeholder:(NSString *)placeholder
                                 font:(CGFloat)font
                            textColor:(UIColor *)textColor
                          borderStyle:(UITextBorderStyle)borderStyle
                                  tag:(NSInteger)tag;

/** 默认textField + 键盘样式 + 是否隐藏输入 */
+ (instancetype)creatTextFieldWithFrame:(CGRect)frame
                          placeholder:(NSString *)placeholder
                                 font:(CGFloat)font
                            textColor:(UIColor *)textColor
                         keyboardType:(UIKeyboardType)keyboardType
                      secureTextEntry:(BOOL)secureTextEntry
                                  tag:(NSInteger)tag;

typedef UITextField * (^CanTextFieldFrame)               (CGRect             frame);
typedef UITextField * (^CanTextFieldBackGroundColor)     (UIColor    *       color);
typedef UITextField * (^CanTextFieldTag)                 (NSInteger          tag);
typedef UITextField * (^CanTextFieldPlaceholder)         (NSString   *       placeholder);
typedef UITextField * (^CanTextFieldFont)                (CGFloat            font);
typedef UITextField * (^CanTextFieldTextColor)           (UIColor    *       color);
typedef UITextField * (^CanTextFieldBorderStyle)         (UITextBorderStyle  borderStyle);
typedef UITextField * (^CanTextFieldKeyboardType)        (UIKeyboardType     keyboardType);
typedef UITextField * (^CanTextSecureTextEntry)          (BOOL               secureTextEntry);
typedef UITextField * (^CanTextFieldLeftImage)           (UIImage    *       image);
typedef UITextField *(^CanTextFieldBorderWidth)(CGFloat borderWidth);
typedef UITextField *(^CanTextFieldBorderColor)(UIColor *borderColor);
typedef UITextField *(^CanTextFieldLeftView)(NSString *str);
/** 位置大小 */
@property (nonatomic, copy , readonly)CanTextFieldFrame can_frame;
/** 背景颜色 */
@property (nonatomic, copy , readonly)CanTextFieldBackGroundColor can_backGroundColor;
/** 标识 */
@property (nonatomic, copy , readonly)CanTextFieldTag can_tag;
/** 占位文字 */
@property (nonatomic, copy , readonly)CanTextFieldPlaceholder can_placeholder;
/** 字体大小 */
@property (nonatomic, copy , readonly)CanTextFieldFont can_font;
/** 字体颜色 */
@property (nonatomic, copy , readonly)CanTextFieldTextColor can_textColor;
/** 风格设置 */
@property (nonatomic, copy , readonly)CanTextFieldBorderStyle can_borderStyle;
/** 键盘样式 */
@property (nonatomic, copy , readonly)CanTextFieldKeyboardType can_keyboardType;
/** 是否隐藏输入 */
@property (nonatomic, copy , readonly)CanTextSecureTextEntry can_secureTextEntry;
///** 添加左边图标 */
@property (nonatomic ,copy , readonly)CanTextFieldLeftImage can_leftImage;
///** 添加宽度 */
@property (nonatomic ,copy , readonly)CanTextFieldBorderWidth can_borderWidth;
///** 边框颜色 */
@property (nonatomic ,copy , readonly)CanTextFieldBorderColor can_borderColor;
///** 文字左边留点间隙     传个空串就行了*/
@property (nonatomic ,copy , readonly)CanTextFieldLeftView can_leftView;
@end

NS_ASSUME_NONNULL_END

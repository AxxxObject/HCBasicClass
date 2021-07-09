

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSMutableAttributedString (Category)

/**
 * 富文本作色等操作
 *  @param str   字符串
 *  @param font   大小
 *  @param color   颜色
 *  @param rang   位置
 *  @return 富文本  数据
 */
+(NSMutableAttributedString *)attbutString:(NSString *)str value:(CGFloat)font color:(UIColor *)color rang:(NSRange)rang;

/**
 * 查看字符串中是否有超链接
 *  @param string   字符串
 *  @return 富文本  数据
 */
+ (NSMutableAttributedString *)urlValidationURL:(NSString *)string;

/**
 * 查看字符串中是否有超链接
 *  @param width   最大宽度
 *  @param text   字符串
 *  @param font   字体大小
 *  @param l_spacing   行间距
 *  @return 富文本  数据
 */
+ (CGSize)sizeLabelWidth:(CGFloat)width text:(NSString *)text font:(UIFont *)font lineSpacing:(CGFloat)l_spacing;

/**
 *字符串转富文本
 *@param string   需要的字符串
 *@param width    距离左右2边的总距离   左边距+右边距
 *@return 富文本  数据
 */
+(NSAttributedString *)attributedString:(NSString *)string space:(NSInteger)width;
+(NSString *)attriToStrWithAttri:(NSAttributedString *)attri;

/**
 *在富文本中插入一张图片
 *@param img       图片
 *@param rect      位置大小  稍微调整下
 *@param att       传入的一个富文本
 *@param index     插入的下标
 *@return 富文本  数据
 */
+(NSMutableAttributedString *)insertImg:(UIImage *)img rect:(CGRect)rect :(NSMutableAttributedString *)att insertIndex:(NSInteger)index;

/**
 *  设置富文本的行间距
 *  @param text   字符串
 *  @param lineSpacing   间距
 *  @return 新的图片
 */
+(NSAttributedString *)setText:(NSString *)text LineSpacing:(CGFloat)lineSpacing;

/**
 *改变字符串 指定位置的颜色
 *@param font  设置大小
 *@param range  设置 下标
 *@param vaColor 设置字体颜色
 *@return 富文本  数据
 */
+(NSAttributedString *)setText:(NSString *)str FontNumber:(CGFloat)font AndRange:(NSRange)range AndColor:(UIColor *)vaColor;


/**
 *  设置部分文本颜色
 *  @param color 字体颜色
 *  @param str 文本
 *  @param subStringArr 需要改变颜色的文本
 */
+ (NSMutableAttributedString *)changeTextColorWithColor:(UIColor *)color string:(NSString *)str andSubString:(NSArray *)subStringArr;

+ (NSMutableArray *)getRangeWithTotalString:(NSString * __nullable)totalString SubString:(NSString * __nullable)subString;
@end

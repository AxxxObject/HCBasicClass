

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface UIColor (Category)

/**
 *  根据当前的字符串返回颜色值
 *  @param hexColor 颜色字符串
 *  @return 返回数组的颜色
 */
+(UIColor *_Nullable)getColor:(NSString *_Nullable)hexColor;
+(int)stringToInt:(NSString *_Nonnull)string;

/**
 *  将UIColor转换为RGB值
 *  @param color  需要传入的颜色
 *  @return 返回数组的颜色
 */
+ (NSMutableArray *_Nullable) changeUIColorToRGB:(UIColor *_Nullable)color;

/**
 *  点击图片获取触摸的颜色值
 *  @param point   触摸点
 *  @param image   触摸的图片
 *  @return 返回颜色
 */
+ (UIColor *_Nullable)colorAtPixel:(CGPoint)point image:(UIImageView *_Nullable)image;

/*
 * 设置颜色渐变效果
 * frame        需要填充的位置
 * startColor   开始颜色
 * endColor     结束颜色
 * startPoint   开始位置  左上角为（0，0）  右下角为（1，1）
 * endPoint     结束位置
 */
+(CAGradientLayer *_Nullable)choseFullframe:(CGRect)frame startColor:(UIColor *_Nullable)startColor endColor:(UIColor *_Nullable)endColor startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;


@end

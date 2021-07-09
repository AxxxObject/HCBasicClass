

#import <UIKit/UIKit.h>

@interface UIImage (Category)

/**
 *  图片压缩
 *  @param img   现在的图片
 *  @return NSData 新的图片
 */
+(NSData *)zipNSDataWithImage:(UIImage *)img;

/**
 *  图片压缩  压缩的大小和质量
 *  @param img   现在的图片
 *  @return 新的图片
 */
+(UIImage *)zipImageData:(UIImage *)img;

/**
 *  压缩gif图
 *  @param data   二进制图片
 *  @return NSData
 */
+ (NSData *)zipGIFWithData:(NSData *)data;

/**
 *  二维码生成(Erica Sadun 原生代码生成)
 *  @param string   内容字符串
 *  @param size 二维码大小
 *  @param color 二维码颜色
 *  @param backGroundColor 背景颜色
 *  @return 返回一张图片
 */
+ (UIImage *)qrImageWithString:(NSString *)string size:(CGSize)size color:(UIColor *)color backGroundColor:(UIColor *)backGroundColor;

/**
 *  二维码生成(Erica Sadun 原生代码生成)
 *  @param string   内容字符串
 *  @param size 二维码大小
 *  @param color 二维码颜色
 *  @param backGroundColor 背景颜色
 *  @param imageCode 中间图
 *  @param imageSize 中间图大小
 *  @return 返回一张图片
 */
+ (UIImage *)qrImageWithString:(NSString *)string size:(CGSize)size color:(UIColor *)color backGroundColor:(UIColor *)backGroundColor imageCode:(UIImage *)imageCode imageSize:(CGFloat)imageSize;

/**
 *  条形码生成(Third party)
 *  @param code   内容字符串
 *  @param size  条形码大小
 *  @param color 条形码颜色
 *  @param backGroundColor 背景颜色
 *
 *  @return 返回一张图片
 */
+ (UIImage *)generateBarCode:(NSString *)code size:(CGSize)size color:(UIColor *)color backGroundColor:(UIColor *)backGroundColor;

/*
 * 返回图片的等比例大小，做适应
 * @param  size     是以哪个的大小来决定
 * @param  space    隔这个视图的两边边距多少
 */
+(CGSize)scoalImage:(NSString *)imageName size:(CGSize)size space:(CGFloat)space;

/*
 * 改变图片的颜色
 * @param  img     需要改变的图片
 * @param  color   需要添加的颜色
 * @return image   新的图片
 */
+ (UIImage *)ImageChange:(UIImage *)img withColor:(UIColor *)color;

/*
 * view转成image
 * @param  view   转换的view
 * @return size   转成的图片大小
 */
+(UIImage *)makeImageWithView:(UIView *)view withSize:(CGSize)size;

+ (UIImage *)zx_resizeImage:(UIImage *)image newSize:(CGSize)newSize;

- (UIImage *)zx_imageWithCornerRadius:(CGFloat)radius;
@end

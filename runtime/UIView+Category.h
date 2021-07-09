
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//设置阴影
typedef NS_ENUM(NSInteger , LeShadowPathType) {
    LeShadowPathTop    = 1,
    LeShadowPathBottom = 2,
    LeShadowPathLeft   = 3,
    LeShadowPathRight  = 4,
    LeShadowPathCommon = 5,
    LeShadowPathAround = 6,
};

@interface UIView (Category)

//获取view的X
@property (nonatomic) CGFloat left;
//获取view的Y
@property (nonatomic) CGFloat top1;
//获取view的X轴+view的宽度
@property (nonatomic) CGFloat right;
//获取view的Y轴+view的高度
@property (nonatomic) CGFloat bottom;
//获取view的宽
@property (nonatomic) CGFloat width;
//获取view的高
@property (nonatomic) CGFloat height;
//获取view的X轴的中点
@property (nonatomic) CGFloat centerX;
//获取view的Y轴的中点
@property (nonatomic) CGFloat centerY;
//获取view的origin
@property (nonatomic) CGPoint origin;
//获取view的size
@property (nonatomic) CGSize size;

/**
 *  设置边框
 *  @param color 边框颜色
 *  @param width 边框宽度
 *  @param radius 边框圆角
 */
- (void)border:(UIColor *)color width:(CGFloat)width CornerRadius:(CGFloat)radius;

/**
 *  设置边框
 *  @param radius 边框圆角
 */
- (void)borderRoundCornerRadius:(CGFloat)radius;

/**
 *  设置某一边为圆角
 *  @param corner 圆角位置
 *  @param size 圆角大小
 */
- (CAShapeLayer *)borderRoundbyRoundingCorners:(UIRectCorner)corner Size:(CGSize)size;

/**
 *  设置阴影
 *  @param shadowColor 颜色
 *  @param shadowOpacity 偏移量
 *  @param shadowRadius 圆角大小
 *  @param shadowPathType 上下左右
 *  @param shadowPathWidth 宽度
 */
- (void)viewShadowPathWithColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowPathType:(LeShadowPathType)shadowPathType shadowPathWidth:(CGFloat)shadowPathWidth;


/**
 *  根据图片来设置毛玻璃效果
 *  @param rect  效果的大小
 *  @param img  模糊的图片
 *  @param style  类型
 */
+(UIImageView *)visualEffectView:(CGRect)rect image:(UIImage *)img blurEffectStyle:(UIBlurEffectStyle)style;

/**
 *  删除子控制器
 */
- (void)removeAllSubviews;

/**
 *  获取当前屏幕vc
 */
- (UIViewController *)viewController;


- (NSString *)httpPhotoUrl:(NSString *)httpUrl;




typedef void (^GestureActionBlock)(UIGestureRecognizer *ges);

/**
 *  单点击手势
 *  @param block 回调点击
 */
- (void)addTapGesture:(GestureActionBlock)block;

/**
 *  有次数的单击手势 tapsCount:点击次数
 *  @param block 回调点击
 */
- (void)addTapGesture:(GestureActionBlock)block numberOfTapsRequired:(NSUInteger)tapsCount;

/**
 *  长按手势
 *  @param block 回调点击
 */
- (void)addLongPressGestrue:(GestureActionBlock)block;



@end

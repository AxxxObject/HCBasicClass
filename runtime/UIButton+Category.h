//
//  UIButton+Category.h
//  fenleiCate
//
//  Created by huhuhu on 2021/7/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, WMButtonAlignmentStyle) {
  WMButtonAlignmentStyleTop, // 图片在上，文字在下
  WMButtonAlignmentStyleLeft, // 图片在左，文字在右
  WMButtonAlignmentStyleBottom, // 图片在下，文字在上
  WMButtonAlignmentStyleRight // 图片在右，文字在左
};

typedef void(^tapActionBlock)(UIButton *button);

@interface UIButton (Category)
@property (nonatomic, assign) UIEdgeInsets hitTestEdgeInsets;
/**
*  设置按钮的文字和图片的布局样式和间距
*
*  @param style 布局样式
*  @param space 文字与图片的间距
*/
- (void)setButtonImageAlignmentStyle:(WMButtonAlignmentStyle)style
                imageAndLabelSpace:(CGFloat)space;
/** 设置按钮响应区域 */
- (void)setHitTestEdgeInsets:(UIEdgeInsets)hitTestEdgeInsets;

/** 单图片按钮 */
+ (instancetype)creatButtonWithFrame:(CGRect)frame withButtonImage:(UIImage *)btnImg withClickCallBack:(tapActionBlock)block;

/** 单文字按钮 */
+ (instancetype)creatButtonWithFrame:(CGRect)frame withButtonTextColor:(UIColor *)btnColor withButtonFont:(UIFont *)btnFont withButtonTitle:(NSString *)btnTitle withClickCallBack:(tapActionBlock)block;

/** 文字加图片加对齐方式按钮 */
+ (instancetype)creatButtonWithFrame:(CGRect)frame withButtonTextColor:(UIColor *)btnColor withButtonFont:(UIFont *)btnFont withButtonTitle:(NSString *)btnTitle  withButtonImage:(UIImage *)btnImg withAlignmentStyle:(WMButtonAlignmentStyle)style withImageAndLabelSpace:(CGFloat)space withClickCallBack:(tapActionBlock)block;
@end

NS_ASSUME_NONNULL_END

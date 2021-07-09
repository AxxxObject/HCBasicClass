//
//  UITabBar+Category.h
//  fenleiCate
//
//  Created by huhuhu on 2021/7/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBar (Category)
/**
 *  显示小红点
 *  @param index 位置
 *  @param frame 位置
 */
- (void)showBadgeIndex:(NSInteger)index frame:(CGRect)frame;

/**
 *  显示小红点
 *  @param index 位置
 *  @param number 数字
 */
- (void)showBadgeOnItemIndex:(int)index WithLaebl:(NSString *)number;

/**
 *  隐藏小红点
 *  @param index 位置
 */
- (void)hideBadgeOnItemIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END

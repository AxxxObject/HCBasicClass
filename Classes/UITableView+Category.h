//
//  UITableView+Category.h
//  fenleiCate
//
//  Created by huhuhu on 2021/7/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (Category)
/**
 *  创建tableView并返回
 *
 *  @param frame  位置信息
 *  @param style  table风格
 *  @param backgroundColor  背景颜色
 *  @param delegate  代理
 *  @param isFooter  是否需要一个空白底部占位
 */
+ (instancetype)creatTableViewWithFrame:(CGRect)frame
                                  style:(UITableViewStyle)style
                        backgroundColor:(UIColor *)backgroundColor
                               delegate:(id)delegate
                           isNullFooter:(BOOL)isFooter;
@end

NS_ASSUME_NONNULL_END

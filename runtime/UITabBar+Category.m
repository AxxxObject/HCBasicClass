

#import "UITabBar+Category.h"
#define TabbarItemNums  5.0


@implementation UITabBar (Category)


- (void)showBadgeIndex:(NSInteger)index frame:(CGRect)frame{
    [self removeBadgeOnItemIndex:index];
    
    //新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = 888 + index;
    badgeView.layer.cornerRadius = 7.5;//圆形
    badgeView.backgroundColor = [UIColor redColor];//颜色：红色
    CGRect tabFrame = self.frame;
    
    //确定小红点的位置
    CGFloat percentX = (index + 0.58) / TabbarItemNums;
    badgeView.frame = frame;//圆形大小为10
    badgeView.clipsToBounds = YES;
    [self addSubview:badgeView];
}

- (void)showBadgeOnItemIndex:(int)index WithLaebl:(NSString *)number{
    //移除之前的小红点
    [self removeBadgeOnItemIndex:index];
    
    //新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = 888 + index;
    badgeView.layer.cornerRadius = 7.5;//圆形
    badgeView.backgroundColor = [UIColor redColor];//颜色：红色
    CGRect tabFrame = self.frame;
    
    //确定小红点的位置
    CGFloat percentX = (index + 0.58) / TabbarItemNums;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.03 * tabFrame.size.height);
    badgeView.frame = CGRectMake(x, y, 15, 15);//圆形大小为10
    badgeView.clipsToBounds = YES;
    [self addSubview:badgeView];

    UILabel * numberName = [[UILabel alloc]initWithFrame:CGRectMake(1, 0, 13, 13)];
    numberName.text = number;
    numberName.textAlignment = NSTextAlignmentCenter;
    [badgeView addSubview:numberName];
    numberName.adjustsFontSizeToFitWidth = YES;
    
}

//隐藏小红点
- (void)hideBadgeOnItemIndex:(NSInteger)index{
    //移除小红点
    [self removeBadgeOnItemIndex:index];
}

//移除小红点
- (void)removeBadgeOnItemIndex:(NSInteger)index{
    //按照tag值进行移除
    for (UIView *subView in self.subviews ) {
        if (subView.tag == 888+index) {
            [subView removeFromSuperview];
        }
    }
}



@end

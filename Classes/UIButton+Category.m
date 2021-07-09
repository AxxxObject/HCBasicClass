//
//  UIButton+Custom.m
//  ReallyCan
//
//  Created by 刘建军 on 2021/1/6.
//

#import "UIButton+Category.h"
#import <objc/runtime.h>

static const NSString *KEY_HIT_TEST_EDGE_INSETS = @"HitTestEdgeInsets";

@implementation UIButton (Category)
static NSString *keyCategoryMethod;//用分类方法创建的button，关联对象的key
static NSString *keyBlock;
#pragma mark - 设置按钮响应区域

- (void)setButtonImageAlignmentStyle:(WMButtonAlignmentStyle)style
                imageAndLabelSpace:(CGFloat)space {
    /**
    UIButton中titleLabel和imageView的位置依赖:
    如果只有文字(或者图片)时,titleEdgeInsets(或imageEdgeInsets)是button中titleLabel(或imageView)相对于button的上下左右的内边距;
    如果同时有titleLabel和imageView，那么imageView的上下左是相对于button，右边是相对于titleLabel的;
    titleLabel的上下右是相对于button，左边是相对于imageView的。
    */

    // 获取imageView的宽、高
    CGFloat imageWith = self.currentImage.size.width;
    CGFloat imageHeight = self.currentImage.size.height;

    // 获取titleLabel的宽、高
    //intrinsicContentSize:也就是控件的内置大小,比如UILabel,UIButton等控件,
    //他们都有自己的内置大小,控件的内置大小往往是由控件本身的内容所决定的
    CGFloat labelWidth = self.titleLabel.intrinsicContentSize.width;
    CGFloat labelHeight = self.titleLabel.intrinsicContentSize.height;

    // 初始化imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;

    // 根据参数style和space设置imageEdgeInsets和labelEdgeInsets的值
    switch (style) {
        case WMButtonAlignmentStyleTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
            break;
        case WMButtonAlignmentStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case WMButtonAlignmentStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case WMButtonAlignmentStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    // 重新设置titleEdgeInsets和imageEdgeInsets
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}


// 设置响应区域
- (void)setHitTestEdgeInsets:(UIEdgeInsets)hitTestEdgeInsets
{
    // 将hitTestEdgeInsets封装为NSValue
    NSValue *value = [NSValue value:&hitTestEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    // 将value与button通过key关联起来
    objc_setAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// 获取响应区域
- (UIEdgeInsets)hitTestEdgeInsets
{
    // 通过key获取到button关联的value（hitTestEdgeInsets）
    NSValue *value = objc_getAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS);
    if(value)
    {
        // 从value中取出hitTestEdgeInsets的值
        UIEdgeInsets edgeInsets;
        [value getValue:&edgeInsets];
        return edgeInsets;
    }
    else
    {
        return UIEdgeInsetsZero;
    }
}

// 点击区域
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if(UIEdgeInsetsEqualToEdgeInsets(self.hitTestEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden)
    {
        return [super pointInside:point withEvent:event];
    }
    
    // 响应区域存在，button存在且可以点击
    CGRect relativeFrame = self.bounds;
    // 偷偷摸摸地修改了按钮的frame
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.hitTestEdgeInsets);
    
    // 点击的是修改后的frame
    return CGRectContainsPoint(hitFrame, point);
}

+ (instancetype)creatButtonWithFrame:(CGRect)frame withButtonImage:(UIImage *)btnImg withClickCallBack:(nonnull tapActionBlock)block{

    return [self creatButtonWithFrame:frame withButtonFont:nil withButtonTextColor:nil withButtonImage:btnImg withButtonTitle:nil withClickCallBack:block];
}

+ (instancetype)creatButtonWithFrame:(CGRect)frame withButtonTextColor:(UIColor *)btnColor withButtonFont:(UIFont *)btnFont withButtonTitle:(NSString *)btnTitle withClickCallBack:(tapActionBlock)block{
    return [self creatButtonWithFrame:frame withButtonFont:btnFont withButtonTextColor:btnColor withButtonImage:nil withButtonTitle:btnTitle withClickCallBack:block];
}

+ (instancetype)creatButtonWithFrame:(CGRect)frame withButtonTextColor:(UIColor *)btnColor withButtonFont:(UIFont *)btnFont withButtonTitle:(NSString *)btnTitle  withButtonImage:(UIImage *)btnImg withAlignmentStyle:(WMButtonAlignmentStyle)style withImageAndLabelSpace:(CGFloat)space withClickCallBack:(tapActionBlock)block{
    UIButton * btn = [self creatButtonWithFrame:frame withButtonFont:btnFont withButtonTextColor:btnColor withButtonImage:btnImg withButtonTitle:btnTitle withClickCallBack:block];
    [btn setButtonImageAlignmentStyle:style imageAndLabelSpace:space];
    return btn;
}

+ (instancetype)creatButtonWithFrame:(CGRect)frame
                      withButtonFont:(UIFont *)btnFont
                 withButtonTextColor:(UIColor *)btnColor
                     withButtonImage:(UIImage *)btnImg
                     withButtonTitle:(NSString *)btnTitle
                   withClickCallBack:(nonnull tapActionBlock)block{
    
    UIButton *button = [[self alloc] init];
    button.backgroundColor = [UIColor clearColor];
    if (!CGRectIsNull(frame))button.frame             = frame;
    if (btnFont)  button.titleLabel.font = btnFont;
    if (btnColor) [button setTitleColor:btnColor forState:UIControlStateNormal];
    if (btnImg)   [button setImage:btnImg forState:UIControlStateNormal];
    if (btnTitle) [button setTitle:btnTitle forState:UIControlStateNormal];
    [button addTarget:button action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    
    /**
         *用runtime中的函数通过key关联对象
         *
         *objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy)
         *id object                     表示关联者，是一个对象，变量名理所当然也是object
         *const void *key               获取被关联者的索引key
         *id value                      被关联者，这里是一个block
         *objc_AssociationPolicy policy 关联时采用的协议，有assign，retain，copy等协议，一般使用OBJC_ASSOCIATION_RETAIN_NONATOMIC
         
         */
    objc_setAssociatedObject (button , &keyCategoryMethod , block, OBJC_ASSOCIATION_COPY_NONATOMIC );
    
    return button;
}

- (void)tapAction:(UIButton*)sender
{
    /**
     * 通过key获取被关联对象
     *objc_getAssociatedObject(id object, const void *key)
     *
     */
    tapActionBlock block = ( tapActionBlock )objc_getAssociatedObject (sender , &keyCategoryMethod );
    
    if (block) {
        
        block(sender);
        
    }
}


- (void)setActionBlock:(tapActionBlock)actionBlock
{
    objc_setAssociatedObject (self , &keyBlock , actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC );
    
}

- (tapActionBlock)actionBlock
{
    return objc_getAssociatedObject (self , &keyBlock );
}

@end

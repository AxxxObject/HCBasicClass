

#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSInteger,AnimationType){
    Fade = 1,                   //淡入淡出
    Push,                       //推挤
    Reveal,                     //揭开
    MoveIn,                     //覆盖
    Cube,                       //立方体
    SuckEffect,                 //吮吸
    OglFlip,                    //翻转
    RippleEffect,               //波纹
    PageCurl,                   //翻页
    PageUnCurl,                 //反翻页
    CameraIrisHollowOpen,       //开镜头
    CameraIrisHollowClose,      //关镜头
    CurlDown,                   //下翻页
    CurlUp,                     //上翻页
    FlipFromLeft,               //左翻转
    FlipFromRight,              //右翻转
};

@interface CAAnimation (Category)


/*
 *  在跳转之前调用
 *  [[[[UIApplication sharedApplication] keyWindow]layer]addAnimation:[CAAnimation createTransitionAnimation:RippleEffect] forKey:nil];
 *
 */

/**
 *设置转场动画
 *@param animtionType  设置方式
 *@param subtype  设置方向
 *@return  layer
 */
+(CATransition *)createTransitionAnimation:(AnimationType)animtionType subtype:(CATransitionSubtype)subtype;



@end

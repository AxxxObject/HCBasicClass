

#import "CAAnimation+Category.h"

@implementation CAAnimation (Category)


+(CATransition *)createTransitionAnimation:(AnimationType)animtionType subtype:(CATransitionSubtype)subtype
{
    NSInteger type = animtionType;
    NSString *typeStr = @"";
    switch (type) {
        case Fade:
            typeStr = kCATransitionFade;
            break;
            
        case Push:
            typeStr = kCATransitionPush;
           
            break;
            
        case Reveal:
            typeStr = kCATransitionReveal;
            break;
            
        case MoveIn:
            typeStr = kCATransitionMoveIn;
            break;
            
        case Cube:
            typeStr = @"cube";
            break;
            
        case SuckEffect:
            typeStr = @"suckEffect";
           
            break;
            
        case OglFlip:
            typeStr = @"oglFlip";
            break;
            
        case RippleEffect:
            typeStr = @"rippleEffect";
            break;
            
        case PageCurl:
            typeStr = @"pageCurl";
            break;
            
        case PageUnCurl:
            typeStr = @"pageUnCurl";
            break;
            
        case CameraIrisHollowOpen:
            typeStr = @"cameraIrisHollowOpen";
            break;
            
        case CameraIrisHollowClose:
            typeStr = @"cameraIrisHollowClose";
            break;
        default:
            break;
    }
    CATransition *animation = [CATransition animation];
    animation.type = typeStr;
    animation.subtype = subtype;
    animation.duration = 0.3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    return animation;
}

@end

//
//  DeviceTool.h
//  yb_zfj_waca
//
//  Created by 杨 on 2019/7/12.
//  Copyright © 2019 杨风波. All rights reserved.
//

#ifndef DeviceTool_h
#define DeviceTool_h

//常用对象
#define kWindow [UIApplication sharedApplication].keyWindow
#define kAppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define KFApplication [UIApplication sharedApplication]
#define KFUserDefaults [NSUserDefaults standardUserDefaults]
#define kFNotificationCenter [NSNotificationCenter defaultCenter]

//====================屏幕的宽 高 导航栏的高和tab栏的高=======================

//自适应宽高
#define adaptToW(Width) [UIScreen mainScreen].bounds.size.width * Width / 375
#define adaptToH(Height) [UIScreen mainScreen].bounds.size.height * Height / 667

// 屏幕宽高
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREENH_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

//适配iphonex的tabbar
//状态栏高度
#define SYS_StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
//导航栏
#define SYS_NavBarHeight 44.0
//TabBar高
#define SYS_TabBarHeight 49.0
//TabBar浮动高  0 或者 34
#define SYS_TabBarFloatHeight (SYS_StatusBarHeight>20?34:0)
//上高 状态栏 + 导航栏
#define SYS_TopHeight (SYS_StatusBarHeight + SYS_NavBarHeight)
//下高  TabBar高 + 浮动高
#define SYS_BottomHeight (SYS_TabBarHeight + SYS_TabBarFloatHeight)
//状态栏 + 导航栏 + 浮动高
#define SYS_DUD (SYS_StatusBarHeight + SYS_NavBarHeight + SYS_TabBarFloatHeight)
//状态栏 + 导航栏 + TabBar + 浮动高
#define SYS_ALLDUD (SYS_StatusBarHeight + SYS_NavBarHeight + SYS_TabBarHeight + SYS_TabBarFloatHeight)



#define MarginSpace 12
#define MarginAllSpace 24

#define FUll_CONTENT_HEIGHT ScreenWidth - 64
#define PageBtn .0675 * ScreenHigh //6s下高度45

#define RGBACOLOR(r,g,b,a)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
//====================iPhone or iPad======================

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_PAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


#define isIphoneX ({\
int tmp = 0;\
if (@available(iOS 11.0, *)) {\
if ([UIApplication sharedApplication].delegate.window.safeAreaInsets.top > 20) {\
tmp = 1;\
}else{\
tmp = 0;\
}\
}else{\
tmp = 0;\
}\
tmp;\
})
//获取手机型号
#define iphoneDeviceType [[[NSString iphoneType] componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet]] componentsJoinedByString:@""]


//获取系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define ISIOS7 [[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0
#define IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ? YES : NO)
#define ISIOS9 ([[UIDevice currentDevice].systemVersion floatValue]>=9?YES:NO)
#define ISIOS10 ([[UIDevice currentDevice].systemVersion floatValue]>=10?YES:NO)

// NSUserDefaults
#define kSaveToUserDefaults(key,value) [[NSUserDefaults standardUserDefaults] setObject:value forKey:key]
#define kRemoveFromUserDefaults(key) [[NSUserDefaults standardUserDefaults] removeObjectForKey:key]
#define kGetFromUserDefaults(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]
#define kGetBoolFromUserDefaults(key) [[NSUserDefaults standardUserDefaults] boolForKey:key]
#define kSaveBoolToUserDefaults(key,value) [[NSUserDefaults standardUserDefaults] setBool:value forKey:key]
#define kGetBoolFromUserDefaults(key) [[NSUserDefaults standardUserDefaults] boolForKey:key]
#define kSaveIntegerToUserDefaults(key,value) [[NSUserDefaults standardUserDefaults] setInteger:value forKey:key]
#define kGetIntegerFromUserDefaults(key) [[NSUserDefaults standardUserDefaults] integerForKey:key]



#ifndef HICITY_KIT_STATIC_INLINE
#define HICITY_KIT_STATIC_INLINE    static inline
#endif

//typedef void (^dispatch_block_t)(void);
/**异步线程*/
HICITY_KIT_STATIC_INLINE void HICITY_BACK(dispatch_block_t block){
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}
/**主线程*/
HICITY_KIT_STATIC_INLINE void HICITY_MAIN(dispatch_block_t block){
    dispatch_async(dispatch_get_main_queue(),block);
}
/**延时多少s*/
HICITY_KIT_STATIC_INLINE void HICITY_AFTER(int delayInSeconds,dispatch_block_t block){
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), block);
}

#define iPhoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#endif /* DeviceTool_h */

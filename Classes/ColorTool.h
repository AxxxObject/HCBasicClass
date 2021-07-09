//
//  ColorTool.h
//  yb_zfj_waca
//
//  Created by 杨 on 2019/7/12.
//  Copyright © 2019 杨风波. All rights reserved.
//

#ifndef ColorTool_h
#define ColorTool_h


// - ==================UIColor颜色======================
#define RGBACOLOR(r,g,b,a)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

//十六进制颜色
#define UIColorFromRGBValue(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//颜色（16进制）
#define HexRGB(rgbValue) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00) >> 8))/255.0 blue:((float)((rgbValue) & 0xFF))/255.0 alpha:1.0]

#define COLOR_MAIN UIColorFromRGBValue(0x415BFD)
#define COLOR_Line UIColorFromRGBValue(0xEDEDED)
#define COLOR_3    UIColorFromRGBValue(0x272727)
#define COLOR_0    UIColorFromRGBValue(0x000000)
#define COLOR_6    UIColorFromRGBValue(0x666666)
#define COLOR_9    UIColorFromRGBValue(0x999999)
#define COLOR_F9    UIColorFromRGBValue(0xF9F9F9)
#define COLOR_F5    UIColorFromRGBValue(0xF5F7F8)
#define COLOR_5F    UIColorFromRGBValue(0x5F5F5F)
#define COLOR_ImgBG    UIColorFromRGBValue(0xEAEEF7)
#define COLOR_CE    HexRGB(0xCECECE)
#define COLOR_Clear    [UIColor clearColor]

#define COLOR_WHITE         [UIColor whiteColor]
#define COLOR_BLACK         [UIColor blackColor]
#define COLOR_GRAY         [UIColor grayColor]
#define COLOR_TXT           HexRGB(0x444444)
#define COLOR_SUB           HexRGB(0x999999)
#define COLOR_DEFVIEW       HexRGB(0xBABDBF)
#define COLOR_LINE          [HexRGB(0xEDEDED) colorWithAlphaComponent:0.5]
#define COLOR_RED           HexRGB(0xFD672A)
#define COLOR_Menoy_RED     HexRGB(0xFF4603)
#define COLOR_BUTTON        HexRGB(0x358812)
#define COLOR_YELLOW        HexRGB(0xFEE41A)
#define COLOR_YELLOWSUB     HexRGB(0xF99206)
#define COLOR_OTHER         HexRGB(0x00BEB4)
#define COLOR_QY            HexRGB(0x4B0010)
#define COLOR_REDFF         HexRGB(0xFF4603)
#define COLOR_LV            HexRGB(0x20D7A8)
#define COLOR_EB            HexRGB(0xBEBEBE)
#define COLOR_OR            HexRGB(0xFD672A)


//适配比例
#define DEVICE_Width_Scale  ([[UIScreen mainScreen] bounds].size.width)/375.0
#define DEVICE_Height_Scale ([[UIScreen mainScreen] bounds].size.height)/667.0


//常规体
#define FontR(font) [UIFont fontWithName:@"PingFangSC-Regular" size:font*DEVICE_Width_Scale]
//中黑体
#define FontM(font) [UIFont fontWithName:@"PingFangSC-Medium" size:font*DEVICE_Width_Scale]
//中粗体
#define FontS(font) [UIFont fontWithName:@"PingFangSC-Semibold" size:font*DEVICE_Width_Scale]
//细体
#define FontL(font) [UIFont fontWithName:@"PingFangSC-Light" size:font*DEVICE_Width_Scale]
//极细体
#define FontU(font) [UIFont fontWithName:@"PingFangSC-Ultralight" size:font*DEVICE_Width_Scale]
//纤细体
#define FontT(font) [UIFont fontWithName:@"PingFangSC-Thin" size:font*DEVICE_Width_Scale]
//DIN Alternate Bold
#define FontD(font) [UIFont fontWithName:@"DINAlternate-Bold" size:font*DEVICE_Width_Scale]
//中黑体
#define FontStyle(font,fontStr) [UIFont fontWithName:@"fontStr" size:font]

//常规体
#define FontNoR(font) [UIFont fontWithName:@"PingFangSC-Regular" size:font]
//中黑体
#define FontNOM(font) [UIFont fontWithName:@"PingFangSC-Medium" size:font]
//中粗体
#define FontNOS(font) [UIFont fontWithName:@"PingFangSC-Semibold" size:font]
//中粗体
#define FontDINA(font) [UIFont fontWithName:@"DINAlternate-Bold" size:font]

#endif /* ColorTool_h */

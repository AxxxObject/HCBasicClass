//
//  YBMacros.h
//  YunNanPatients
//
//  Created by calypso818 on 2017/9/22.
//  Copyright © 2017年 YB. All rights reserved.
//
//
//

/** 储存的本地参数key */
#pragma ===========     个人信息     =================
#define USERINFO @"USERINFO"
#pragma ===========     城市信息     =================
#define CITYDATA @"cityData"
#pragma ===========     全程热议最近搜索信息     =================
#define HOTLIVEDATA @"HotLiveData"


/** 储存的本地参数key */
#pragma ===========     最近查看     =================
#define HistoryTravel        @"HistoryTravel"   //游记
#define HistoryHeated_debate @"HistoryHeated_debate"   //热议
#define HistoryOfficial_news @"HistoryOfficial_news"   //头条
#define History_News @"History_News"   //资讯
#define HistoryActity @"HistoryActity"   //活动


#define timeFormart @"yyyy-MM-dd HH:mm:ss"

//用户token
#define UserInfoManager [[UserInfoModel manager]loadUserInfo]
#define UserToken [[NSUserDefaults standardUserDefaults] valueForKey:@"UserToken"]

//第一次登陆 同意协议
#define UserIsAgree [[NSUserDefaults standardUserDefaults] valueForKey:@"UserIsAgree"]


//存省市名称
#define CityProvinceName [[NSUserDefaults standardUserDefaults] valueForKey:@"CityProvinceName"]!=nil?[[NSUserDefaults standardUserDefaults] objectForKey:@"CityProvinceName"]:@""
//存省市编码
#define CityProvinceAdcode [[NSUserDefaults standardUserDefaults] valueForKey:@"CityProvinceAdcode"]!=nil?[[NSUserDefaults standardUserDefaults] objectForKey:@"CityProvinceAdcode"]:@""



//存城市id
#define CityID [[NSUserDefaults standardUserDefaults] valueForKey:@"CityID"]!=nil?[[NSUserDefaults standardUserDefaults] valueForKey:@"CityID"]:@""
//存城市名称
#define CityName [[NSUserDefaults standardUserDefaults] valueForKey:@"CityName"]!=nil?[[NSUserDefaults standardUserDefaults] objectForKey:@"CityName"]:@""

//存当前经度
#define CityAltitude [[NSUserDefaults standardUserDefaults] valueForKey:@"altitude"]!=nil?[[NSUserDefaults standardUserDefaults] valueForKey:@"altitude"]:@""
//存当前纬度
#define CityLongitude [[NSUserDefaults standardUserDefaults] valueForKey:@"longitude"]!=nil?[[NSUserDefaults standardUserDefaults] valueForKey:@"longitude"]:@""
//存城市的编码
#define CityAdcode [[NSUserDefaults standardUserDefaults] valueForKey:@"adcode"]!=nil?[[NSUserDefaults standardUserDefaults] valueForKey:@"adcode"]:@""

#pragma mark ============================= 腾讯IM  ==========================


#define TXimAppID 1400475370  //测试
#define TXSecretkey @"a992f45f2ac07474ded556b4440a535105140b4af9a59c0582545774c8d68115"

//#define TXimAppID 1400503307 //正式站
//#define TXSecretkey @"a86e5a4eb15cad9b986a763ec98130afa90aa1a060c1a5008a1696200757f70d"


//腾讯证书ID
#ifdef DEBUG
#define sdkBusiId 26416
#else
#define sdkBusiId 26415
#endif



#pragma mark =============================  高德地图  ==========================
#define AMapKey @"a55ec7323709988d5106af3d04d5c485"

#pragma mark =============================  极光推送  ==========================
#define jPushAppkey @""

#pragma mark =============================  微信  ==========================
//微信appID
#define vxAppID @"wx7f3f19a01265db3f"
//微信Secret
#define vxSecret @"6e90c9a6387f4d42b837e0e2a2241e31"

#pragma mark =============================  QQ  ==========================
//QQ appID
#define QQAppID @"1111402946"
//QQ Secret
#define QQSecret @"0OWBJBBCjk37LIjs"

#pragma mark =============================  友盟  ==========================
//友盟appID
#define umAppID @"605bf50f6ee47d382b94eedf"

//储存微信个人信息
#define vxUserInfo [[NSUserDefaults standardUserDefaults] valueForKey:@"vxUserInfo"]

#pragma mark ============================= 微博  ==========================
//微博APPkey
#define weiboAppKey @""
//微博App Secret
#define weiboSecret @""
#define kRedirectURI    @"https://api.weibo.com/oauth2/default.html"
//微博的缓存token
#define WBToken [[NSUserDefaults standardUserDefaults]valueForKey:@"WBAccess_token"]
#define WBUID [[NSUserDefaults standardUserDefaults]valueForKey:@"WBUid"]
//储存微博个人信息
#define wbUserInfo [[NSUserDefaults standardUserDefaults] valueForKey:@"wbUserInfo"]

#pragma mark ============================= 友盟==========================
//友盟appkey
#define UMENAppKey @""
//设备存储token
#define DeviceTokenStr [[NSUserDefaults standardUserDefaults] valueForKey:@"deviceToken"]

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define ClassName NSLog(@"当前类名为   ---------- %@ ----------",NSStringFromClass([self class])); //打印类名，方便以后改bug

//字体
#define Font(size)                       [UIFont systemFontOfSize:(size)]
//图片
#define IMGNAME(name) [UIImage imageNamed:name]
#define IMAGE(name) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:nil]]

// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]




#define MID_X(x)                            CGRectGetMidX(x)
#define MID_Y(y)                            CGRectGetMidY(y)
#define MIN_X(x)                            CGRectGetMinX(x)
#define MIN_Y(y)                            CGRectGetMinY(y)
#define MAX_X(x)                            CGRectGetMaxX(x)
#define MAX_Y(y)                            CGRectGetMaxY(y)

#define POSITION                    @"position"                             //位移
#define OPACITY                     @"opacity"                              //透明度
#define TRANSFORM_SCALE             @"transform.scale"                      //缩放
#define TRANSFORM_ROTATION_Z        @"transform.rotation.z"                 //旋转
#define BACKGROUNDCOLOR             @"backgroundColor"                      //背景色
#define TRANSFORM_ROTATION          @"transform.rotation"                   //抖动

#ifdef DEBUG

#define DLog(...) NSLog(@"数据="__VA_ARGS__);
#define DSLog(fmt, ...) NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);

#else

# define DLog(...);
# define DSLog(...);

#endif












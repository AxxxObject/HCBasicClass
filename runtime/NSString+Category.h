
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Category)


/**
 *  对字符进行UTF8处理
 *  @return 处理后的字符串
 */
- (NSString *)stringUTF8;

/**
 *  计算字体 大小的长宽
 *  @param font 字体大小
 *  @return CGSize
 */
- (CGSize)sizeWithFont:(UIFont *)font;

/**
 *  计算字体 大小的长宽
 *  @param font 字体大小
 *  @param maxW 最大宽度
 *  @return CGSize
 */
- (CGSize)sizeWithFont:(UIFont *)font andMaxW:(CGFloat)maxW;

/**
 *  计算字体 的高度
 *  @param font 字体大小
 *  @param textWidth 最大宽度
 *  @param text 文本
 *  @return CGFloat
 */
+(CGFloat )heightWithTextFont:(CGFloat)font andWidth:(CGFloat )textWidth andContent:(NSString *)text;


/**
 *  计算含间距字体 的高度
 *  @param lineSpeace 字体间距
 *  @param font 字体大小
 *  @param width 字体宽度
 *  @param text 文本
 *  @return CGFloat
 */
+ (CGFloat)getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width withStr:(NSString *)str;


/**
 *  获取手机设备型号
 */
+ (NSString *)iphoneType;

#pragma ------------ 验证字符串 ---------------
/**
 *  字符串判断是否为空
 */
- (BOOL)isEmpty;

/**
 *  是不是中文
 */
-(BOOL)isChinese;

/**
 *  判断是否为整形
 */
+ (BOOL)isInteger:(NSString*)string;

/**
 *  判断是否为浮点形
 */
+ (BOOL)isFloat:(NSString*)string;

/**
 *  判断字符串是否是银行卡
 */
+ (BOOL)isCheckCardNo:(NSString*)cardNo;

/**
 *  判断是否是手机号  能同时验证 +86 86 或无 86开头的手机号
 */
- (BOOL)isPhone;

/**
 *  是否是邮箱
 */
- (BOOL)isEmail;

/**
 *  检查密码否和规定吗  正则匹配用户密码6-20位数字和字母组合
 */
- (BOOL)isCheckPassword;

/*
 * 判断是否输入了emoji 表情
 */
- (BOOL)stringContainsEmoji;


#pragma ------------ 验证身份证 ---------------
/*
 * 身份证是否合法
 */
- (BOOL)validateIDCardNumber:(NSString *)identityCard;

/*
 * 根据身份证获取年龄
 */
- (NSString *)getIdentityCardAge:(NSString *)numberStr;

/*
 * 根据身份证获取生日
 */
- (NSString *)birthdayStrFromIdentityCard:(NSString *)numberStr;

/*
 * 根据身份证获取男女
 */
- (NSString *)getIdentityCardSex:(NSString *)numberStr;

#pragma ------------ Unicode转中文  中午转Unicode ---------------

/**
 * Unicode 转中文
 *  @param unicodeStr   需要转换的字符串
 *  @return 中文
 */
+(NSString *)replaceUnicode:(NSString *)unicodeStr;

/**
 * 中文转Unicode
 *  @param str   需要转换的字符串
 *  @return Unicode
 */
+(NSString*)URLDecodedString:(NSString*)str;


#pragma ===========字符串的加密  解码  MD5加密============
/**
 * 解密
 *  @param sText   需要解密的字符串
 *  @param key   key值
 *  @return 字符串
 */
+ (NSString *)decryptWithText:(NSString *)sText key:(NSString *)key;

/**
 * 加密
 *  @param sText   需要加密的字符串
 *  @param key   key值
 *  @return 字符串
 */
+ (NSString *)encryptWithText:(NSString *)sText key:(NSString *)key;

/**
 * MD5加密
 *  @param str   需要加密的字符串
 *  @return 字符串
 */
+(NSString *)md5HexDigest:(NSString *)str;

//加密
+(NSString *)unicode2ISO88591:(NSString *)string;
+(NSString *)AES128Encrypt:(NSString *)plainText;


#pragma ===========简单过滤html标签============

/**
 * 去除字符串里面html标签
 *  @param html   标签
 *  @return 字符串
 */
+(NSString *)resultTwoWithData:(NSString *)html;


#pragma ===========相同字符在数组的那个位置============
/**
 * 相同字符串在整个字符串的位置
 *  @param text   整个字符串
 *  @param findText   需要查找的字符串
 *  @return 数组   在第好多位的数组集合
 */
+ (NSMutableArray *)getRangeStr:(NSString *)text findText:(NSString *)findText;


#pragma ===========返回时间什么什么之前============
+(NSString *)returnTimeStr:(NSString *)afterTimeStr;

+(NSString *)returnPositionTimeStr:(NSString *)afterTimeStr;

+(NSString *)returnTraveTimeStr:(NSString *)nowTimeStr;

#pragma ===========归档 接档============
/**
 * 归档 字符串
 *  @param respObject   需要归档数据
 *  @return data
 */
+(NSData *)archivedDataWithRootObject:(id)respObject;

/**
 * 接档 字符串
 *  @param data   需要归档数据
 *  @return id  数据
 */
+(id)unarchiveObjectWithData:(NSData *)data;


#pragma ===========自定义富文本============

/**
 *  设置自定义字符串
 *  @param color   颜色
 *  @param font   大小
 *  @return id  数据
 */
- (NSAttributedString*)setTextColor:(UIColor*)color textFont:(UIFont*)font;

+(NSString *)returnInformationTimeStr:(NSString *)nowTimeStr;



@end

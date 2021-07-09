

#import "NSString+Category.h"
#import "NSDate+Category.h"
#import <CommonCrypto/CommonCrypto.h>
#import <sys/utsname.h>
//加密解密用的字符串
static const char encodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
static Byte iv[] = { 0x12, 0x34, 0x56, 0x78, (Byte) 0x90,
    (Byte) 0xAB, (Byte) 0xCD, (Byte) 0xEF };
//加密解密换一个字符串拼接
#define KDES_KEY @"12371key"


struct utsname systemInfo;

@implementation NSString (YBExtension)

+ (NSString *)iphoneType{
    
    uname(&systemInfo);
    NSString *phoneType = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if([phoneType  isEqualToString:@"iPhone1,1"])  return @"iPhone 2G";
    
    if([phoneType  isEqualToString:@"iPhone1,2"])  return @"iPhone 3G";
    
    if([phoneType  isEqualToString:@"iPhone2,1"])  return @"iPhone 3GS";
    
    if([phoneType  isEqualToString:@"iPhone3,1"])  return @"iPhone 4";
    
    if([phoneType  isEqualToString:@"iPhone3,2"])  return @"iPhone 4";
    
    if([phoneType  isEqualToString:@"iPhone3,3"])  return @"iPhone 4";
    
    if([phoneType  isEqualToString:@"iPhone4,1"])  return @"iPhone 4S";
    
    if([phoneType  isEqualToString:@"iPhone5,1"])  return @"iPhone 5";
    
    if([phoneType  isEqualToString:@"iPhone5,2"])  return @"iPhone 5";
    
    if([phoneType  isEqualToString:@"iPhone5,3"])  return @"iPhone 5c";
    
    if([phoneType  isEqualToString:@"iPhone5,4"])  return @"iPhone 5c";
    
    if([phoneType  isEqualToString:@"iPhone6,1"])  return @"iPhone 5s";
    
    if([phoneType  isEqualToString:@"iPhone6,2"])  return @"iPhone 5s";
    
    if([phoneType  isEqualToString:@"iPhone7,1"])  return @"iPhone 6 Plus";
    
    if([phoneType  isEqualToString:@"iPhone7,2"])  return @"iPhone 6";
    
    if([phoneType  isEqualToString:@"iPhone8,1"])  return @"iPhone 6s";
    
    if([phoneType  isEqualToString:@"iPhone8,2"])  return @"iPhone 6s Plus";
    
    if([phoneType  isEqualToString:@"iPhone8,4"])  return @"iPhone SE";
    
    if([phoneType  isEqualToString:@"iPhone9,1"])  return @"iPhone 7";
    
    if([phoneType  isEqualToString:@"iPhone9,2"])  return @"iPhone 7 Plus";
    
    if([phoneType  isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    
    if([phoneType  isEqualToString:@"iPhone10,4"]) return @"iPhone 8";
    
    if([phoneType  isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
    
    if([phoneType  isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";
    
    if([phoneType  isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    
    if([phoneType  isEqualToString:@"iPhone10,6"]) return @"iPhone X";
    
    if([phoneType  isEqualToString:@"iPhone11,8"]) return @"iPhone XR";
    
    if([phoneType  isEqualToString:@"iPhone11,2"]) return @"iPhone XS";
    
    if([phoneType  isEqualToString:@"iPhone11,4"]) return @"iPhone XS Max";
    
    if([phoneType  isEqualToString:@"iPhone11,6"]) return @"iPhone XS Max";
    
    
    return phoneType;
}

//判断是否为整形：
+ (BOOL)isInteger:(NSString*)string{
    
   NSScanner* scan = [NSScanner scannerWithString:string];
   int val;
   return[scan scanInt:&val] && [scan isAtEnd];
}


//判断是否为浮点形：

+ (BOOL)isFloat:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

/**
 *  判断字符串是否是银行卡
 *
 *  @return YES 正确/ NO 不正确
 */
+ (BOOL)isCheckCardNo:(NSString*)cardNo{
    
    int oddsum = 0;     //奇数求和
    int evensum = 0;    //偶数求和
    int allsum = 0;
    int cardNoLength = (int)[cardNo length];
    int lastNum = [[cardNo substringFromIndex:cardNoLength-1] intValue];
    
    cardNo = [cardNo substringToIndex:cardNoLength - 1];
    for (int i = cardNoLength -1 ; i>=1;i--) {
        NSString *tmpString = [cardNo substringWithRange:NSMakeRange(i-1, 1)];
        int tmpVal = [tmpString intValue];
        if (cardNoLength % 2 ==1 ) {
            if((i % 2) == 0){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    
    allsum = oddsum + evensum;
    allsum += lastNum;
    if((allsum % 10) == 0){
        return YES;
    }else{
        return NO;
    }
    
}

#pragma  +++++++++++++++++++++++实列方法++++++++++++++++++++

- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font
{
    return [self sizeWithFont:font maxW:MAXFLOAT];
    
    
}
- (CGSize)sizeWithFont:(UIFont *)font andMaxW:(CGFloat)maxW
{
    return [self sizeWithFont:font maxW:maxW];
}
//根据内容字体的大小和行宽计算文本的高度
+(CGFloat )heightWithTextFont:(CGFloat)font andWidth:(CGFloat )textWidth andContent:(NSString *)text
{
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:font]};
    
    CGSize rectSize=[text boundingRectWithSize:CGSizeMake(textWidth, 0) options:\
                     NSStringDrawingTruncatesLastVisibleLine |
                     NSStringDrawingUsesLineFragmentOrigin |
                     NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return rectSize.height;
}


+ (CGFloat)getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width withStr:(NSString *)str{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    /** 行高 */
    paraStyle.lineSpacing = lineSpeace;
    // NSKernAttributeName字体间距
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    CGSize size = [str boundingRectWithSize:CGSizeMake(width,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}


/**
 *  对字符进行UTF8处理
 *
 *  @return 返回处理成UTF8编码的字符
 */
- (NSString *)stringUTF8
{
    NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)self, NULL, NULL,  kCFStringEncodingUTF8 ));
    return encodedString;
}


#pragma =========================验证=========================
/**
 *      是不是中文
 */
-(BOOL)isChinese{
    
    for(int i=0; i< [self length];i++){
        
        int a = [self characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){
            
            return YES;
            
        }
    }
    return NO;
}
/**
 *  判断是否是手机号  能同时验证 +86 86 或无 86开头的手机号
 *
 *  @return YES 正确/ NO 不正确
 */
- (BOOL)isPhone{
    NSString * PHS = @"^((\\+86)|(86))?(1[0-9])\\d{9}$";
    NSPredicate *TalTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",PHS];
    return [TalTest evaluateWithObject:self];
}
/**
 *  是否是邮箱
 *
 *  @return YES 正确 / NO 不正确
 */
- (BOOL)isEmail{
    
    NSString * PHS = @"^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";
    NSPredicate *TalTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",PHS];
    return [TalTest evaluateWithObject:self];
    
}

/**
 *  检查密码否和规定吗  正则匹配用户密码6-20位数字和字母组合
 *
 *  @return
 */
- (BOOL)isCheckPassword{
    
    
    return YES;
}

//判断是否输入了emoji 表情
- (BOOL)stringContainsEmoji
{
    __block BOOL returnValue = NO;
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        const unichar hs = [substring characterAtIndex:0];
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    returnValue = YES;
                }
            }
        } else if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3) {
                returnValue = YES;
            }
        } else {
            if (0x2100 <= hs && hs <= 0x27ff) {
                returnValue = YES;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                returnValue = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                returnValue = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                returnValue = YES;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                returnValue = YES;
            }
        }
    }];
    
    return returnValue;
}

+ (NSString *)base64EncodingWithData:(NSData*)data;
{
    if (data.length == 0)
        return @"";
    
    char *characters = malloc(data.length*3/2);
    
    if (characters == NULL)
        return @"";
    int end = (int)data.length - 3;
    int index = 0;
    int charCount = 0;
    int n = 0;
    
    while (index <= end) {
        int d = (((int)(((char *)[data bytes])[index]) & 0x0ff) << 16)
        | (((int)(((char *)[data bytes])[index + 1]) & 0x0ff) << 8)
        | ((int)(((char *)[data bytes])[index + 2]) & 0x0ff);
        
        characters[charCount++] = encodingTable[(d >> 18) & 63];
        characters[charCount++] = encodingTable[(d >> 12) & 63];
        characters[charCount++] = encodingTable[(d >> 6) & 63];
        characters[charCount++] = encodingTable[d & 63];
        
        index += 3;
        
        if(n++ >= 14)
        {
            n = 0;
            characters[charCount++] = ' ';
        }
    }
    
    if(index == data.length - 2)
    {
        int d = (((int)(((char *)[data bytes])[index]) & 0x0ff) << 16)
        | (((int)(((char *)[data bytes])[index + 1]) & 255) << 8);
        characters[charCount++] = encodingTable[(d >> 18) & 63];
        characters[charCount++] = encodingTable[(d >> 12) & 63];
        characters[charCount++] = encodingTable[(d >> 6) & 63];
        characters[charCount++] = '=';
    }
    else if(index == data.length - 1)
    {
        int d = ((int)(((char *)[data bytes])[index]) & 0x0ff) << 16;
        characters[charCount++] = encodingTable[(d >> 18) & 63];
        characters[charCount++] = encodingTable[(d >> 12) & 63];
        characters[charCount++] = '=';
        characters[charCount++] = '=';
    }
    NSString * rtnStr = [[NSString alloc] initWithBytesNoCopy:characters length:charCount encoding:NSUTF8StringEncoding freeWhenDone:YES];
    return rtnStr;
}
+ (NSData *)dataWithBase64EncodedString:(NSString *)string
{
    if (string == nil)
        [NSException raise:NSInvalidArgumentException format:nil];
    if ([string length] == 0)
        return [NSData data];
    
    static char *decodingTable = NULL;
    if (decodingTable == NULL)
    {
        decodingTable = malloc(256);
        if (decodingTable == NULL)
            return nil;
        memset(decodingTable, CHAR_MAX, 256);
        NSUInteger i;
        for (i = 0; i < 64; i++)
        decodingTable[(short)encodingTable[i]] = i;
    }
    
    const char *characters = [string cStringUsingEncoding:NSASCIIStringEncoding];
    if (characters == NULL)     //  Not an ASCII string!
        return nil;
    char *bytes = malloc((([string length] + 3) / 4) * 3);
    if (bytes == NULL)
        return nil;
    NSUInteger length = 0;
    
    NSUInteger i = 0;
    while (YES)
    {
        char buffer[4];
        short bufferLength;
        for (bufferLength = 0; bufferLength < 4; i++)
        {
            if (characters[i] == '\0')
                break;
            if (isspace(characters[i]) || characters[i] == '=')
                continue;
            buffer[bufferLength] = decodingTable[(short)characters[i]];
            if (buffer[bufferLength++] == CHAR_MAX)      //  Illegal character!
            {
                free(bytes);
                return nil;
            }
        }
        
        if (bufferLength == 0)
            break;
        if (bufferLength == 1)      //  At least two characters are needed to produce one byte!
        {
            free(bytes);
            return nil;
        }
        
        //  Decode the characters in the buffer to bytes.
        bytes[length++] = (buffer[0] << 2) | (buffer[1] >> 4);
        if (bufferLength > 2)
            bytes[length++] = (buffer[1] << 4) | (buffer[2] >> 2);
        if (bufferLength > 3)
            bytes[length++] = (buffer[2] << 6) | buffer[3];
    }
    
    bytes = realloc(bytes, length);
    return [NSData dataWithBytesNoCopy:bytes length:length];
}



+ (NSString *)encryptWithText:(NSString *)sText key:(NSString *)key
{
    //kCCEncrypt 加密
    return [self encrypt:sText encryptOrDecrypt:kCCEncrypt key:key];
}

+ (NSString *)decryptWithText:(NSString *)sText key:(NSString *)key
{
    //kCCDecrypt 解密
    return [self encrypt:sText encryptOrDecrypt:kCCDecrypt key:key];
}

+ (NSString *)encrypt:(NSString *)sText encryptOrDecrypt:(CCOperation)encryptOperation key:(NSString *)key
{
    const void *dataIn;
    size_t dataInLength;
    
    
    if (encryptOperation == kCCDecrypt)//传递过来的是decrypt 解码
    {
        //解码 base64
        NSData *decryptData = [self dataWithBase64EncodedString:sText];//转成utf-8并decode
        dataInLength = [decryptData length];
        dataIn = [decryptData bytes];
    }
    else  //encrypt
    {
        NSData* encryptData = [sText dataUsingEncoding:NSUTF8StringEncoding];
        dataInLength = [encryptData length];
        dataIn = (const void *)[encryptData bytes];
    }
    
    /*
     DES加密 ：用CCCrypt函数加密一下，然后用base64编码下，传过去
     DES解密 ：把收到的数据根据base64，decode一下，然后再用CCCrypt函数解密，得到原本的数据
     */
    CCCryptorStatus ccStatus;
    uint8_t *dataOut = NULL; //可以理解位type/typedef 的缩写（有效的维护了代码，比如：一个人用int，一个人用long。最好用typedef来定义）
    size_t dataOutAvailable = 0; //size_t  是操作符sizeof返回的结果类型
    size_t dataOutMoved = 0;
    
    dataOutAvailable = (dataInLength + kCCBlockSizeDES) & ~(kCCBlockSizeDES - 1);
    dataOut = malloc( dataOutAvailable * sizeof(uint8_t));
    memset((void *)dataOut, 0x0, dataOutAvailable);//将已开辟内存空间buffer的首 1 个字节的值设为值 0
    
    //    NSString *initIv = @"12345678";
    const void *vkey = (const void *) [key UTF8String];
    //    const void *iv = (const void *) [initIv UTF8String];
    
    //CCCrypt函数 加密/解密
    ccStatus = CCCrypt(encryptOperation,//  加密/解密
                       kCCAlgorithmDES,//  加密根据哪个标准（des，3des，aes。。。。）
                       kCCOptionPKCS7Padding,//  选项分组密码算法(des:对每块分组加一次密  3DES：对每块分组加三个不同的密)
                       vkey,  //密钥    加密和解密的密钥必须一致
                       kCCKeySizeDES,//   DES 密钥的大小（kCCKeySizeDES=8）
                       iv, //  可选的初始矢量
                       dataIn, // 数据的存储单元
                       dataInLength,// 数据的大小
                       (void *)dataOut,// 用于返回数据
                       dataOutAvailable,
                       &dataOutMoved);
    NSString *result = nil;
    if (encryptOperation == kCCDecrypt)//encryptOperation==1  解码
    {
        //得到解密出来的data数据，改变为utf-8的字符串
        result = [[NSString alloc] initWithData:[NSData dataWithBytes:(const void *)dataOut length:(NSUInteger)dataOutMoved] encoding:NSUTF8StringEncoding];
    }
    else //encryptOperation==0  （加密过程中，把加好密的数据转成base64的）
    {
        
        //编码 base64
        NSData *data = [NSData dataWithBytes:(const void *)dataOut length:(NSUInteger)dataOutMoved];
        result = [self base64EncodingWithData:data];
    }
    
    return result;
}

//MD5加密
+(NSString *)md5HexDigest:(NSString *)str{
    
    const char *original_str = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
    [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}

//Unicode 转中文
+(NSString *)replaceUnicode:(NSString *)unicodeStr {
    
    NSString *str = [unicodeStr stringByReplacingOccurrencesOfString:@"%0D%0A" withString:@"\n"];
    NSString *str2 = [str stringByReplacingOccurrencesOfString:@"%20" withString:@" "];
    NSString *tempStr1 = [str2 stringByReplacingOccurrencesOfString:@"%u" withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *returnStr=[NSPropertyListSerialization propertyListWithData:tempData options:NSPropertyListImmutable format:nil error:nil];
    
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
}
+(NSString*)URLDecodedString:(NSString*)str

{
    
    NSString *decodedString=(__bridge_transfer NSString*)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)str,CFSTR(""),CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    
    return decodedString;
}

//处理特殊字符2
+(NSString *)resultTwoWithData:(NSString *)html;
{
    //    NSString *html=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSScanner *theScanner;
    NSString *text = nil;
    
    theScanner = [NSScanner scannerWithString:html];
    
    while ([theScanner isAtEnd] == NO) {
        
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        
        
        NSRange range = [text rangeOfString:@"<" options:NSBackwardsSearch];
        if (range.location != 0) {
            
            text = [text substringFromIndex:range.location];
        }
        html = [html stringByReplacingOccurrencesOfString:
                [ NSString stringWithFormat:@"%@>", text]
                                               withString:@" "];
        // 过滤&nbsp标签
        // html = [html stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
        // 过滤&ldquo等标签
        html = [html stringByReplacingOccurrencesOfString:@"&ldquo;" withString:@""];
        // 过滤&rdquo等标签
        html = [html stringByReplacingOccurrencesOfString:@"&rdquo;" withString:@""];
        // 过滤&hellip等标签
        html = [html stringByReplacingOccurrencesOfString:@"&hellip;" withString:@"..."];
        // 过滤&rarr等标签
        html = [html stringByReplacingOccurrencesOfString:@"&rarr;" withString:@"->"];
        // 过滤&mdash等标签
        html = [html stringByReplacingOccurrencesOfString:@"&mdash;" withString:@"--"];
        // 过滤&lsquo等标签
        html = [html stringByReplacingOccurrencesOfString:@"&lsquo;" withString:@"'"];
        // 过滤&rsquo等标签
        html = [html stringByReplacingOccurrencesOfString:@"&rsquo;" withString:@"'"];
        // 过滤&amp等标签
        html = [html stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
        // 过滤&lt等标签
        html = [html stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
        // 过滤&gt等标签
        html = [html stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
        // 过滤&nbsp;等标签
        html = [html stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
        // 过滤&nbsp;等标签
        html = [html stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
        // 过滤&quot;等标签
        html = [html stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
        // 过滤&#39;等标签
        html = [html stringByReplacingOccurrencesOfString:@"&#39;" withString:@"\'"];
        // 过滤\n;等标签
        //html = [html stringByReplacingOccurrencesOfString:@"\n" withString:@"<br/> "];
        html = [html stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        //过滤换行等标签
        
        html = [html stringByReplacingOccurrencesOfString:@"  " withString:@""];
        html = [html stringByReplacingOccurrencesOfString:@"\t" withString:@""];
        //html = [html stringByReplacingOccurrencesOfString:@"\n" withString:@"#des"];
        html = [html stringByReplacingOccurrencesOfString:@"\r" withString:@" "];
        html = [html stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    }
    
    return html;
    
}

- (BOOL)isEmpty ///< 是否为空或者是空格
{
    
    NSString * newSelf = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    if(self == nil
       || self.length ==0
       || [self isEqualToString:@""]
       || [self isEqualToString:@"<null>"]
       || [self isEqualToString:@"(null)"]
       || [self isEqualToString:@"null"]
       || newSelf.length ==0
       || [newSelf isEqualToString:@""]
       || [newSelf isEqualToString:@"<null>"]
       || [newSelf isEqualToString:@"(null)"]
       || [newSelf isEqualToString:@"null"]
       || [self isKindOfClass:[NSNull class]]
       || [self isEqual:[NSNull null]]
       || newSelf == nil){
        
        return YES;
        
    }else{
        // <object returned empty description> 会来这里
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimedString = [self stringByTrimmingCharactersInSet:set];
        
        return [trimedString isEqualToString: @""];
    }
    
    return NO;
}
+ (NSMutableArray *)getRangeStr:(NSString *)text findText:(NSString *)findText
{
    
    NSMutableArray *arrayRanges = [NSMutableArray arrayWithCapacity:3];
    
    if (findText == nil && [findText isEqualToString:@""])
    {
        return nil;
    }
    NSRange rang = [text rangeOfString:findText]; //获取第一次出现的range
    if (rang.location != NSNotFound && rang.length != 0)
    {
        [arrayRanges addObject:[NSNumber numberWithInteger:rang.location]];//将第一次的加入到数组中
        
        NSRange rang1 = {0,0};
        
        NSInteger location = 0;
        
        NSInteger length = 0;
        
        for (int i = 0; i < [text length]; i++)
        {
            if (0 == i)
            {
                //去掉这个abc字符串
                location = rang.location + rang.length;
                
                length = text.length - rang.location - rang.length;
                
                rang1 = NSMakeRange(location, length);
            }
            else
            {
                location = rang1.location + rang1.length;
                
                length = text.length - rang1.location - rang1.length;
                
                rang1 = NSMakeRange(location, length);
            }
            //在一个range范围内查找另一个字符串的range
            rang1 = [text rangeOfString:findText options:NSCaseInsensitiveSearch range:rang1];
            if (rang1.location == NSNotFound && rang1.length == 0)
            {
                break;
            }
            else//添加符合条件的location进数组
                [arrayRanges addObject:[NSNumber numberWithInteger:rang1.location]];
        }
        return arrayRanges;
    }
    return nil;
}


//根据身份证获取年龄
-(NSString *)getIdentityCardAge:(NSString *)numberStr
{
    
    NSDateFormatter *formatterTow = [[NSDateFormatter alloc]init];
    [formatterTow setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *bsyDate = [formatterTow dateFromString:[self birthdayStrFromIdentityCard:numberStr]];
    
    NSTimeInterval dateDiff = [bsyDate timeIntervalSinceNow];
    
    int age = trunc(dateDiff/(60*60*24))/365;
    
    return [NSString stringWithFormat:@"%d",-age];
}

-(NSString *)birthdayStrFromIdentityCard:(NSString *)numberStr
{
    NSMutableString *result = [NSMutableString stringWithCapacity:0];
    NSString *year = nil;
    NSString *month = nil;
    
    BOOL isAllNumber = YES;
    NSString *day = nil;
    if([numberStr length]<14)
        return result;
    
    //**截取前14位
    NSString *fontNumer = [numberStr substringWithRange:NSMakeRange(0, 13)];
    
    //**检测前14位否全都是数字;
    const char *str = [fontNumer UTF8String];
    const char *p = str;
    while (*p!='\0') {
        if(!(*p>='0'&&*p<='9'))
            isAllNumber = NO;
        p++;
    }
    if(!isAllNumber)
        return result;
    
    year = [numberStr substringWithRange:NSMakeRange(6, 4)];
    month = [numberStr substringWithRange:NSMakeRange(10, 2)];
    day = [numberStr substringWithRange:NSMakeRange(12,2)];
    
    [result appendString:year];
    [result appendString:@"-"];
    [result appendString:month];
    [result appendString:@"-"];
    [result appendString:day];
    return result;
}
-(NSString *)getIdentityCardSex:(NSString *)numberStr
{
    int sexInt=[[numberStr substringWithRange:NSMakeRange(16,1)] intValue];
    
    if(sexInt%2!=0)
    {
        return @"1";
    }
    else
    {
        return @"0";
    }
}

- (NSString *)StartStringTime{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    return currentDateStr;
}
- (NSString *)EndStringTime{
    NSDate * mydate = [NSDate date];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSCalendar *calendarD = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //NSDateComponents *compsData = [calendarD components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitMonth fromDate:mydate];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setYear:0];
    [adcomps setMonth:-1];
    [adcomps setDay:0];
    NSDate *newdate = [calendarD dateByAddingComponents:adcomps toDate:mydate options:0];
    NSString *beforDate = [dateFormatter stringFromDate:newdate];
    
    return beforDate;
}
- (NSString *)DATENSString:(NSString *)DateStr{
    NSString *DateTimeStr=[DateStr substringToIndex:10];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate* inputDate = [dateFormatter dateFromString:DateTimeStr];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //NSDateComponents *comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitMonth fromDate:inputDate];
    //comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitMonth fromDate:inputDate];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setYear:0];
    [adcomps setMonth:+1];
    [adcomps setDay:0];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:inputDate options:0];
    NSString *beforDate = [dateFormatter stringFromDate:newdate];
    
    return beforDate;
}

//判断身份证是否正确
- (BOOL)validateIDCardNumber:(NSString *)identityCard  {
    
    BOOL flag;
    if (identityCard.length <= 0)
    {
        flag = NO;
        return flag;
    }
    
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    flag = [identityCardPredicate evaluateWithObject:identityCard];
    
    
    //如果通过该验证，说明身份证格式正确，但准确性还需计算
    if(flag)
    {
        if(identityCard.length==18)
        {
            //将前17位加权因子保存在数组里
            NSArray * idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
            
            //这是除以11后，可能产生的11位余数、验证码，也保存成数组
            NSArray * idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
            
            //用来保存前17位各自乖以加权因子后的总和
            
            NSInteger idCardWiSum = 0;
            for(int i = 0;i < 17;i++)
            {
                NSInteger subStrIndex = [[identityCard substringWithRange:NSMakeRange(i, 1)] integerValue];
                NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
                
                idCardWiSum+= subStrIndex * idCardWiIndex;
                
            }
            
            //计算出校验码所在数组的位置
            NSInteger idCardMod=idCardWiSum%11;
            
            //得到最后一位身份证号码
            NSString * idCardLast= [identityCard substringWithRange:NSMakeRange(17, 1)];
            
            //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
            if(idCardMod==2)
            {
                if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"])
                {
                    return flag;
                }else
                {
                    flag =  NO;
                    return flag;
                }
            }else
            {
                //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
                if([idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]])
                {
                    return flag;
                }
                else
                {
                    flag =  NO;
                    return flag;
                }
            }
        }
        else
        {
            flag =  NO;
            return flag;
        }
    }
    else
    {
        return flag;
    }
}



+(NSString *)returnTimeStr:(NSString *)nowTimeStr{
    
    NSString *dateStr = [NSString stringWithFormat:@"%@",nowTimeStr];
    NSDateFormatter *dateF = [[NSDateFormatter alloc]init];
    [dateF setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *pubDate = [dateF dateFromString:dateStr];
    
    /*
     YearDifference,   //计算年差
     MonthlDifference, //计算月差
     DaysDifference,   //计算日差
     HourDifference,   //计算小时差
     MinuteDifference, //计算分差
     SecondsDifference //计算秒差
     **/
    
    NSInteger time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:YearDifference];
    NSString *timeStr;
    if (-time > 0) {
        timeStr = [NSString stringWithFormat:@"%ld年前",-time];
    }else{
        time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:MonthlDifference];
        if (-time > 0) {
            timeStr = [NSString stringWithFormat:@"%ld月前",-time];
        }else{
            time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:DaysDifference];
            if (-time > 0) {
                timeStr = [NSString stringWithFormat:@"%ld天前",(long)-time];
            }else{
                time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:HourDifference];
                if (-time > 0) {
                    timeStr = [NSString stringWithFormat:@"%ld小时前",(long)-time];
                }else{
                    time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:MinuteDifference];
                    if (-time > 0) {
                        timeStr = [NSString stringWithFormat:@"%ld分钟前",(long)-time];
                    }else{
                        time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:SecondsDifference];
                        if (-time > 0) {
                            timeStr = [NSString stringWithFormat:@"%ld秒前",(long)-time];
                        }else{
                            timeStr = [NSString stringWithFormat:@"刚刚"];
                        }
                    }
                }
            }
        }
    }
    return timeStr;
}


+(NSString *)returnInformationTimeStr:(NSString *)nowTimeStr{
    NSString *timeFormart = @"yyyy-MM-dd HH:mm:ss";
    NSString *dateStr = [NSString stringWithFormat:@"%@",nowTimeStr];
    NSDateFormatter *dateF = [[NSDateFormatter alloc]init];
    [dateF setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *pubDate = [dateF dateFromString:dateStr];
    
    /*
     YearDifference,   //计算年差
     MonthlDifference, //计算月差
     DaysDifference,   //计算日差
     HourDifference,   //计算小时差
     MinuteDifference, //计算分差
     SecondsDifference //计算秒差
     **/
    
    NSInteger time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:YearDifference];
    NSString *timeStr;
    if (-time > 0) {
        timeStr = [NSDate stringWithOldFormat:timeFormart newsFormat:@"MM.dd" withString:nowTimeStr];
        
    }else{
        time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:MonthlDifference];
        if (-time > 0) {
            timeStr = [NSDate stringWithOldFormat:timeFormart newsFormat:@"MM.dd" withString:nowTimeStr];
        }else{
            time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:DaysDifference];
            if (-time > 0 && -time<7) {
                timeStr = [NSString stringWithFormat:@"%ld天前",(long)-time];
            }else if (-time > 7){
                timeStr = [NSDate stringWithOldFormat:timeFormart newsFormat:@"MM.dd" withString:nowTimeStr];
            }else{
                time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:HourDifference];
                if (-time > 0) {
                    timeStr = [NSString stringWithFormat:@"%ld小时前",(long)-time];
                }else{
                    time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:MinuteDifference];
                    if (-time > 0) {
                        timeStr = [NSString stringWithFormat:@"%ld分钟前",(long)-time];
                    }else{
                        time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:SecondsDifference];
                        if (-time > 0) {
                            timeStr = [NSString stringWithFormat:@"%ld秒前",(long)-time];
                        }else{
                            timeStr = [NSString stringWithFormat:@"刚刚"];
                        }
                    }
                }
            }
        }
    }
    return timeStr;
}


+ (NSString *)returnPositionInterstTimeStr:(NSString *)afterTimeStr{
    
    NSString *dateStr = [NSString stringWithFormat:@"%@",afterTimeStr];
    NSDateFormatter *dateF = [[NSDateFormatter alloc] init];
    //    [dateF setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [dateF setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *pubDate = [dateF dateFromString:dateStr];
    //    NSDate *endDate = [dateF dateFromString:afterTimeStr];
    
    NSInteger time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:YearDifference];
    NSString *timeStr;
    if (-time > 0) {
        NSDateFormatter *format = [[NSDateFormatter alloc]init];
        //        [format setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
        [format setDateFormat:@"yyyy-MM-dd HH:mm"];
        timeStr = [format stringFromDate:pubDate];//X年前
    }else{
        time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:MonthlDifference];
        if (-time > 0) {
            NSDateFormatter *format = [[NSDateFormatter alloc]init];
            //            [format setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
            if (-time >= 12) {
                [format setDateFormat:@"yyyy-MM-dd HH:mm"];
            }else{
                [format setDateFormat:@"MM-dd HH:mm"];
            }
            timeStr = [format stringFromDate:pubDate];
        }else{
            time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:DaysDifference];
            if (-time > 0) {
                if (-time > 7) {
                    NSDateFormatter *format = [[NSDateFormatter alloc]init];
                    //                    [format setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
                    [format setDateFormat:@"MM-dd HH:mm"];
                    timeStr = [NSString stringWithFormat:@"%@",[format stringFromDate:pubDate]];
                }else{
                    timeStr = [NSString stringWithFormat:@"%ld天前",(long)-time];
                }
            }else{
                time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:HourDifference];
                if (-time > 0) {
                    timeStr = [NSString stringWithFormat:@"%ld小时前",(long)-time];
                }else{
                    time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:MinuteDifference];
                    if (-time > 5) {
                        timeStr = [NSString stringWithFormat:@"%ld分钟前",(long)-time];
                    }else{
                        timeStr = [NSString stringWithFormat:@"刚刚"];
                    }
                }
            }
        }
    }
    return timeStr;
}

+ (NSString *)returnPositionTimeStr:(NSString *)afterTimeStr{
    
    NSString *dateStr = [NSString stringWithFormat:@"%@",afterTimeStr];
    NSDateFormatter *dateF = [[NSDateFormatter alloc]init];
    [dateF setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *pubDate = [dateF dateFromString:dateStr];
    
    /*
     YearDifference,   //计算年差
     MonthlDifference, //计算月差
     DaysDifference,   //计算日差
     HourDifference,   //计算小时差
     MinuteDifference, //计算分差
     SecondsDifference //计算秒差
     **/
    
    NSInteger time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:YearDifference];
    NSString *timeStr;
    if (-time > 0) {
        NSDateFormatter *format = [[NSDateFormatter alloc]init];
        [format setDateFormat:@"yyyy-MM-dd HH:mm"];
        timeStr = [format stringFromDate:pubDate];//X年前
    }else{
        time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:MonthlDifference];
        if (-time > 0) {//x月前
            NSDateFormatter *format = [[NSDateFormatter alloc]init];
            if (-time >= 12) {
                [format setDateFormat:@"yyyy-MM-dd HH:mm"];
            }else{
                [format setDateFormat:@"MM-dd HH:mm"];
            }
            
            
            timeStr = [format stringFromDate:pubDate];
        }else{
            time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:DaysDifference];
            if (-time > 0) {//x天前
                NSDateFormatter *format = [[NSDateFormatter alloc]init];
                if (-time == 1) {
                    [format setDateFormat:@"HH:mm"];
                    timeStr = [NSString stringWithFormat:@"昨天%@",[format stringFromDate:pubDate]];
                    NSLog(@"sa");
                }
                else if (-time == 2){
                    [format setDateFormat:@"HH:mm"];
                    timeStr = [NSString stringWithFormat:@"前天%@",[format stringFromDate:pubDate]];
                }else{
                    NSDateFormatter *format = [[NSDateFormatter alloc]init];
                    [format setDateFormat:@"MM-dd HH:mm"];
                    timeStr = [format stringFromDate:pubDate];//
                }
            }else{
                NSDateFormatter *format = [[NSDateFormatter alloc]init];
                [format setDateFormat:@"HH:mm"];
                timeStr = [NSString stringWithFormat:@"今天%@",[format stringFromDate:pubDate]];
                
                //                time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:HourDifference];
                //                if (-time > 0) {
                //                    timeStr = [NSString stringWithFormat:@"%ld小时前",(long)-time];
                //                }else{
                //                    time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:MinuteDifference];
                //                    if (-time > 0) {
                //                        timeStr = [NSString stringWithFormat:@"%ld分钟前",(long)-time];
                //                    }else{
                //                        time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:SecondsDifference];
                //                        if (-time > 0) {
                //                            timeStr = [NSString stringWithFormat:@"%ld秒前",(long)-time];
                //                        }else{
                //                            timeStr = [NSString stringWithFormat:@"刚刚"];
                //                        }
                //                    }
                //                }
            }
        }
    }
    return timeStr;
}

+(NSString *)returnTraveTimeStr:(NSString *)nowTimeStr{
    
    NSString *dateStr = [NSString stringWithFormat:@"%@",nowTimeStr];
    NSDateFormatter *dateF = [[NSDateFormatter alloc]init];
    [dateF setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *pubDate = [dateF dateFromString:dateStr];
    
    NSDateFormatter *dateRutnF = [[NSDateFormatter alloc]init];
    [dateRutnF setDateFormat:@"MM-dd"];
    NSString *dateRutn = [dateRutnF stringFromDate:pubDate];
    /*
     YearDifference,   //计算年差
     MonthlDifference, //计算月差
     DaysDifference,   //计算日差
     HourDifference,   //计算小时差
     MinuteDifference, //计算分差
     SecondsDifference //计算秒差
     **/
    
    NSInteger time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:YearDifference];
    NSString *timeStr;
    if (-time > 0) {
        timeStr = [NSString stringWithFormat:@"%@",dateRutn];
    }else{
        time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:MonthlDifference];
        if (-time > 0) {
            timeStr = [NSString stringWithFormat:@"%@",dateRutn];
        }else{
            time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:DaysDifference];
            if (-time > 0) {
                timeStr = [NSString stringWithFormat:@"%@",dateRutn];
            }else{
                time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:HourDifference];
                if (-time > 0) {
                    timeStr = [NSString stringWithFormat:@"%ld小时前",(long)-time];
                }else{
                    time = [NSDate nowDateDifferWithDate:pubDate TimeDifference:MinuteDifference];
                    if (-time > 3) {
                        timeStr = [NSString stringWithFormat:@"%ld分钟前",(long)-time];
                    }else{
                        timeStr = [NSString stringWithFormat:@"刚刚"];
                    }
                }
            }
        }
    }
    return timeStr;
}

+(NSData *)archivedDataWithRootObject:(id)respObject{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:respObject];
    return data;
}

+(id)unarchiveObjectWithData:(NSData *)data{
    id respObject = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return respObject;
}

#pragma ===========自定义富文本============
- (NSAttributedString*)setTextColor:(UIColor*)color textFont:(UIFont*)font{
    NSMutableAttributedString *txt = [[NSMutableAttributedString alloc] initWithString:self];
    [txt addAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:color} range:[self rangeOfString:self]];
    
    return txt;
}

+(NSString *)unicode2ISO88591:(NSString *)string {
    
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingISOLatin1);
    
    return [NSString stringWithCString:[string UTF8String] encoding:enc];
    
}

//加密
+ (NSString *)AES128Encrypt:(NSString *)plainText{
    
    char keyPtr[kCCKeySizeAES128+1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [@"gdscloudprisbest" getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    char ivPtr[kCCBlockSizeAES128+1];
    memset(ivPtr, 0, sizeof(ivPtr));
    [@"gdscloudprisbest" getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    
    NSData* data = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [data length];
    
    int diff = kCCKeySizeAES128 - (dataLength % kCCKeySizeAES128);
    NSInteger newSize = 0;
    
    if(diff > 0)
    {
        newSize = dataLength + diff;
    }
    
    char dataPtr[newSize];
    memcpy(dataPtr, [data bytes], [data length]);
    for(int i = 0; i < diff; i++)
    {
        dataPtr[i + dataLength] = 0x00;
    }
    
    size_t bufferSize = newSize + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    memset(buffer, 0, bufferSize);
    
    size_t numBytesCrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          0x0000,               //No padding
                                          keyPtr,
                                          kCCKeySizeAES128,
                                          ivPtr,
                                          dataPtr,
                                          sizeof(dataPtr),
                                          buffer,
                                          bufferSize,
                                          &numBytesCrypted);
    
    if (cryptStatus == kCCSuccess) {
        
        NSData *resultData = [NSData dataWithBytesNoCopy:buffer length:numBytesCrypted];
        
        
        return [resultData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    }
    
    
    
    free(buffer);
    return nil;
}


@end

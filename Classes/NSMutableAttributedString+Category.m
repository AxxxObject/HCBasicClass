

#import "NSMutableAttributedString+Category.h"
#import "UILabel+Category.h"
#import "UIButton+Category.h"

@implementation NSMutableAttributedString (Category)

+(NSMutableAttributedString *)attbutString:(NSString *)str value:(CGFloat)font color:(UIColor *)color rang:(NSRange)rang{
    
    NSMutableAttributedString *stringStr  = [[NSMutableAttributedString alloc] initWithString:str];
    //设置字号
    [stringStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:rang];
    //设置文字颜色
    [stringStr addAttribute:NSForegroundColorAttributeName value:color range:rang];
    
    return stringStr;
}
+ (NSMutableAttributedString *)urlValidationURL:(NSString *)string{
    
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSError *error;
    //识别链接的正则表达式
    NSString *regulaStr = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    
    //与string做对比并获得超链接在string中的位置
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSMutableArray *arrayOfAllMatches = [NSMutableArray arrayWithArray:[regex matchesInString:string options:0 range:NSMakeRange(0, [string length])]];
    
    NSMutableArray *urlStrs = [NSMutableArray array];
    
    NSMutableArray *urlRanges = [NSMutableArray array];
    
    // 行间距
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:8];
    
    NSDictionary *allPerferDic = @{
                                   NSForegroundColorAttributeName : [UIColor blackColor],
                                   NSFontAttributeName            : [UIFont systemFontOfSize:15.0f],
                                   NSParagraphStyleAttributeName  : paragraphStyle
                                   };
    
    NSMutableAttributedString *mas = [[NSMutableAttributedString alloc] initWithString:string];
    
    [mas setAttributes:allPerferDic range:NSMakeRange(0, string.length)];
    
    for (NSTextCheckingResult *match in arrayOfAllMatches){
        
        NSString* substringForMatch = [string substringWithRange:match.range];
        
        NSURL *url = [NSURL URLWithString:substringForMatch];
        if (!url) {continue;}
        [urlStrs addObject:[NSURL URLWithString:substringForMatch]];
        [urlRanges addObject:[NSValue valueWithRange:match.range]];
    }
    
    [urlRanges enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
        [mas addAttributes:@{NSForegroundColorAttributeName :[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} range:[obj rangeValue]];
        
    }];
    return mas;
}

+ (CGSize)sizeLabelWidth:(CGFloat)width
                    text:(NSString *)text
                    font:(UIFont *)font
             lineSpacing:(CGFloat)l_spacing
{
    if(width<=0 || text.length == 0){
        return CGSizeZero;
    }
    
    if(l_spacing<=0){
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 1000)];
        lab.text = text;
        lab.numberOfLines = 0;
        if(font){
            lab.font = font;
        }
        
        CGSize labSize = [lab sizeThatFits:lab.bounds.size];
        return labSize;
    }
    else
    {
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 1000)];
        lab.numberOfLines = 0;
        if(font){
            lab.font = font;
        }
        NSMutableAttributedString *mAttriStr = [[NSMutableAttributedString alloc] initWithString:text];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = l_spacing;
        [mAttriStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, text.length)];
        lab.attributedText = mAttriStr;
        
        CGSize labSize = [lab sizeThatFits:lab.bounds.size];
        return labSize;
    }
}
+(NSAttributedString *)attributedString:(NSString *)string space:(NSInteger)width{
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithData:[[NSString stringWithFormat:@"%@",string] dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    
    NSMutableParagraphStyle *para = [[NSMutableParagraphStyle alloc] init];
    para.lineSpacing = 5;
    para.paragraphSpacing = 10;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:para range:NSMakeRange(0, attributedString.length)];
    
    if (attributedString.size.width>[UIScreen mainScreen].bounds.size.width - width) {
        [attributedString enumerateAttribute:NSAttachmentAttributeName inRange:NSMakeRange(0, attributedString.length) options:0 usingBlock:^(id  _Nullable value, NSRange range, BOOL * _Nonnull stop) {
            NSTextAttachment *attachment = value;
            CGFloat height = attachment.bounds.size.height*(([UIScreen mainScreen].bounds.size.width-width)/attachment.bounds.size.width);
            attachment.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-width, height);
        }];
    }
    
    
    return attributedString;
}

+ (NSString *)attriToStrWithAttri:(NSAttributedString *)attri{
    NSDictionary *tempDic = @{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute:[NSNumber numberWithInt:NSUTF8StringEncoding]};
    NSData *htmlData = [attri dataFromRange:NSMakeRange(0, attri.length) documentAttributes:tempDic error:nil];
    return [[NSString alloc] initWithData:htmlData encoding:NSUTF8StringEncoding];
}

+(NSMutableAttributedString *)insertImg:(UIImage *)img rect:(CGRect)rect :(NSMutableAttributedString *)att insertIndex:(NSInteger)index{
    //设置Attachment
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    //使用一张图片作为Attachment数据
    attachment.image = img;
    //这里bounds的x值并不会产生影响
    attachment.bounds = rect;
        
    NSAttributedString *attributed = [NSAttributedString attributedStringWithAttachment:attachment];
    
    [att insertAttributedString:attributed atIndex:index];
    return att;
}


+(NSAttributedString *)setText:(NSString *)text LineSpacing:(CGFloat)lineSpacing{
    
    NSMutableAttributedString *attriubutedString = [[NSMutableAttributedString alloc]initWithString:text];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    
    [paragraphStyle setLineSpacing:lineSpacing];
    
    [attriubutedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, text.length)];
    
    return attriubutedString;
}


//设置字符串颜色
+(NSAttributedString *)setText:(NSString *)str FontNumber:(CGFloat)font AndRange:(NSRange)range AndColor:(UIColor *)vaColor
{
    
    NSMutableAttributedString *stringStr = [[NSMutableAttributedString alloc] initWithString:str];
    //设置字号
    
    [stringStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:range];
    //设置文字颜色
    [stringStr addAttribute:NSForegroundColorAttributeName value:vaColor range:range];
    
    return stringStr;
}

/**设置部分文本颜色*/
+ (NSMutableAttributedString *)changeTextColorWithColor:(UIColor *)color string:(NSString *)str andSubString:(NSArray *)subStringArr{
    
    //把字符串  转位 富文本
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:str];
    
    for (NSString *string in subStringArr) {
        //获取某个子字符串在某个总字符串中位置数组
        NSMutableArray *array = [self getRangeWithTotalString:str SubString:string];
        
        //
        for (NSNumber *rangeNum in array) {
            NSRange range = [rangeNum rangeValue];
            [attributedString addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
    }
    return attributedString;

}


+ (NSMutableArray *)getRangeWithTotalString:(NSString * __nullable)totalString SubString:(NSString * __nullable)subString {
    
    NSMutableArray *arrayRanges = [NSMutableArray array];
    
    if (subString == nil && [subString isEqualToString:@""]) {
        return nil;
    }
    
    NSRange rang = [totalString rangeOfString:[NSString stringWithFormat:@"%@",subString]];
    
    if (rang.location != NSNotFound && rang.length != 0) {
        
        [arrayRanges addObject:[NSNumber valueWithRange:rang]];
        
        NSRange      rang1 = {0,0};
        NSInteger location = 0;
        NSInteger   length = 0;
        
        for (int i = 0;; i++) {
            
            if (0 == i) {
                
                location = rang.location + rang.length;
                length = totalString.length - rang.location - rang.length;
                rang1 = NSMakeRange(location, length);
            } else {
                
                location = rang1.location + rang1.length;
                length = totalString.length - rang1.location - rang1.length;
                rang1 = NSMakeRange(location, length);
            }
            
            rang1 = [totalString rangeOfString:[NSString stringWithFormat:@"%@",subString] options:NSCaseInsensitiveSearch range:rang1];
            
            if (rang1.location == NSNotFound && rang1.length == 0) {
                
                break;
            } else {
                
                [arrayRanges addObject:[NSNumber valueWithRange:rang1]];
            }
        }
        
        return arrayRanges;
    }
    
    return nil;
}


@end

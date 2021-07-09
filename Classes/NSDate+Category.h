

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TimeDifference) {
    YearDifference,   //计算年差
    MonthlDifference, //计算月差
    DaysDifference,   //计算日差
    HourDifference,   //计算小时差
    MinuteDifference, //计算分差
    SecondsDifference //计算秒差
};

@interface NSDate (Category)

/**
 *  时间戳转成字符串
 *  @param timeIntervalSince1970  时间戳
 *  @param formatter  返回的时间格式
 *  @return 时间字符串
 */
+(NSString *)timeIntervalSince1970:(NSString *)timeIntervalSince1970 dateFormatter:(NSString *)formatter;

/**
 *  当前 时间的字符串
 */
+ (NSString *)stringCurrentTime;

/**
 *  获取当前之前的时间
 *  @param year  年
 *  @param Month  月
 *  @param day  日
 *  @param formatter  时间格式
 *  @return 时间
 */
+(NSString *)afterYeartime:(NSUInteger)year afterMonth:(NSUInteger)Month afterDay:(NSInteger)day dateFormatter:(NSString *)formatter;

/**
 *  两个时间的差    开始时间   结束时间
 *  @param startDate  开始的时间
 *  @param endDate  结束的时间
 *  @return 返回时间
 */
+ (NSTimeInterval)timeIntervalSincestartDate:(NSDate *)startDate  endDate:(NSDate *)endDate;

/**
 *  获取时间差值  截止时间-当前时间  时间格式yyyy-MM-dd HH:mm:ss
 *  @param nowDateStr : 当前时间
 *  @param deadlineStr : 截止时间
 *  @return 返回时间
 */
+(NSInteger)getDateDifferenceWithNowDateStr:(NSString*)nowDateStr deadlineStr:(NSString*)deadlineStr;

/**
 *  获取日
 *  @param date 传入时间
 *  @return 返回距离当前时间多少日  前面为负  后面为正
 */
- (NSInteger)day:(NSDate *)date;

/**
 *  获取月
 *  @param date 传入时间
 *  @return 返回距离当前时间多少月  前面为负  后面为正
 */
- (NSInteger)month:(NSDate *)date;

/**
 *  获取年
 *  @param date 传入时间
 *  @return 返回距离当前时间多少年  前面为负  后面为正
 */
- (NSInteger)year:(NSDate *)date;

/**
 *  获取当月第一天周几
 *  @param date 传入时间
 *  @return 返回
 */
- (NSInteger)firstWeekdayInThisMonth:(NSDate *)date;

/**
 *  获取当前月有多少天
 *  @param date 传入时间
 *  @return 返回
 */
- (NSInteger)totaldaysInMonth:(NSDate *)date;

/**
 *  根据日期获取是周几
 *  @param date 传入时间
 *  @return 返回 字符串
 */
-(NSString *)dateWithTimeWeek:(NSDate *)date;

/**
 *  获取当前月的第一天和最后一天
 *  @param dateStr 传入时间 格式为yyyy-MM-dd
 *  @return 返回 数组 第一条的日期和最后一天的日期
 */
+ (NSArray *)getMonthFirstAndLastDayWith:(NSString *)dateStr;

#pragma mark -- 获取当前周的第一天日期和最后一天日期
/**
 *  当前周的日期范围
 *  @return 字符串
 */
- (NSString *)currentNowDateWeek;

/**
 *  计算和当前时间差多少
 *  @param date  二进制
 *  @param timeDifference  计算类型
 *  @return 数字
 */
+(NSInteger)nowDateDifferWithDate:(NSDate *)date TimeDifference:(TimeDifference)timeDifference;

/**
 *  返回时间
 *  @param formatter  格式
 *  @return 二进制
 */
- (NSDate *)dateWithFormatter:(NSString *)formatter;

/**
 *  返回时间
 *  @param format  格式
 *  @return 字符串
 */
- (NSString *)stringWithFormat:(NSString *)format;

/**
 *  转换时间格式
 *  @param Oldformat  数据的格式
 *  @param newsFormat  需要的时间格式
 *  @return 字符串
 */
+(NSString *)stringWithOldFormat:(NSString *)Oldformat newsFormat:(NSString *)newsFormat withString:(NSString *)string;

@end

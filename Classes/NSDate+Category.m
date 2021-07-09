

#import "NSDate+Category.h"

@implementation NSDate (Category)
+(NSString *)timeIntervalSince1970:(NSString *)timeIntervalSince1970 dateFormatter:(NSString *)formatter{
    NSTimeInterval interval = [timeIntervalSince1970 doubleValue] / 1000.0;
    NSDate *timeDate = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *dateF = [[NSDateFormatter alloc]init];
    [dateF setDateFormat:formatter];
    
    NSString *timeStr = [dateF stringFromDate:timeDate];
    
    return timeStr;
    
}

+ (NSString *)stringCurrentTime{
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    return currentDateStr;
    
}

+(NSString *)afterYeartime:(NSUInteger)year afterMonth:(NSUInteger)Month afterDay:(NSInteger)day dateFormatter:(NSString *)formatter{
    //得到当前的时间
    NSDate * mydate = [NSDate date];
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
   // NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];

    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *comps = nil;
    
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitMonth fromDate:mydate];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    [adcomps setYear:year];
    
    [adcomps setMonth:Month];
    
    [adcomps setDay:day];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:mydate options:0];
    NSString *beforDate = [dateFormatter stringFromDate:newdate];
    
    return beforDate;
}
/**
 *  获取时间差值  截止时间-当前时间
 *  nowDateStr : 当前时间
 *  deadlineStr : 截止时间
 *  @return 时间戳差值
 */
+ (NSInteger)getDateDifferenceWithNowDateStr:(NSString*)nowDateStr deadlineStr:(NSString*)deadlineStr {
    
    NSInteger timeDifference = 0;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yy-MM-dd HH:mm:ss"];
    NSDate *nowDate = [formatter dateFromString:nowDateStr];
    NSDate *deadline = [formatter dateFromString:deadlineStr];
    NSTimeInterval oldTime = [nowDate timeIntervalSince1970];
    NSTimeInterval newTime = [deadline timeIntervalSince1970];
    timeDifference = newTime - oldTime;
    
    return timeDifference;
}

+ (NSTimeInterval)timeIntervalSincestartDate:(NSDate *)startDate  endDate:(NSDate *)endDate;
{
    //创建日期格式化对象
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    //创建了两个日期对象
    NSDate *date1= endDate;
    NSDate *date2 = startDate;
    
    
    //取两个日期对象的时间间隔：
    //这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:typedef double NSTimeInterval;
    NSTimeInterval time=[date2 timeIntervalSinceDate:date1];
    
    return  time;
}

/**
 *实现部分
 */
#pragma mark -- 获取日
- (NSInteger)day:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return components.day;
}

#pragma mark -- 获取月
- (NSInteger)month:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return components.month;
}


#pragma mark -- 获取年
- (NSInteger)year:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return components.year;
}

#pragma mark -- 获得当前月份第一天星期几
- (NSInteger)firstWeekdayInThisMonth:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];

    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday) fromDate:date];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    //若设置从周日开始算起则需要减一,若从周一开始算起则不需要减
    return firstWeekday - 1;

}
#pragma mark -- 获取当前月共有多少天

- (NSInteger)totaldaysInMonth:(NSDate *)date{
    NSRange daysInLastMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return daysInLastMonth.length;
}

#pragma mark -- 获取当前月的第一天和最后一天
+ (NSArray *)getMonthFirstAndLastDayWith:(NSString *)dateStr{
    
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    NSDate *newDate=[format dateFromString:dateStr];
    double interval = 0;
    NSDate *firstDate = nil;
    NSDate *lastDate = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    BOOL OK = [calendar rangeOfUnit:NSCalendarUnitMonth startDate:& firstDate interval:&interval forDate:newDate];
    
    if (OK) {
        lastDate = [firstDate dateByAddingTimeInterval:interval - 1];
    }else {
        return @[@"",@""];
    }
    
    NSDateFormatter *myDateFormatter = [[NSDateFormatter alloc] init];
    [myDateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *firstString = [myDateFormatter stringFromDate: firstDate];
    NSString *lastString = [myDateFormatter stringFromDate: lastDate];
    return @[firstString, lastString];
}

//根据时间获取当前是周几
-(NSString *)dateWithTimeWeek:(NSDate *)date{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDate *now = date;
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    calendar.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    
    comps = [calendar components:unitFlags fromDate:now];
    
    long week;
    
//    if ([ISWeekFirst isEqualToString:@"1"]) {
//        week = [comps weekday];
//    }else{
        week = [comps weekday]-1;
 //   }
    if (week == 0) {
        return @"日";
    }else if (week == 1){
        return @"一";
    }else if (week == 2){
        return @"二";
    }else if (week == 3){
        return @"三";
    }else if (week == 4){
        return @"四";
    }else if (week == 5){
        return @"五";
    }else if (week == 6){
        return @"六";
    }
    
    
    return @"";
}

+(NSInteger)nowDateDifferWithDate:(NSDate *)date TimeDifference:(TimeDifference)timeDifference{
    //日期格式设置,可以根据想要的数据进行修改 添加小时和分甚至秒
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    
    NSTimeZone *zone=[NSTimeZone systemTimeZone];//得到时区，根据手机系统时区设置（systemTimeZone）
    
    NSDate *nowDate=[NSDate date];//获取当前日期
    
    /*GMT：格林威治标准时间*/
    //格林威治标准时间与系统时区之间的偏移量（秒）
    NSInteger nowInterval=[zone secondsFromGMTForDate:nowDate];
    
    //将偏移量加到当前日期
    NSDate *nowTime=[nowDate dateByAddingTimeInterval:nowInterval];
    
    //传入日期设置日期格式
    NSString *stringDate = [dateFormatter stringFromDate:date];
    NSDate *yourDate = [dateFormatter dateFromString:stringDate];
    
    //格林威治标准时间与传入日期之间的偏移量
    NSInteger yourInterval = [zone secondsFromGMTForDate:yourDate];
    
    //将偏移量加到传入日期
    NSDate *yourTime = [yourDate dateByAddingTimeInterval:yourInterval];
    
    //time为两个日期的相差秒数
    NSTimeInterval time=[yourTime timeIntervalSinceDate:nowTime];
    
    //最后通过秒数time计算时间相差 几年？几月？几天？几时？几分钟？几秒？
    NSInteger div = 1.0;
    switch (timeDifference) {
        case SecondsDifference:
            div = 1.0;
            break;
        case MinuteDifference:
            div = 60.0;
            break;
        case HourDifference:
            div = 60.0 * 60.0;
            break;
        case DaysDifference:
            div = 60.0 * 60.0 * 24;
            break;
        case MonthlDifference:
            div = 60.0 * 60.0 * 24 * 30;
            break;
        case YearDifference:
            div = 60.0 * 60.0 * 24 * 30 * 365;
            break;
    }
    time = round(time/div);//最后选择四舍五入
    return (NSInteger)time;
}

/**
 当前周的日期范围
 
 @return 结果字符串
 */
- (NSString *)currentNowDateWeek{
    // 默认周一为第一天，1.周日 2.周一 3.周二 4.周三 5.周四 6.周五  7.周六
    return [self currentScopeWeek:2 dateFormat:@"YYYY-MM-dd"];
}
/**
 当前周的日期范围
 
 @param firstWeekday 星期起始日
 @param dateFormat 日期格式
 @return 结果字符串
 */
- (NSString *)currentScopeWeek:(NSUInteger)firstWeekday dateFormat:(NSString *)dateFormat
{
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    // 1.周日 2.周一 3.周二 4.周三 5.周四 6.周五  7.周六
    calendar.firstWeekday = firstWeekday;
    
    // 日历单元
    unsigned unitFlag = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday;
    unsigned unitNewFlag = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *nowComponents = [calendar components:unitFlag fromDate:nowDate];
    // 获取今天是周几，需要用来计算
    NSInteger weekDay = [nowComponents weekday];
    // 获取今天是几号，需要用来计算
    NSInteger day = [nowComponents day];
    // 计算今天与本周第一天的间隔天数
    NSInteger countDays = 0;
    // 特殊情况，本周第一天firstWeekday比当前星期weekDay小的，要回退7天
    if (calendar.firstWeekday > weekDay) {
        countDays = 7 + (weekDay - calendar.firstWeekday);
    } else {
        countDays = weekDay - calendar.firstWeekday;
    }
    // 获取这周的第一天日期
    NSDateComponents *firstComponents = [calendar components:unitNewFlag fromDate:nowDate];
    [firstComponents setDay:day - countDays];
    NSDate *firstDate = [calendar dateFromComponents:firstComponents];
    
    // 获取这周的最后一天日期
    NSDateComponents *lastComponents = firstComponents;
    [lastComponents setDay:firstComponents.day + 6];
    NSDate *lastDate = [calendar dateFromComponents:lastComponents];
    
    // 输出
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    NSString *firstDay = [formatter stringFromDate:firstDate];
    NSString *lastDay = [formatter stringFromDate:lastDate];
    
    return [NSString stringWithFormat:@"%@ - %@",firstDay,lastDay];
}

-(NSDate *)dateWithFormatter:(NSString *)formatter {
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = formatter;
    NSString *selfStr = [fmt stringFromDate:self];
    return [fmt dateFromString:selfStr];
}

#pragma mark - String Properties
- (NSString *) stringWithFormat: (NSString *) format
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    //    formatter.locale = [NSLocale currentLocale]; // Necessary?
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}


+(NSString *)stringWithOldFormat:(NSString *)Oldformat newsFormat:(NSString *)newsFormat withString:(NSString *)string{
    NSDateFormatter *dataF = [[NSDateFormatter alloc]init];
    [dataF setDateFormat:Oldformat];
    
    NSDate *date = [dataF dateFromString:string];
    
    [dataF setDateFormat:newsFormat];
    
    return [dataF stringFromDate:date];
    
}

@end

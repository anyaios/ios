#import "DoomsdayMachine.h"

@interface DoomsdayMachine()

@property (nonatomic, readwrite) NSInteger years;
@property (nonatomic, readwrite) NSInteger months;
@property (nonatomic, readwrite) NSInteger weeks;
@property (nonatomic, readwrite) NSInteger days;
@property (nonatomic, readwrite) NSInteger hours;
@property (nonatomic, readwrite) NSInteger minutes;
@property (nonatomic, readwrite) NSInteger seconds;



-(instancetype)initDate:(NSDateComponents*)components;

@end

@implementation DoomsdayMachine
-(instancetype)initDate:(NSDateComponents*)components {
    self = [super init];
//    _years = labs(components.year);
//    _months = labs(components.month);
//    //self.weeks = components.weekOfYear;
//    _days = labs(components.day);
//    _hours = labs(components.hour);
//    _minutes = labs(components.minute);
//    _seconds = labs(components.second);
    
    _years = components.year;
    _months = components.month;
            //self.weeks = components.weekOfYear;
    _days = components.day;
    _hours = components.hour;
    _minutes = components.minute;
    _seconds = components.second;
    return self;
}
// your code here
- (id<AssimilationInfo>)assimilationInfoForCurrentDateString:(NSString *)dateString {
    // 14 August 2208 03:13:37
    // 2019:03:26@00\\00/12
    NSDateFormatter *date = [[NSDateFormatter new] autorelease];
    [date setDateFormat: @"yyyy:MM:dd@ss\\mm/HH"];
    
    NSDate *doomDate = [date dateFromString :@"2208:08:14@37\\13/03"];
    NSDate *today = [date dateFromString:dateString];
    
   // NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSCalendar *doomCalendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    NSDateComponents *components = [doomCalendar components:(unitFlags) fromDate:today toDate:doomDate options: 0];
    
    return [self initDate: components];
}


- (NSString *)doomsdayString {
    NSDateFormatter *date = [[NSDateFormatter new] autorelease];
    [date setDateFormat:@"yyyy:MM:dd@ss\\mm/HH"];
    NSDate *doomDate = [date dateFromString:@"2208:08:14@37\\13/03"];
    [date setDateFormat:@"EEEE, MMMM dd, yyyy"];
    NSString *humanReadable = [date stringFromDate: doomDate];
    return humanReadable;
}
@end

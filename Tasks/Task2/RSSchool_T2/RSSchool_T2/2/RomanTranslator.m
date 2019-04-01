#import "RomanTranslator.h"

@implementation RomanTranslator


- (NSString *)arabicFromRoman:(NSString *)romanString {

    NSDictionary *symbol = @{@"I" : @"1",
                             @"V" : @"5",
                             @"X" : @"10",
                             @"L" : @"50",
                             @"C" : @"100",
                             @"D" : @"500",
                             @"M" : @"1000"};
    NSMutableArray *stringArray = [NSMutableArray array];
    for (int i = 0; i < [romanString length]; i += 1) {
        NSString *str = [romanString substringWithRange: NSMakeRange(i, 1)];
        [stringArray setObject: str atIndexedSubscript: i];
    }
    
    int number = 0;
    for (int i = 0; i < romanString.length; i +=1 ) {
        if ((i + 1 < stringArray.count) && ([[symbol objectForKey: stringArray[i]] integerValue] < [[symbol objectForKey: stringArray[i + 1]] integerValue])) {
            number -= [[symbol objectForKey: stringArray[i]] integerValue];
        } else  {
            number += [[symbol objectForKey: stringArray[i]] integerValue];
        }
    }
    
    NSLog(@"%d", number);
    NSString *intStr = [NSString stringWithFormat:@"%d", number ];
    return intStr;
}
- (NSString *)romanFromArabic:(NSString *)arabicString {
    
    NSArray *numbers = @[@"1", @"4", @"5", @"9", @"10", @"50", @"90", @"100", @"500", @"900", @"1000"];
    NSArray *romans = @[@"I", @"IV", @"V", @"IX", @"X", @"L", @"XC", @"C", @"CD", @"D", @"M"];
    
    NSMutableString *roman = [[NSMutableString new] autorelease];
    long n = [arabicString integerValue];
    while (n > 0) {
        for (long i = 0; i < numbers.count; i += 1) {
            if (n < [numbers[i] integerValue]){
                n -= [numbers[i - 1] integerValue];
                //[roman appendString:[roman stringByAppendingString: romans[i - 1]]];
                [roman appendString:romans[i - 1]];
                break;
            }
        }
    }
    
    
    return roman;
}

@end


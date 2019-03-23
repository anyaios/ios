#import "SummArray.h"

@implementation SummArray

// Complete the summArray function below.
- (NSNumber *)summArray:(NSArray *)array {
    
    long size = [array count];
    int summ = 0;
    
    for (int i = 0; i < size; i += 1) {
        summ += [array[i] intValue];
    }
    return [NSNumber numberWithLong: summ];
    
}

@end

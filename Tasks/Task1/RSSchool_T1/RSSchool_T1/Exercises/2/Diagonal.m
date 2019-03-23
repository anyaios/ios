#import "Diagonal.h"

@implementation Diagonal

// Complete the diagonalDifference function below.
- (NSNumber *) diagonalDifference:(NSArray *)array {
    long size = [array count];
    int sumOne = 0;
    int sumTwo = 0;
    
    for (int i = 0; i < size; i += 1) {
        if (([[array[i] componentsSeparatedByString: @" "][i] intValue] <= 100) && ([[array[i] componentsSeparatedByString: @" "][i] intValue] >= -100)) {
            sumOne += [[array[i] componentsSeparatedByString: @" "][i] intValue];
            sumTwo += [[array[i] componentsSeparatedByString: @" " ][size - 1 - i] intValue];
        }
        else {
            NSLog(@"constraints error!");
        }
    }
    NSLog(@"%@", array);
    int absoluteV = abs(sumOne - sumTwo);
    NSLog(@"%d", absoluteV);
    return [NSNumber numberWithInt: absoluteV];
}

@end

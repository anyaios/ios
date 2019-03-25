#import "Sorted.h"

@implementation ResultObject
@end

@implementation Sorted

// Complete the sorted function below.
- (ResultObject*)sorted:(NSString*)string {
    ResultObject *value = [ResultObject new];
    
    NSArray *numbers = [string componentsSeparatedByString:@" "];
    //NSMutableArray *copy = [numbers mutableCopy];
    long n = numbers.count;
    
    int left = -1;
    int right = -1;
    int counter = 0;
    
    //BOOL swapped;
    
    
    for (int i = 0; i < n - 1; i += 1) {
        if ([numbers[i] intValue] > [numbers[i + 1] intValue]) {
            counter += 1;
            if (left == -1) {
                left = i;
                right = i + 1;
            } else  {
                right = i + 1;
            }
        }
    }
    
    
    if (left == -1 && right == -1) {
        value.status = YES;
    } else {
        if (counter < 3) {
            
            BOOL condition = [numbers[right] intValue] <= [numbers[left + 1] intValue] && (left == 0 || [numbers[left - 1] intValue] <= [numbers[right] intValue]);
            BOOL conditionTwo = [numbers[left] intValue] >= [numbers[right - 1] intValue] && (right == n - 1 || [numbers[right + 1] intValue] >= [numbers[left] intValue]);
            
            if (condition && conditionTwo){
                value.status = YES;
                value.detail = [NSString stringWithFormat:@"swap %d %d", left + 1, right + 1];
            } else {
                value.status = NO;
            }
            
        } else {
            value.status = YES;
            
            for (int i = left; i < right; i += 1) {
                if ([numbers[i] intValue] < [numbers[i + 1] intValue]) {
                    value.status = NO;
                    break;
                }
            }
            if (value.status == YES) {
                value.detail = [NSString stringWithFormat:@"reverse %d %d", left + 1, right + 1];
            } else {
                value.status = NO;
            }
        }
    }
    
    
    return value;
}

@end

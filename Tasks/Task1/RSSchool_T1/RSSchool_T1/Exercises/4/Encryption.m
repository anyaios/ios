#import "Encryption.h"

@implementation Encryption

// Complete the encryption function below.
- (NSString *)encryption:(NSString *)string {
    
    //removing spaces
    //string = [string stringByReplacingOccurrencesOfString: @" " withString:@""];
    long size = [string length];
    int row = floor(sqrt(size));
    int column = ceil(sqrt(size));
    //int addition = (column * row) % size;
    //NSArray *stringArray = @[];
    NSMutableArray *stringArray = [NSMutableArray new];
    
    //constraints
    if (column * row < [string length] && [string length] <= 81){
        row += 1;
    }
    if ([[string stringByReplacingOccurrencesOfString: @" " withString:@""] length] <= 81) {
        NSLog(@"The length is more than 81!");
    }
    
    //filling array
    for (int i = 0; i < column ; i += 1) {
        NSMutableString *newString = [[NSMutableString alloc] initWithCapacity: row];
        for (int j = 0; j < row; j += 1) {
            
            if ((i + (j * column )) < [string length]) {
                NSString *myChar = [string substringWithRange: NSMakeRange(i + (j * column ), 1)];
                [newString appendString: myChar];
            }
        }
        [stringArray addObject: newString];
    }
    
    NSLog(@"%@", stringArray);
    return [stringArray componentsJoinedByString:@" "];
}

@end

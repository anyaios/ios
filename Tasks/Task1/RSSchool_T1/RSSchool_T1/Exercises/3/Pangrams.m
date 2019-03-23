#import "Pangrams.h"

@implementation Pangrams

// Complete the pangrams function below.

//подход такой что я из строки делаю массив символов в алфавитном порядке и сравниваю с алфавитом alphabet
- (BOOL)pangrams:(NSString *)string {
    NSArray *alphabet = @[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z"];
    
    // modify string wihout spacing
    string = [[string stringByReplacingOccurrencesOfString:@" " withString:@""] lowercaseString];
    
    //split string by creating array
    NSMutableArray *myArray = [NSMutableArray array];
    for (int i = 0; i < [string length]; i += 1) {
        NSString *str = [string substringWithRange: NSMakeRange(i, 1)];
        [myArray setObject: str atIndexedSubscript: i];
    }
    // NSLog(@"%@", myArray);
    //NSLog([myArray count]);
    
    //array without duplicate elementes
    NSMutableArray *abcArray = [NSMutableArray array];
    
    for (id obj in myArray) {
        if (![abcArray containsObject:obj]) {
            [abcArray addObject:obj];
        }
    }
    
    // sorted array by alphabet
    NSArray *sortedArray = [abcArray sortedArrayUsingSelector: @selector (localizedCaseInsensitiveCompare:)];
    //*sortedArray = [abcArray sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"%@", sortedArray);
    
    
    if ([alphabet isEqualToArray: sortedArray]) {
        NSLog(@"pangram");
        return YES;
    }
    else {
        
        NSLog(@"not pangram");
        
    }
    return NO;
}

@end

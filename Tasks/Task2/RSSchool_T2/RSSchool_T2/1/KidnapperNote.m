#import "KidnapperNote.h"

@implementation KidnapperNote
- (BOOL) checkMagazine:(NSString *)magaine note:(NSString *)note {
    
    
    NSArray *mytext = [[magaine lowercaseString] componentsSeparatedByString: @" "];
    NSArray *myransom = [[note lowercaseString] componentsSeparatedByString: @" "];
    BOOL flag;

    
//    NSSet *text = [NSSet setWithArray: mytext];
//    NSSet *ransom = [NSSet setWithArray: myransom];
    NSCountedSet *textCount = [NSCountedSet setWithArray:mytext];
    NSCountedSet *ransomCount = [NSCountedSet setWithArray:myransom];
    
    if ([ransomCount isSubsetOfSet: textCount] == YES){
        return flag = YES;
    } else {
        return flag = NO;
    }
    
    //[myransom release];
    //[text release];
    
    return flag;
}
@end

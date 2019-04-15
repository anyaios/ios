#import "ArrayPrint.h"

@implementation NSArray (MyArray)

+ (int) myChoices:(id) myobject {
    if ([myobject isKindOfClass:[NSNumber class]]){
        return numbers;
    }
    if ([myobject isKindOfClass:[NSNull class]]) {
        return nulls;
    }
    if ([myobject isKindOfClass:[NSArray class]]) {
        return arrays;
    }
    if ([myobject isKindOfClass:[NSString class]]) {
        return strings;
    }
    return unsupported;
    
}

+ (NSString*)myStringArray:(id)obj {
    NSMutableString *mystring = [[NSMutableString new] autorelease];
    switch ([self myChoices:obj]) {
        case numbers:
            [mystring appendFormat:@"%@", obj];
            [mystring appendString:@","];
            
            break;
        case nulls:
            [mystring appendString: @"null"];
            [mystring appendString:@","];
            
            break;
        case arrays:
            for (id i in obj) {
                [mystring appendString: [self myStringArray:i]];
            }
            [mystring insertString:@"[" atIndex:0];
            [mystring insertString:@"]" atIndex:mystring.length];
            [mystring appendString:@","];
            
            break;
        case strings:
            [mystring appendFormat:@"\"%@\"", obj];
            [mystring appendString:@","];
            
            break;
        default:
            [mystring appendString:@"unsupported"];
            [mystring appendString:@","];
            
            break;
    }
    return mystring;
}

- (NSString *)printed{
    NSArray *selfArray = self;
    NSMutableString *mystring = [[NSMutableString new] autorelease];
    for (int i = 0; i < selfArray.count; i += 1) {
        [mystring appendString: [NSArray myStringArray: selfArray[i]]];
    }
    
    [mystring insertString:@"[" atIndex:0];
    [mystring insertString:@"]" atIndex:mystring.length];
    NSRange myRange = NSMakeRange(0, mystring.length);
    [mystring replaceOccurrencesOfString:@",]" withString:@"]" options:0 range: myRange];
    return mystring;
}

@end

@implementation NSArray (RSSchool_Extension_Name)
- (NSString *)print{
    return [self printed];
}
@end


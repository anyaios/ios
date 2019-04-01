#import "TinyURL.h"

@implementation TinyURL

- (NSURL *)encode:(NSURL *)originalURL {
    
    NSString *url = originalURL.absoluteString;
    
//    NSMutableCharacterSet *chars = NSCharacterSet.URLQueryAllowedCharacterSet.mutableCopy;
//    [chars removeCharactersInRange:NSMakeRange('&', 2)];
//     NSString *tinyUrl = [url stringByAddingPercentEncodingWithAllowedCharacters: chars];
    
    NSString *tinyUrl = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLUserAllowedCharacterSet]];
    [NSString stringWithFormat: @"http://tinyurl.com/api-create.php?url=%@", url];
    NSString *shortURL = [NSString stringWithContentsOfURL:[NSURL URLWithString:tinyUrl]
                                                  encoding:NSASCIIStringEncoding
                                                     error:nil];
    
    
    //NSLog(@"Long: %@ - Short: %@",url,shortURL);
    
    NSData *urlstr = [originalURL.absoluteString dataUsingEncoding: NSUTF8StringEncoding];
    NSString *shortenedURL = [urlstr base64EncodedStringWithOptions: 1];
    NSLog(@"encoded: %@", shortenedURL);
    
    return [NSURL URLWithString: shortenedURL];
 
}
            
- (NSURL *)decode:(NSURL *)shortenedURL {
    
    NSData *urldata = [[NSData alloc] initWithBase64EncodedString: shortenedURL.absoluteString options:1];
    NSString *originalURL = [[NSString alloc] initWithData:urldata encoding:NSUTF8StringEncoding];
    NSLog(@"decoded: %@", originalURL);
    return [NSURL URLWithString: originalURL];
}

@end

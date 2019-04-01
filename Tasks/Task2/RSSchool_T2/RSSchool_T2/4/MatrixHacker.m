#import "MatrixHacker.h"
// your code here

//- Example:
//Input: ["Jane Doe", "Delivery Guy", "Postman", "Neo", "Agent John", "Dog"]
//Output: [Character(name: "Agent Smith", isClone: true),
//         Character(name: "Agent Smith", isClone: true),
//         Character(name: "Agent Smith", isClone: true),
//         Character(name: "Neo", isClone: false),
//         Character(name: "Agent Smith", isClone: true),
//         Character(name: "Agent Smith", isClone: true)]
@interface MatrixHacker ()

@property id<Character>(^theBlock)(NSString*);

@end

@implementation MatrixHacker

- (void)injectCode:(id<Character> (^)(NSString *name))theBlock {
    
    self.theBlock = theBlock;
    
}

- (NSArray<id<Character>> *)runCodeWithData:(NSArray<NSString *> *)names {
    
    NSMutableArray<id<Character>> *arr = [[NSMutableArray new] autorelease];
    NSString *i;
    for (i in names) {
        id<Character> name = self.theBlock(i);
        [arr addObject: name];
    }
    
    return arr;
}
@end
//- (NSString *)name;
//- (BOOL)isClone;
//+ (instancetype)createWithName:(NSString *)name isClone:(BOOL)clone;

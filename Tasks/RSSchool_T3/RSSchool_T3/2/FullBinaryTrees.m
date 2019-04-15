#import "FullBinaryTrees.h"
// good luck
@interface NSTreeNode : NSObject
@property int val;
@property (nonatomic, assign) NSTreeNode *left;
@property (nonatomic, assign) NSTreeNode *right;
- (NSMutableArray*)getTree:(int)number;
- (id)initWithValue:(int)value;
@end
@implementation NSTreeNode
- (id)initWithValue:(int)val {
    
    self = [super init];
    if (self != nil) {
        self.val = val;
        self.left = NULL;
        self.right = NULL;
    }
    return self;
}

- (NSMutableArray*)getTree:(int)number{
    
    NSMutableArray *trees = [[NSMutableArray new] autorelease];
    if (number == 1) {
        NSTreeNode* node = [[NSTreeNode alloc] initWithValue:0];
        //node.val = 0;
        [trees addObject: node];
        return trees;
    }
    if (number % 2 == 0) return trees;
    
    for (int i = 1; i < number; i += 2) {
        NSMutableArray *nodeL = [self getTree:i];
        NSMutableArray *nodeR = [self getTree:number - 1 - i];
        for (int i = 0; i < nodeL.count; i += 1) {
            for (int j = 0; j < nodeR.count; j += 1) {
                NSTreeNode *node = [[NSTreeNode new] autorelease];
                node.val = 0;
                node.left = nodeL[i];
                node.right = nodeR[j];
                [trees addObject:node];
                NSLog(@"%@", node.left);
            }
        }
    }
    NSLog(@"%@", trees);
    return trees;
}


- (void)dealloc
{
    
    [super dealloc];
}

@end

@implementation FullBinaryTrees
- (NSString *)stringForNodeCount:(NSInteger)count{
    if (count == 1) {
        return @"[[0]]";
    } else if (count > 4){
        
        NSTreeNode *tree = [[NSTreeNode new] autorelease];
        NSMutableArray *res = [tree getTree:(int)count];
        return [res componentsJoinedByString:@""];
        
        //return [self performSelector:@selector(getTree:) withObject:(id)count];
    }
    //return [self performSelector:@selector(getTree:) withObject:(id)count];
    return @"[]";
}
@end

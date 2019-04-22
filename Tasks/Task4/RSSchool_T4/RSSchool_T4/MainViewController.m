//
//  MainViewController.m
//  RSSchool_T4
//
//  Created by Anna Ershova on 4/21/19.
//  Copyright © 2019 iOSLab. All rights reserved.
//

#import "MainViewController.h"

typedef enum flags {
    RU = 7,
    KZ = 77,
    MD = 373,
    AM = 374,
    BY = 375,
    UA = 380,
    TJ = 992,
    TM = 993,
    AZ = 994,
    KG = 996,
    UZ = 998
} Flags;

@interface MainViewController () <UITextFieldDelegate>
@property (nonatomic,retain) UITextField* phonefield;
@property (nonatomic,retain) UILabel *flag;
-(UILabel*)makeFlagview: (NSString*)imageName;
-(NSString*) changedNumberString:(NSString*)number : (NSString*)stringToChange;
@end
@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.grayColor;
    self.phonefield = [self makeTextField];
    self.flag = [self makeFlagview: @""];
    
}

-(UITextField*) makeTextField{
    
    UITextField *textField =  [[UITextField alloc] initWithFrame:CGRectMake(35, 200, 350, 50)];
    textField.layer.borderColor = [UIColor blackColor].CGColor;
    textField.layer.borderWidth = 2;
    textField.layer.cornerRadius = 5;
    textField.tag = 1111;
    textField.delegate = self;
    
    UIView *spacerView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)] autorelease];
    [textField setLeftViewMode:UITextFieldViewModeAlways];
    [textField setLeftView:spacerView];
    
    [textField setKeyboardType:UIKeyboardTypePhonePad];

    
    [self.view addSubview: textField];
    [textField release];
    return textField;
}


-(UILabel*)makeFlagview: (NSString*)imageName{
    
    UILabel *flagview = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 60, 40)];
    flagview.layer.borderWidth = 0;
    [self.phonefield addSubview: flagview];
    flagview.tag = 2222;
    [flagview release];
    
    
    NSTextAttachment *imageAttachment = [[[NSTextAttachment alloc] init] autorelease];
    NSString *str = imageName;
    
    imageAttachment.image = [UIImage imageNamed:str];
    CGFloat imageOffsetY = -1.0;
    
    imageAttachment.bounds = CGRectMake(0, imageOffsetY, imageAttachment.image.size.width, imageAttachment.image.size.height);
    NSAttributedString *attachmentString = [NSAttributedString attributedStringWithAttachment:imageAttachment];
    NSMutableAttributedString *completeText= [[NSMutableAttributedString alloc] initWithString:@""];
    [completeText appendAttributedString:attachmentString];
    flagview.attributedText=completeText;
    
    return flagview;
}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSArray *formatNumberArray = @[@"+ ### (##) ###-###",    //0
                                   @"+ ### (##) ###-##-##",  //1
                                   @"+ ### (###) ###-##-##", //2
                                   @"+ # (###) ###-##-##"]; //3
    NSString *formatStrings = @"+ ##########";
    
    if(!formatStrings) {
        return YES;
    }
    
    
    //    RU = 7,
    //    KZ = 77,
    //    MD = 373,
    //    AM = 374,
    //    BY = 375,
    //    UA = 380,
    //    TJ = 992,
    //    TM = 993,
    //    AZ = 994,
    //    KG = 996,
    //    UZ = 998
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if(range.length == 1 &&
       string.length < range.length &&
       [[textField.text substringWithRange:range] rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"0123456789"]].location == NSNotFound) {
        
        NSInteger location = newString.length - 1;
        if (location > 0) {
            for(; location > 0; location--)
            {
                if(isdigit([newString characterAtIndex:location])) {
                    break;
                }
            }
            newString = [newString substringToIndex:location];
        }
    }
    
    
    
    
    
    if ([textField.text containsString:@"+ 7"]){
        if ([textField.text containsString:@"+ 7 (7"]){
            //formatStrings = [formatNumberArray objectAtIndex: 3];
            [self makeFlagview:@"flag_KZ"];
        } else {
            [self makeFlagview:@"flag_RU"];
        }
        formatStrings = [formatNumberArray objectAtIndex: 3];
    } else
        if ([textField.text containsString:@"+ 77"]){
            formatStrings = [formatNumberArray objectAtIndex: 3];
            [self makeFlagview:@"flag_KZ"];
        } else
            if ([textField.text containsString:@"+ 373"]){
                formatStrings = [formatNumberArray objectAtIndex: 0];
                [self makeFlagview:@"flag_MD"];
            } else
                if ([textField.text containsString:@"+ 374"]){
                    formatStrings = [formatNumberArray objectAtIndex: 0];
                    [self makeFlagview:@"flag_AM"];
                } else
                    if ([textField.text containsString:@"+ 375"]){
                        formatStrings = [formatNumberArray objectAtIndex: 1];
                        [self makeFlagview:@"flag_BY"];
                    } else
                        if ([textField.text containsString:@"+ 380"]){
                            formatStrings = [formatNumberArray objectAtIndex: 1];
                            [self makeFlagview:@"flag_YA"];
                        } else
                            if ([textField.text containsString:@"+ 992"]){
                                formatStrings = [formatNumberArray objectAtIndex: 1];
                                [self makeFlagview:@"flag_TJ"];
                                
                            } else
                                if ([textField.text containsString:@"+ 993"]){
                                    formatStrings = [formatNumberArray objectAtIndex: 0];
                                    [self makeFlagview:@"flag_TM"];
                                    
                                } else
                                    if ([textField.text containsString:@"+ 994"]){
                                        formatStrings = [formatNumberArray objectAtIndex: 1];
                                        [self makeFlagview:@"flag_AZ"];
                                        
                                    } else
                                        if ([textField.text containsString:@"+ 996"]){
                                            formatStrings = [formatNumberArray objectAtIndex: 1];
                                            [self makeFlagview:@"flag_KG"];
                                            
                                        } else
                                            if ([textField.text containsString:@"+ 998"]){
                                                formatStrings = [formatNumberArray objectAtIndex: 1];
                                                [self makeFlagview:@"flag_UZ"];
                                                
                                            } else
                                                if ([textField.text containsString:@""]){
                                                    formatStrings = [formatNumberArray objectAtIndex: 1];
                                                    [self makeFlagview:@""];
                                                    
                                                }
                                                else {
                                                    
                                                    NSLog(@"%@", textField.text);
                                                    [self makeFlagview:@""];
                                                 
                                                }
    textField.text = [self changedNumberString:newString :formatStrings];
    
    
    return NO;
    
}

-(NSString*) changedNumberString:(NSString*)number : (NSString*)stringToChange{
    NSUInteger originalNum = 0;
    NSUInteger changedNum = 0;
    NSUInteger outputNum = 0;
    char outputString[([stringToChange length])];
    BOOL isChanged = NO;
    
    while (changedNum < [stringToChange length] && !isChanged) {
        char filterChar = [stringToChange characterAtIndex:changedNum];
        char originalChar = originalNum >= number.length ? '\0' : [number characterAtIndex:originalNum];
        switch (filterChar) {
            case '#':
                if (originalChar=='\0') {
                    
                    isChanged = YES;
                    break;
                }
                if (isdigit(originalChar)) {
                    outputString[outputNum] = originalChar;
                    originalNum += 1;
                    changedNum += 1 ;
                    outputNum += 1;
                }
                else {
                    originalNum += 1;
                }
                break;
            default:
                outputString[outputNum] = filterChar;
                outputNum += 1;
                changedNum += 1;
                if(originalChar == filterChar) {
                    originalNum += 1;
                }
                break;
        }
    }
    outputString[outputNum] = '\0';
    NSString *str = [NSString stringWithUTF8String:outputString];
    
    return str;
}
@end

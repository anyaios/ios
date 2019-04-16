#import "DateMachine.h"
typedef enum unitsCalendar{
    year = 0,
    month = 1,
    week = 2,
    day = 3,
    hour = 4,
    minute = 5,
    
    start = 6,
    step = 7,
    unit = 8
    
    
} Calendars;


@implementation DateMachine

- (void)viewDidLoad {
    [super viewDidLoad];
    // have fun
    self.view.backgroundColor = UIColor.grayColor;
    
    [self addButtonOne];
    [self addButtonTwo];
    //[self addLabel];
    
    UILabel *label = [self addLabel];
//    [self startDateField];
//    [self stepDateField];
//    [self unitDateField];
    UITextField *stepField = [self stepDateField];
    UITextField *startField = [self startDateField];
    UITextField *unitField = [self unitDateField];
    

    [self.view addSubview:stepField];
    [self.view addSubview:startField];
    [self.view addSubview:unitField];
    
    startField.tag = 11;
    stepField.tag = 22;
    unitField.tag = 33;
    label.tag = 44;
    
}

-(UIButton*)addButtonOne{
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(270, 400, 100, 50)];
    [button setTitle:@"Add" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    button.backgroundColor = [UIColor whiteColor];
    button.layer.cornerRadius = 6;
    button.layer.borderWidth = 2;
    button.layer.borderColor = [[UIColor blackColor] CGColor];
    [self.view addSubview: button];
    
    [button addTarget:self action:@selector(buttonTapped:) forControlEvents: UIControlEventTouchUpInside];
    
    [button release];
    return button;
    
}
-(UIButton*)addButtonTwo {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 400, 100, 50)];
    [button setTitle:@"Sub" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    button.backgroundColor = [UIColor whiteColor];
    button.layer.cornerRadius = 6;
    button.layer.borderWidth = 2;
    button.layer.borderColor = [[UIColor blackColor] CGColor];
    [self.view addSubview: button];
    
    [button addTarget:self action:@selector(buttonTapped:) forControlEvents: UIControlEventTouchUpInside];
    
    [button release];
    return button;
    
}


-(UILabel*)addLabel{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 350, 200, 50)];
    label.textAlignment = NSTextAlignmentCenter;
    NSDateFormatter *toFormat = [[NSDateFormatter new] autorelease];
    toFormat.dateFormat = @"dd/MM/yyyy HH:mm";
    label.text = [toFormat stringFromDate: [NSDate date]];
    [self.view addSubview: label];
    
    [label release];
    return label;
}


-(UITextField*)startDateField{
    
    UITextField *startDate = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 200, 50)];
    startDate.placeholder = @"Start date";
    startDate.textAlignment = NSTextAlignmentCenter;
    startDate.layer.opacity = 0.8;
    startDate.layer.borderWidth = 2;
    startDate.backgroundColor = [UIColor whiteColor];
    startDate.leftViewMode = UITextFieldViewModeAlways;
    startDate.delegate = self;
    //[self.view addSubview: startDate];
    
    [startDate release];
    return startDate;
}



-(UITextField*)stepDateField{
    
    UITextField *stepDate = [[UITextField alloc] initWithFrame:CGRectMake(20, 170, 200, 50)];
    stepDate.placeholder =  @"Step";
    stepDate.textAlignment = NSTextAlignmentCenter;
    stepDate.layer.opacity = 0.8;
    stepDate.layer.borderWidth = 2;
    stepDate.backgroundColor = [UIColor whiteColor];
    stepDate.leftViewMode = UITextFieldViewModeAlways;
    stepDate.delegate = self;
    //[self.view addSubview: stepDate];
    
    [stepDate release];
    return stepDate;
    
    
}
-(UITextField*)unitDateField{
    
    UITextField *unit = [[UITextField alloc] initWithFrame:CGRectMake(20, 240, 200, 50)];
    unit.placeholder = @"Date unit";
    unit.textAlignment = NSTextAlignmentCenter;
    unit.layer.opacity = 0.8;
    unit.layer.borderWidth = 2;
    unit.backgroundColor = [UIColor whiteColor];
    unit.leftViewMode = UITextFieldViewModeAlways;
    unit.delegate = self;
    unit.autocapitalizationType = UITextAutocapitalizationTypeNone;
    //[self.view addSubview: unit];
    
    [unit release];
    return unit;
}

-(void)changeDate {
    
}
- (IBAction)buttonTapped:(id)sender {
    
    UILabel *labelAfter = [self.view viewWithTag: 44];
    UITextField *stepF = [self.view viewWithTag:22];
    int step = [stepF.text intValue];
    
    if (sender == self.addButtonOne) {
        step +=step;
    }
    else if (sender == self.addButtonTwo) {
        step = -step;
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter new] autorelease];
    dateFormatter.dateFormat = @"dd/MM/yyyy HH:mm";
    NSDate *current = [dateFormatter dateFromString: labelAfter.text];
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier: NSCalendarIdentifierGregorian];
    for (int i = 0; i < 6; i += 1) {
        switch (i) {
            case year: {
                NSDate *dateAfter = [calendar dateByAddingUnit: NSCalendarUnitYear value: step toDate: current options: 0];
                labelAfter.text = [dateFormatter stringFromDate: dateAfter];
            }
                break;
            case month:{
                NSDate *dateAfter = [calendar dateByAddingUnit: NSCalendarUnitMonth value: step toDate: current options: 0];
                labelAfter.text = [dateFormatter stringFromDate: dateAfter];
            }
                break;
            case week:{
                NSDate *dateAfter = [calendar dateByAddingUnit: NSCalendarUnitWeekOfYear value: step toDate: current options: 0];
                labelAfter.text = [dateFormatter stringFromDate: dateAfter];
            }
             
                break;
            case day:{
                NSDate *dateAfter = [calendar dateByAddingUnit: NSCalendarUnitDay value: step toDate: current options: 0];
                labelAfter.text = [dateFormatter stringFromDate: dateAfter];
            }
              
                break;
            case hour:{
                NSDate *dateAfter = [calendar dateByAddingUnit: NSCalendarUnitHour value: step toDate: current options: 0];
                labelAfter.text = [dateFormatter stringFromDate: dateAfter];
            }
                break;
            case minute:{
                NSDate *dateAfter = [calendar dateByAddingUnit: NSCalendarUnitMinute value: step toDate: current options: 0];
                labelAfter.text = [dateFormatter stringFromDate: dateAfter];
            }
           
                break;
            default:
                return;
        }
        
    }

}


-(BOOL)checkFields {
    if ([self startDateField].text.length == 0) {
        return NO;
    }
    else if ([self stepDateField].text.length == 0) {
        return NO;
    }
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    
    if([string length] == 0){
        return YES;
    }
    //"Step" text field should allow only numbers
    if (textField.tag == 22) {
        
        NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
        for (int i = 0; i < [string length]; i++) {
            unichar c = [string characterAtIndex:i];
            if ([myCharSet characterIsMember:c]) {
                return YES;
            }
        }
    }
    
    if (textField.tag == 11) {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"dd/MM/yyyy HH:mm";
        NSString *str = [textField.text stringByReplacingCharactersInRange: range withString: string];
        if ([dateFormatter dateFromString: str]) {
            UILabel *label = [self.view viewWithTag: 44];
            label.text = str;
        }
        return YES;
    }
    
    //"Date unit" should only allow these values: year, month, week, day, hour, minute
    if (textField.tag == 33) {
        UITextField *unitF = [self.view viewWithTag:33];
        NSString *lowercaseStr = [unitF.text lowercaseString];
        for (int i = 0; i < 6; i += 1) {
            switch (i) {
                case year:
                    if ([lowercaseStr isEqualToString: @"year"]){
                        return YES;
                    };
                    break;
                case month:
                    if ([lowercaseStr isEqualToString: @"month"]){
                        return YES;
                    }
                    break;
                case week:
                    if ([lowercaseStr isEqualToString: @"week"]){
                        return YES;
                    };
                    break;
                case day:
                    if ([lowercaseStr isEqualToString: @"day"]){
                        return YES;
                    };
                    break;
                case hour:
                    if ([lowercaseStr isEqualToString: @"hour"]){
                        return YES;
                    };
                    break;
                case minute:
                    if ([lowercaseStr isEqualToString: @"minute"]){
                        return YES;
                    };
                    break;
                default:
                    return NO;
            }
        }
        if ([string rangeOfCharacterFromSet:[NSCharacterSet letterCharacterSet].invertedSet].location != NSNotFound) {
            return NO;} else {
                return YES;
            }
    }

    return NO;
}

@end;


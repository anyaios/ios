#import "DateMachine.h"
typedef enum unitsCalendar{
    year = 0,
    month = 1,
    week = 2,
    day = 3,
    hour = 4,
    minute = 5
} Calendars;


@implementation DateMachine

- (void)viewDidLoad {
    [super viewDidLoad];
    // have fun
    self.view.backgroundColor = UIColor.grayColor;
    
    [self addButtonOne: @"Add"];
    [self addButtonTwo];
    [self addLabel: @"dd/MM/yyyy HH:mm"];
    [self startDateField];
    [self stepDateField];
    [self unitDateField];
    
}

-(UIButton*)addButtonOne:(NSString*)text {
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(270, 400, 100, 50)];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    button.backgroundColor = [UIColor whiteColor];
    button.layer.cornerRadius = 6;
    button.layer.borderWidth = 2;
    button.layer.borderColor = [[UIColor blackColor] CGColor];
    [self.view addSubview: button];
    
    [button addTarget:self action:@selector(addClick:) forControlEvents: UIControlEventTouchUpInside];
    
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
    
    [button addTarget:self action:@selector(subClick:) forControlEvents: UIControlEventTouchUpInside];
    
    [button release];
    return button;
    
}


-(UILabel*)addLabel:(NSString*)date {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 350, 200, 50)];
    label.textAlignment = NSTextAlignmentCenter;
    NSDateFormatter *toFormat = [[NSDateFormatter new] autorelease];
    toFormat.dateFormat = date;
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
    [self.view addSubview: startDate];
    
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
    [self.view addSubview: stepDate];
    
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
    [self.view addSubview: unit];
    
    [unit release];
    return unit;
}

-(void)changeDate {
}

-(void)addClick:(UIButton *)click {

}

-(void)subClick:(UIButton *)click {

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
//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//
//}



@end

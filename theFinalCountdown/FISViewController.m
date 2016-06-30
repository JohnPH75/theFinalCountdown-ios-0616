//
//  FISViewController.m
//  theFinalCountdown
//
//  Created by Joe Burgess on 7/9/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()

@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UIDatePicker *countDownTimer;

@property (nonatomic) BOOL pauseTapped;
@property (nonatomic) NSInteger timepaused;

@end

@implementation FISViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    timerCounter = 0;
    
    counter.text = [NSString stringWithFormat:@""];
    
    counter.hidden = YES;


	// Do any additional setup after loading the view, typically from a nib.
}


- (void)viewWillAppear:(BOOL)animated
{


}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) count{
    
    timerCounter = timerCounter -1;
    
}

- (IBAction)start:(id)sender{
    
    counter.hidden = NO;
    
    countDownInterval = (NSTimeInterval)_countDownTimer.countDownDuration;
    
    remainder = countDownInterval;
    afterRemainder = countDownInterval - remainder%60;
    
    if (self.pauseTapped) {
        afterRemainder = self.timepaused;
        self.pauseTapped = NO;
    }
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateCountdown) userInfo:nil repeats:YES];
    
    self.pauseButton.enabled = YES;
    self.countDownTimer.hidden = YES;
}
             

- (IBAction)pauseButtonTapped:(id)sender {
    
    self.pauseTapped = YES;
    
    self.timepaused = afterRemainder;
    
    [timer invalidate];
}

- (void) updateCountdown{
    
    afterRemainder --;
    int hours = (int)(afterRemainder/(60*60));
    int minutes = (int)(((int) afterRemainder/60) - (hours * 60));
    int seconds = (int)(((int) afterRemainder - (60 * minutes) - (60 * hours * 60)));
    
    NSString *displayText = [[NSString alloc] initWithFormat:@"%02i : %02i : %i", hours, minutes, seconds];
    
    counter.text = displayText;
}

- (IBAction)reset:(id)sender{
    
    [timer invalidate];
    
    self.countDownTimer.hidden = NO;
    
    self.pauseTapped = NO;
    
    timerCounter = 0;
    
    counter.text = [NSString stringWithFormat:@""];
    
    counter.hidden = YES;
}



@end

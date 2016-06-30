//
//  FISViewController.h
//  theFinalCountdown
//
//  Created by Joe Burgess on 7/9/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>

int timerCounter;

@interface FISViewController : UIViewController{
    
    IBOutlet UILabel *counter;
    
    NSTimer *timer;
    
    NSInteger afterRemainder;
    NSInteger remainder;
    
    NSTimeInterval countDownInterval;
    
}

- (void) count;

- (IBAction)start:(id)sender;



@end

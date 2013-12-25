//
//  SpeedInfoView.m
//  ScrollTutorial
//
//  Created by aybek can kaya on 12/24/13.
//  Copyright (c) 2013 aybek can kaya. All rights reserved.
//

#import "SpeedInfoView.h"

@implementation SpeedInfoView
@synthesize superViewInstance;
@synthesize maxSpeed;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

/*
     bu view i animasyon ile gosterecek
     aciklama: katetmesi gereken yolun 3 te 1 ine geldiginde alpha 1 olmali , yolun 2/3 une
     geldiginde 0.3 saniye durup , en son 3te 1 lik kisimda alpha 0 olmali
 */
-(void)show
{
    // Write to label
    self.speedInfoLabel.text=[NSString stringWithFormat:@"%d",maxSpeed];
    
    // Animation
    CGRect originalFrame=self.frame;
    float heightWillMove=superViewInstance.frame.size.height+self.frame.size.height/2;
    float timeRequiredToFinishAnimation=2.2; // in seconds
    [UIView animateWithDuration:timeRequiredToFinishAnimation/4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        // Step 1
        self.alpha=1;
        self.center=CGPointMake(superViewInstance.center.x, heightWillMove/3);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:timeRequiredToFinishAnimation/4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            // Step 2
            self.center=CGPointMake(superViewInstance.center.x, heightWillMove*2/3);
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:timeRequiredToFinishAnimation/4 delay:0.3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                // Step 3
                self.center=CGPointMake(superViewInstance.center.x, heightWillMove);
                self.alpha=0;
            } completion:^(BOOL finished) {
                
                // in completion move to original position
                self.frame=originalFrame;
            }];
            
        }];
        
    }];
}


@end

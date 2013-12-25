//
//  SpeedInfoView.h
//  ScrollTutorial
//
//  Created by aybek can kaya on 12/24/13.
//  Copyright (c) 2013 aybek can kaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpeedInfoView : UIView
{
    
}

// GUI elements
@property(nonatomic,weak) IBOutlet UILabel *speedInfoLabel;

// data elements
@property(nonatomic) int maxSpeed;
@property(nonatomic,strong) UIView *superViewInstance;

-(void)show;

@end

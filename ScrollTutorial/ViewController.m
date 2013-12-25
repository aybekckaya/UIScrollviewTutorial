//
//  ViewController.m
//  ScrollTutorial
//
//  Created by aybek can kaya on 12/24/13.
//  Copyright (c) 2013 aybek can kaya. All rights reserved.
//

#import "ViewController.h"

// predefined Sizes for UIView generator function
#define WIDTH 150
#define HEIGHT 150

#define NUMBER_OF_ITEMS 200

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.infoView.alpha=1;
    self.scroll.pagingEnabled=NO; // scrollview Paging
    
    // Add speed info View
    NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"SpeedInfoView" owner:nil options:nil];
    speedInfoView=(SpeedInfoView *)views[0];
    speedInfoView.center=CGPointMake(self.view.center.x, -1*speedInfoView.frame.size.height);
    speedInfoView.superViewInstance=self.view;
    [self.view addSubview:speedInfoView];
    
    maximumSpeed=0; // initialize maximum speed
    
    [self setUpScrollView];
    
}


#pragma mark Setting up ScrollView and its ingredients

-(void)setUpScrollView
{
    // 4 scroll icini doldurma
    float centerY=0;
    float margin=40;
    for(int i= 0 ;i< NUMBER_OF_ITEMS ; i++)
    {
        centerY=(i*(HEIGHT+margin))+HEIGHT/2;
        [self.scroll addSubview:[self viewGenerator:CGPointMake(self.view.center.x, centerY)]];
        
    }
    // 5- contentSize belirleme
    [self.scroll setContentSize:CGSizeMake(self.scroll.frame.size.width, centerY+HEIGHT/2+margin)];
    
    
    
}


#pragma mark UIView generator

/*
    @ input: 
         -center point of view (CGPoint)
    @returns : 
        -UIView with a random background color with pre-defined size (WIDTH, HEIGHT)
*/
-(UIView *)viewGenerator:(CGPoint)centerPt
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0,0, WIDTH, HEIGHT)];
    view.center=centerPt;
    view.backgroundColor=[self randomColor];
    return view;
}

/*
 @returns :
   -random UIColor object
 */
-(UIColor *)randomColor
{
    float red=100+arc4random() % 155;
    float green=100+arc4random() %155;
    float blue =100+arc4random() %155;
    float alpha= 1.0f;
   return  [[UIColor alloc] initWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}


#pragma mark ScrollView Delegates
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"function called: %s",__PRETTY_FUNCTION__);
   
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
   NSLog(@"function called: %s",__PRETTY_FUNCTION__);
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"function called: %s",__PRETTY_FUNCTION__);
    
    speedInfoView.maxSpeed=maximumSpeed;
    [speedInfoView show];
    maximumSpeed=0; // reset maxSpeed

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   // [self show];
    // calculate in background thread
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
          [self calculateVelocity];
    });
}


#pragma mark velocity Calculator
-(void)calculateVelocity
{
  CFTimeInterval timeStart=CACurrentMediaTime();
    static int oldY=0;
    int newY=self.scroll.contentOffset.y;
    int diff=fabsf(newY -oldY);
    if(diff == 1)
    {
        diff=0;
    }
    oldY=self.scroll.contentOffset.y;
    
    CFTimeInterval timeElapsed=CACurrentMediaTime()-timeStart;
    int speed=diff/timeElapsed ;
    speed=speed/1000;
    
    // determine maxSpeed
    if(speed > maximumSpeed)
    {
        maximumSpeed=speed;
    }
        dispatch_async(dispatch_get_main_queue(), ^{
            //main thread
              self.speedLabel.text=[NSString stringWithFormat:@"%d",speed];
             NSLog(@"velocity: %d",speed);
            NSLog(@"time elapsed: %f",timeElapsed);
        });
        
    
    
}


#pragma mark show/Hide animations

-(void)show
{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.infoView.alpha=1;
    } completion:^(BOOL finished) {
        self.infoView.alpha=0;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

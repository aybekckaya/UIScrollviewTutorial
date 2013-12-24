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
    
    // infoview gizleme
    self.infoView.alpha=0;
    self.scroll.pagingEnabled=NO; // scrollview Paging
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

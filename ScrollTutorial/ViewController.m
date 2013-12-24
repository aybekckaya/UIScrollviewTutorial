//
//  ViewController.m
//  ScrollTutorial
//
//  Created by aybek can kaya on 12/24/13.
//  Copyright (c) 2013 aybek can kaya. All rights reserved.
//

#import "ViewController.h"

// predefined Sizes for UIView generator function
#define WIDTH 100
#define HEIGHT 100

#define NUMBER_OF_ITEMS 200

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self setUpScrollView];
    
}


#pragma mark Setting up ScrollView and its ingredients

-(void)setUpScrollView
{
  
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
    float red=arc4random() % 255;
    float green=arc4random() %255;
    float blue =arc4random() %255;
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

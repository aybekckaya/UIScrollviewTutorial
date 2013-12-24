//
//  ViewController.h
//  ScrollTutorial
//
//  Created by aybek can kaya on 12/24/13.
//  Copyright (c) 2013 aybek can kaya. All rights reserved.
//

/*
    UIScrollView Tutorial
 */

#import <UIKit/UIKit.h>

//2 - scrollviewdelegate protokolunu ekleme
@interface ViewController : UIViewController<UIScrollViewDelegate>
{
    
}

// 1 - UIScrollview Outletini olusturma
@property(nonatomic,weak) IBOutlet UIScrollView *scroll;

// 3 - yuksekligi gosterecek olan label ekleme
@property(nonatomic,weak) IBOutlet UILabel *infoLabel;
@property(nonatomic,weak) IBOutlet UILabel *speedLabel;
@property(nonatomic,weak) IBOutlet UIView *infoView;

@end

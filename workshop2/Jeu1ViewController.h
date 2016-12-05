//
//  Jeu1ViewController.h
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIGestureRecognizer.h>


@interface Jeu1ViewController : UIViewController {
    IBOutlet UIImageView *weap;
}
//tuto youtube 
@property (nonatomic) CGFloat rotation;
@property (nonatomic, readonly) CGFloat velocity;

@end

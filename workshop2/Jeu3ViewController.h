//
//  Jeu3ViewController.h
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Jeu3ViewController : UIViewController {
    IBOutlet UILabel *score;
    IBOutlet UISlider *slider;
    int a;
    int b;
    int conteur;
}

- (IBAction)sliderValue:(UISlider *)sender;

@end

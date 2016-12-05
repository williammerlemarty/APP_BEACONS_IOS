//
//  Jeu4ViewController.h
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Jeu4ViewController : UIViewController {
    IBOutlet UISlider *pic;
    IBOutlet UILabel *score;
    
    int a;
    int b;
    int conteur;
}

- (IBAction)picValue:(UISlider *)sender;

@end

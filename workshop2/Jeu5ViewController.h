//
//  Jeu5ViewController.h
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Jeu5ViewController : UIViewController {
    IBOutlet UILabel *question;
    IBOutlet UITextField *reponse;
}

- (IBAction)btnReponse:(id)sender;

@end

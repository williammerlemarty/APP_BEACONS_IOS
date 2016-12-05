//
//  CreerViewController.h
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreerViewController : UIViewController {
    
    IBOutlet UITextField *nompartie;
    IBOutlet UITextField *nombreJoueur;
    IBOutlet UITextField *passwordpartie;
    IBOutlet UILabel *erreur;
    IBOutlet UIButton *suivant1;
    
}

- (IBAction)suivant1:(id)sender;



@end

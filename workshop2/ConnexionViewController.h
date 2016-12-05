//
//  ConnexionViewController.h
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConnexionViewController : UIViewController {
    
    IBOutlet UITextField *email;
    IBOutlet UITextField *mdp;
    IBOutlet UILabel *erreur;
    IBOutlet UIButton *login;
    
}

- (IBAction)login:(id)sender;

@end

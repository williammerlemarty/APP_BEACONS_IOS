//
//  InscriptionViewController.h
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InscriptionViewController : UIViewController {
    
    IBOutlet UITextField *pseudo;
    IBOutlet UITextField *mail;
    IBOutlet UITextField *password;
    IBOutlet UILabel *erreur;
    IBOutlet UIButton *envoyer;
    
}

- (IBAction)envoyer:(id)sender;

@end

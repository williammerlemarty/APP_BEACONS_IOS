//
//  RejoindreViewController.h
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RejoindreViewController : UIViewController {

IBOutlet UITextField *nomPartie;
IBOutlet UITextField *mdpPartie;
IBOutlet UILabel *erreur;

}

- (IBAction)go:(id)sender;

@end

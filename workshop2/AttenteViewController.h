//
//  AttenteViewController.h
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AttenteViewController : UIViewController {
    
    IBOutlet UILabel *nomAttente;

    NSArray *table;
    
    
    
}
@property (strong, nonatomic) NSArray *distanceBeacon;

- (IBAction)suivant4:(id)sender;

@end

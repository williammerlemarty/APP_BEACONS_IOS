//
//  DashboardViewController.h
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface DashboardViewController : UIViewController <CLLocationManagerDelegate> {
    IBOutlet UIImageView *schema;
    IBOutlet UILabel *conteur;
    IBOutlet UIProgressView *etat;

    
   NSArray *dashboard;
}

- (IBAction)btnaction:(id)sender;


@end

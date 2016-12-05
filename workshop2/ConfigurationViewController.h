//
//  ConfigurationViewController.h
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ConfigurationViewController : UIViewController <CLLocationManagerDelegate>

@property IBOutlet UILabel *nonDetecter;

- (IBAction)suivant2:(id)sender;

@end

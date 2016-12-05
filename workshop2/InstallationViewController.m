//
//  InstallationViewController.m
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import "InstallationViewController.h"
#import "AttenteViewController.h"

@interface InstallationViewController ()

@end

@implementation InstallationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title =@"Installation";
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    immageInstallation.image = [UIImage imageNamed:@"schemaInstallation.jpg"];
    
    
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)suivant3:(id)sender {
    AttenteViewController *avc = [self.storyboard instantiateViewControllerWithIdentifier:@"AttenteView"];
    
    [[self navigationController] pushViewController:avc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

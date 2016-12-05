//
//  ViewController.m
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import "ViewController.h"
#import "ConnexionViewController.h"
#import "InscriptionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Home";
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)connexion:(id)sender {
    
    ConnexionViewController *cvc = [self.storyboard instantiateViewControllerWithIdentifier:@"ConnexionView"];
    [[self navigationController] pushViewController:cvc animated:YES];
    
    
}
- (IBAction)inscription:(id)sender {
    
    InscriptionViewController *ivc = [self.storyboard instantiateViewControllerWithIdentifier:@"InscriptionView"];
    [[self navigationController] pushViewController:ivc animated:YES];

    
}

@end

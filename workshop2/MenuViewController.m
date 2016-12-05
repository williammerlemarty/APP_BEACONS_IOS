//
//  MenuViewController.m
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import "MenuViewController.h"
#import "CreerViewController.h"
#import "RejoindreViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Menu";
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];

    NSString *letokx = [[NSUserDefaults standardUserDefaults] stringForKey:@"letok"];
    NSLog(@"%@toki", letokx);
    
    NSString *leuserx = [[NSUserDefaults standardUserDefaults] stringForKey:@"leuser"];
    NSLog(@"%@ usename", leuserx);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnCreer:(id)sender{
    CreerViewController *cvc = [self.storyboard instantiateViewControllerWithIdentifier:@"CreerView"];
    [[self navigationController] pushViewController:cvc animated:YES];

    
}
- (IBAction)btnRejoindre:(id)sender{
    RejoindreViewController *rvc = [self.storyboard instantiateViewControllerWithIdentifier:@"RejoindreView"];
    [[self navigationController] pushViewController:rvc animated:YES];

    
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

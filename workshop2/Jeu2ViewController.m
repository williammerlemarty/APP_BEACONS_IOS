//
//  Jeu2ViewController.m
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import "Jeu2ViewController.h"

@interface Jeu2ViewController ()

@end

@implementation Jeu2ViewController

- (IBAction)btnPush:(id)sender {
    
    conteur = conteur+1;
    score.text = [NSString stringWithFormat:@"score : %i", conteur];
    
    NSLog(@"%i", conteur);
    
    if (conteur == 100) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Gagné" message:@"Vous avez réussi le mini jeu" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIAlertView *consigne = [[UIAlertView alloc] initWithTitle:@"Mini jeu 2"
    message:@"appuyer 100 fois le plus vite possible" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [consigne show];

    conteur = 0;
    score.text = @"score : 0";
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

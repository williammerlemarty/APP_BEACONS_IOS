//
//  Jeu4ViewController.m
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import "Jeu4ViewController.h"

@interface Jeu4ViewController ()

@end

@implementation Jeu4ViewController

- (IBAction)picValue:(UISlider *)sender {
    
    if (pic.value <= 100 && pic.value >= 95) {
        b = 1;
    } else if (pic.value <= 5 && pic.value >= 0) {
        a = 1;
    } else if (a == 1 && b == 1) {
        conteur = conteur+1;
        a = 0;
        b = 0;
    }
    
    score.text = [NSString stringWithFormat:@"score : %i", conteur];
    
    if (conteur == 50) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Gagné" message:@"Vous avez réussi le mini jeu" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self->pic.transform=CGAffineTransformRotate(self->pic.transform,270.0/180*M_PI);
    
    a = 0;
    b = 0;
    conteur = 0;
    
    score.text = @"score : 0";

    
    UIAlertView *consigne = [[UIAlertView alloc] initWithTitle:@"Mini jeu 4"
    message:@"Faite glisser le slider de bas en haut le plus vite possible" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [consigne show];
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

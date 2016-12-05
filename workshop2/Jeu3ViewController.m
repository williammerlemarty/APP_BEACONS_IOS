//
//  Jeu3ViewController.m
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import "Jeu3ViewController.h"

@interface Jeu3ViewController ()

@end

@implementation Jeu3ViewController

- (IBAction)sliderValue:(UISlider *)sender {
    
    if (slider.value <= 100 && slider.value >= 95) {
        b = 1;
    } else if (slider.value <= 5 && slider.value >= 0) {
        a = 1;
    } else if (a == 1 && b == 1) {
        conteur = conteur+1;
        a = 0;
        b = 0;
    }
    
    score.text = [NSString stringWithFormat:@"score : %i", conteur];
    
    if (conteur == 20) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Gagné" message:@"Vous avez réussi le mini jeu" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    a = 0;
    b = 0;
    conteur = 0;
    
    score.text = @"score : 0";

    
    UIAlertView *consigne = [[UIAlertView alloc] initWithTitle:@"Mini jeu 3"
    message:@"Faite glisser le slider de gauche à droite le plus vite possible" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
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

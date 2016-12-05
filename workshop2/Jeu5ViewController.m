//
//  Jeu5ViewController.m
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import "Jeu5ViewController.h"

@interface Jeu5ViewController ()

@end

@implementation Jeu5ViewController
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (IBAction)btnReponse:(id)sender{
    
    int reponseDonnee = reponse.text.intValue;
    
    if ( reponseDonnee == 207502) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Gagné" message:@"Vous avez réussi le mini jeu" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Echoué" message:@"La bonne réponse était 207502" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    int nombre1 = 359;
    
    int nombre2 = 578;
    
    NSString *Qtype = [NSString stringWithFormat:@"%i * %i =", nombre1, nombre2] ;
    
    question.text = Qtype;
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

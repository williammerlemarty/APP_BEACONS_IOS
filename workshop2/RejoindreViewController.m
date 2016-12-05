//
//  RejoindreViewController.m
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import "RejoindreViewController.h"
#import "AttenteViewController.h"

@interface RejoindreViewController ()

@end

@implementation RejoindreViewController
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Rejoindre une partie";
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    
    NSString *leuserx = [[NSUserDefaults standardUserDefaults] stringForKey:@"leuser"];
    NSLog(@"%@ usename", leuserx);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)go:(id)sender{
    
    NSString *letokx = [[NSUserDefaults standardUserDefaults] stringForKey:@"letok"];
    //    NSLog(@"%@toki", letokx);
    
    NSString *bertok = [NSString stringWithFormat:@"Bearer %@", letokx];
    NSLog(@"%@ beartoki", bertok);
    
    if ((nomPartie.text && nomPartie.text.length > 0) && (mdpPartie.text && mdpPartie.text.length > 0)) {
        
        NSString *concat = [NSString stringWithFormat:@"http://li625-134.members.linode.com/party?name=%@&password=%@", [nomPartie text], [mdpPartie text]];
        //        NSLog(@"%@ concat", concat);
        
        
        NSString *str = concat;
        NSURL *toLoad = [NSURL URLWithString:str]; // creer URL
        
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        sessionConfiguration.HTTPAdditionalHeaders = @{@"Authorization": bertok};
        NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration]; // Ouvrir connexion
        
        
        NSURLSessionDataTask * task = [session dataTaskWithURL:toLoad completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSLog(@"test5");
            
            NSString *string2 = [[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding];
            dispatch_async(dispatch_get_main_queue(), ^{
                
                
                
                NSData * dataJson = [string2 dataUsingEncoding:NSUTF8StringEncoding];
                id json = [NSJSONSerialization JSONObjectWithData:dataJson options:0 error:nil];
                NSDictionary *value = [json objectForKey:@"party"];
                NSLog(@"%@party", value);
                
                NSDictionary *value2 = [json objectForKey:@"ok"];
                NSLog(@"%@ss", value2);
                
                if ([value2 isEqual: @YES]) {
                    
                    //On push le prochain view controller
                    AttenteViewController *avc = [self.storyboard instantiateViewControllerWithIdentifier:@"AttenteView"];
                    [[self navigationController] pushViewController:avc animated:YES];
                    
                } else {
                    
                    erreur.text = @"Pseudo ou Mot de passe incorrecte";
                    erreur.hidden = NO;
                    
                }
                
            });
        }];
        [task resume];
    } else {
        
        erreur.text = @"Veuillez remplir les champs ci-dessus";
        erreur.hidden = NO;
        
    }



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



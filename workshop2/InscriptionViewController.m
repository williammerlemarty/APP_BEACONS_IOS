//
//  InscriptionViewController.m
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import "InscriptionViewController.h"
#import "MenuViewController.h"

@interface InscriptionViewController ()

@end

@implementation InscriptionViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (IBAction)envoyer:(id)sender {
    
    if ((pseudo.text && pseudo.text.length > 0) && (mail.text && mail.text.length > 0) && (password.text && password.text.length > 0)){
        NSLog(@"%@", [pseudo text]);
        NSLog(@"%@", [mail text]);
        NSLog(@"%@", [password text]);
        
        
        NSURL *aUrl = [NSURL URLWithString:@"http://li625-134.members.linode.com/auth"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:aUrl
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request setHTTPMethod:@"POST"];
        [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        NSString *postString = [NSString stringWithFormat:@"username=%@&email=%@&password=%@", [pseudo text], [mail text], [password text]];
        [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        
        
        NSURLSession *session = [NSURLSession sharedSession]; // Ouvrir connexion
        NSURLSessionDataTask * task = [session dataTaskWithRequest: request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            NSString *string2 = [[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",string2);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                
                
                NSData * dataJson = [string2 dataUsingEncoding:NSUTF8StringEncoding];
                id json = [NSJSONSerialization JSONObjectWithData:dataJson options:0 error:nil];
                NSDictionary *value = [json objectForKey:@"user"];
                NSLog(@"%@", value);
                
                NSDictionary *value2 = [json objectForKey:@"ok"];
                NSLog(@"%@ss", value2);
                
                if ([value2 isEqual: @YES]) {
                    
                    // Je sauvegarde le token dans les préférences
                    // Récupérer le token dans value
                    NSString *tok = [value objectForKey:@"token"];
                    NSLog(@"%@ tok", tok);
                    
                    // Stocker token dans userdefaults
                    NSString *tokdefault = tok;
                    [[NSUserDefaults standardUserDefaults] setObject:tokdefault forKey:@"letok"];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    
                    // Enregistrer userdefaults
                    
                    
                    
                    //On push le prochain view controller
                    MenuViewController *mvc = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuView"];
                    [[self navigationController] pushViewController:mvc animated:YES];
                    
                } else {
                    
                    erreur.text = @"Une erreur c'est produite";
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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Inscription";
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    
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


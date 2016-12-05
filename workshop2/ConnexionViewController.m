//
//  ConnexionViewController.m
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import "ConnexionViewController.h"
#import "MenuViewController.h"

@interface ConnexionViewController ()

@end

@implementation ConnexionViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Connexion";
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
}

- (IBAction)login:(id)sender {
    
    
    if ((email.text && email.text.length > 0) && (mdp.text && mdp.text.length > 0)) {
       
        
        
        NSString *pseudo = [email text];
        NSString *password = [mdp text];
        NSString *concat = [NSString stringWithFormat:@"%@%@%@%@", @"http://li625-134.members.linode.com/auth?username=", pseudo, @"&password=", password];
        
        // Demnder à Zino ou Will pour concat
        // POST http://stackoverflow.com/questions/6148900/append-data-to-a-post-nsurlrequest
        
        NSString *str = concat;
        NSURL *toLoad = [NSURL URLWithString:str]; // creer URL
        NSURLSession *session = [NSURLSession sharedSession]; // Ouvrir connexion
        NSURLSessionDataTask * task = [session dataTaskWithURL:toLoad completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            NSString *string2 = [[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding];
            dispatch_async(dispatch_get_main_queue(), ^{
                
                
                
                NSData * dataJson = [string2 dataUsingEncoding:NSUTF8StringEncoding];
                id json = [NSJSONSerialization JSONObjectWithData:dataJson options:0 error:nil];
                NSDictionary *value = [json objectForKey:@"user"];
                NSLog(@"%@user", value);
                
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
                    
                    

                    NSString *user = [value objectForKey:@"username"];
                    NSLog(@"%@ usename", user);
                    
                    // Stocker token dans userdefaults
                    NSString *player = user;
                    [[NSUserDefaults standardUserDefaults] setObject:player forKey:@"leuser"];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    
                    // Enregistrer userdefaults
                    
                    
                    
                    //On push le prochain view controller
                    MenuViewController *mvc = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuView"];
                    [[self navigationController] pushViewController:mvc animated:YES];
                    
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

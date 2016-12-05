//
//  AttenteViewController.m
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import "AttenteViewController.h"
#import "DashboardViewController.h"
#import "AttenteTableViewCell.h"



@interface AttenteViewController () < UITableViewDataSource >

@end

@implementation AttenteViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Attente des joueurs";
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    //table = @[@"Joueur 1", @"joueur2", @"joueur 3"];
    
    NSString *leuserx = [[NSUserDefaults standardUserDefaults] stringForKey:@"leuser"];
    NSLog(@"%@ 4usename", leuserx);
    
    table = @[leuserx];
    
    NSString *letokx = [[NSUserDefaults standardUserDefaults] stringForKey:@"letok"];
    NSLog(@"%@toki", letokx);
    
    NSString *bertok = [NSString stringWithFormat:@"Bearer %@", letokx];
    NSLog(@"%@ beartoki", bertok);
    

    NSString *party = @"http://li625-134.members.linode.com/party/sync";
    
    NSLog(@"%@ blablabla",party);
    
    NSString *str = party;
    NSURL *toLoad = [NSURL URLWithString:str]; // creer URL
    
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfiguration.HTTPAdditionalHeaders = @{@"Authorization": bertok};
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration]; // Ouvrir connexion
    NSURLSessionDataTask * task = [session dataTaskWithURL:toLoad completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSString *string2 = [[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSData * dataJson = [string2 dataUsingEncoding:NSUTF8StringEncoding];
            id json = [NSJSONSerialization JSONObjectWithData:dataJson options:0 error:nil];
            NSDictionary *value = [json objectForKey:@"party"];
            NSLog(@"%@part", value);
            
            NSDictionary *value2 = [json objectForKey:@"ok"];
            NSLog(@"%@ss", value2);
            
            if ([value2 isEqual: @YES]) {
                
                // Je sauvegarde le token dans les préférences
                // Récupérer le token dans value
//                NSString *tok = [value objectForKey:@"token"];
//                NSLog(@"%@ tok", tok);
                
                // Stocker token dans userdefaults
//                NSString *tokdefault = tok;
//                [[NSUserDefaults standardUserDefaults] setObject:tokdefault forKey:@"letok"];
//                [[NSUserDefaults standardUserDefaults] synchronize];
//                
//                
//                
//                NSString *user = [value objectForKey:@"username"];
//                NSLog(@"%@ usename", user);
                
                // Stocker token dans userdefaults
//                NSString *player = user;
//                [[NSUserDefaults standardUserDefaults] setObject:player forKey:@"leuser"];
//                [[NSUserDefaults standardUserDefaults] synchronize];
                
                // Enregistrer userdefaults
                
                
                
                //On push le prochain view controller
               DashboardViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"DashboardView"];
                [[self navigationController] pushViewController:dvc animated:YES];
                
            }
        });
    }];
    [task resume];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)suivant4:(id)sender {
    DashboardViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"DashboardView"];
    [[self navigationController] pushViewController:dvc animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    // nombre de cellule par section (ici 3)
     return table.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AttenteTableViewCell *j = [tableView dequeueReusableCellWithIdentifier:@"attenteCell" forIndexPath:indexPath];
    
    // Configure the cell...
    j.joueurNom.text = [table objectAtIndex:indexPath.row] ;
    return j;
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

//
//  CreerViewController.m
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import "CreerViewController.h"
#import "ConfigurationViewController.h"

@interface CreerViewController ()

@end

@implementation CreerViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Créer une partie";
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)writeStringToFile:(NSString*)aString {
//
//    // Build the path, and create if needed.
//    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    NSString* fileName = @"bookmark.json";
//    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
//
//    if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]) {
//        [[NSFileManager defaultManager] createFileAtPath:fileAtPath contents:nil attributes:nil];
//    }
//
//    // The main act...
//    [[aString dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:NO];
//}
//
//- (NSString*)readStringFromFile {
//
//    // Build the path...
//    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    NSString* fileName = @"bookmark.json";
//    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
//
//    // The main act...
//    return [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:fileAtPath] encoding:NSUTF8StringEncoding];
//}

- (IBAction)suivant1:(id)sender {
    
    NSString *letokx = [[NSUserDefaults standardUserDefaults] stringForKey:@"letok"];
    NSLog(@"%@toki", letokx);
    
    NSString *bertok = [NSString stringWithFormat:@"Bearer %@", letokx];
    NSLog(@"%@ beartoki", bertok);
    
    
    if ((nompartie.text && nompartie.text.length > 0) && (passwordpartie.text && passwordpartie.text.length > 0) &&
        (nombreJoueur.text && nombreJoueur.text.length > 0)) {
        NSLog(@"%@", [nompartie text]);
        NSLog(@"%@", [passwordpartie text]);
        NSLog(@"%@", [nombreJoueur text]);
        
        
        NSURL *aUrl = [NSURL URLWithString:@"http://li625-134.members.linode.com/party"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:aUrl
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request setHTTPMethod:@"POST"];
        [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        //        [request setValue:@"Authorization" forHTTPHeaderField:bertok];
        
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        sessionConfiguration.HTTPAdditionalHeaders = @{@"Authorization": bertok};
        
        NSString *postString = [NSString stringWithFormat:@"name=%@&password=%@&players_limit=%@", [nompartie text], [passwordpartie text], [nombreJoueur text]];
        [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        
        
        NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration]; // Ouvrir connexion
        NSURLSessionDataTask * task = [session dataTaskWithRequest: request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            NSString *string2 = [[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",string2);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                
                
                NSData * dataJson = [string2 dataUsingEncoding:NSUTF8StringEncoding];
                id json = [NSJSONSerialization JSONObjectWithData:dataJson options:0 error:nil];
                NSDictionary *value = [json objectForKey:@"party"];
                NSLog(@"%@", value);
                
                NSDictionary *value2 = [json objectForKey:@"ok"];
                NSLog(@"%@ss", value2);
                
                if ([value2 isEqual: @YES]) {
                    
                    // Stocker party dans userdefaults
                    
                    // Build the path, and create if needed.
                    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                    NSString* fileName = @"bookmark.json";
                    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
                    
                    if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]) {
                        [[NSFileManager defaultManager] createFileAtPath:fileAtPath contents:nil attributes:nil];
                    }
                    
                    // The main act...
                    [[string2 dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:NO];
                    
                    // Stocker dans file manager
                    //
                    //                    // Enregistrer userdefaults
                    //
                    
                    
                    //On push le prochain view controller
                    ConfigurationViewController *cvc = [self.storyboard instantiateViewControllerWithIdentifier:@"ConfigView"];
                    [[self navigationController] pushViewController:cvc animated:YES];
                    
                    
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

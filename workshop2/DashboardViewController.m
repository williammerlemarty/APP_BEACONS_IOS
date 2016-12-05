//
//  DashboardViewController.m
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import "DashboardViewController.h"
#import "DashboardTableViewCell.h"
#import "ALDefaults.h"
#import "Jeu2ViewController.h"
#import "Jeu3ViewController.h"
#import "Jeu4ViewController.h"
#import "Jeu5ViewController.h"

@interface DashboardViewController ()

@end

@implementation DashboardViewController {
    NSMutableDictionary *_beacons;
    CLLocationManager *_locationManager;
    NSMutableArray *_rangedRegions;
    
    IBOutlet UIButton *_titreJeu;
    
}

-(void)locationManager:(CLLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region {
    
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
}

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    
    //NSLog(@"%@", _beacons [[[NSNumber numberWithInt:CLProximityImmediate] ]);
    // CoreLocation will call this delegate method at 1 Hz with updated range information.
    // Beacons will be categorized and displayed by proximity.
    [_beacons removeAllObjects];
    NSArray *unknownBeacons = [beacons filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"proximity = %d", CLProximityUnknown]];
    if([unknownBeacons count])
        [_beacons setObject:unknownBeacons forKey:[NSNumber numberWithInt:CLProximityUnknown]];
    
    NSArray *immediateBeacons = [beacons filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"proximity = %d", CLProximityImmediate]];
    if([immediateBeacons count])
        [_beacons setObject:immediateBeacons forKey:[NSNumber numberWithInt:CLProximityImmediate]];
    
    NSArray *nearBeacons = [beacons filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"proximity = %d", CLProximityNear]];
    if([nearBeacons count])
        [_beacons setObject:nearBeacons forKey:[NSNumber numberWithInt:CLProximityNear]];
    
    NSArray *farBeacons = [beacons filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"proximity = %d", CLProximityFar]];
    if([farBeacons count])
        [_beacons setObject:farBeacons forKey:[NSNumber numberWithInt:CLProximityFar]];
    
    
//    [self.tableView reloadData];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    // Start ranging when the view appears.
    [_rangedRegions enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        CLBeaconRegion *region = obj;
        [_locationManager startRangingBeaconsInRegion:region];
    }];
}

- (void)viewDidDisappear:(BOOL)animated
{
    // Stop ranging when the view goes away.
    [_rangedRegions enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        CLBeaconRegion *region = obj;
        [_locationManager stopRangingBeaconsInRegion:region];
    }];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Dashboard";
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    
    _beacons = [[NSMutableDictionary alloc] init];
    
    // This location manager will be used to demonstrate how to range beacons.
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    [_locationManager requestAlwaysAuthorization];
    [_locationManager requestWhenInUseAuthorization];
    
    
    // Populate the regions we will range once.
    _rangedRegions = [NSMutableArray array];
    [[ALDefaults sharedDefaults].supportedProximityUUIDs enumerateObjectsUsingBlock:^(id uuidObj, NSUInteger uuidIdx, BOOL *uuidStop) {
        NSUUID *uuid = (NSUUID *)uuidObj;
        CLBeaconRegion *region = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:[uuid UUIDString]];
        [_rangedRegions addObject:region];
        
        
    }];
    
    dashboard = @[ @{@"key1":@"b1",@"key2": @"Gonfle des ballons ", @"key3":@"01:00"},
                   @{@"key1":@"b2",@"key2": @"Enfonce le clou", @"key3":@"01:00"},
                   @{@"key1":@"b3",@"key2": @"Résout l’énigme", @"key3":@"01:00"},
                   @{@"key1":@"b1",@"key2": @"Nettoie la vitre", @"key3":@"01:00"}];
    
    
//    NSLog(@"%@",_beacons [[NSNumber numberWithInt:CLProximityImmediate] ]);
//        
//    if ([_beacons[ [NSNumber numberWithInt:CLProximityImmediate] ] count ] > 0) {
//            NSArray *b = _beacons [[NSNumber numberWithInt:CLProximityImmediate] ];
//        
//        NSLog(@"%@",b);
//        
//    } else {
//        
//    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    // nombre de cellule par section (ici 3)
    return dashboard.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DashboardTableViewCell *dash = [tableView dequeueReusableCellWithIdentifier:@"dashCell" forIndexPath:indexPath];
    dash.nbrBeacon.text = [dashboard[indexPath.row] objectForKey:@"key1"];
   // dash.titreJeu.setTitle([dashboard[indexPath.row] objectForKey:@"key2"]);
    NSString *titre =[dashboard[indexPath.row] objectForKey:@"key2"];
    [dash.titreJeu setTitle:(titre) forState:UIControlStateNormal];
    dash.tempsJeu.text = [dashboard[indexPath.row] objectForKey:@"key3"];
    return dash;
}


- (IBAction)btnaction:(id)sender{
    if ( [_titreJeu  isEqual: @"Gonfle des ballons"]) {
    
        Jeu4ViewController *rvc = [self.storyboard instantiateViewControllerWithIdentifier:@"Jeu4View"];
        [[self navigationController] pushViewController:rvc animated:YES];
    } else if ([_titreJeu  isEqual:  @"Enfonce le clou"]) {
        
        Jeu2ViewController *zvc = [self.storyboard instantiateViewControllerWithIdentifier:@"Jeu2View"];
        [[self navigationController] pushViewController:zvc animated:YES];
    } else if ([_titreJeu  isEqual:  @"Réparer la manivelle "]) {
        
        Jeu5ViewController *avc = [self.storyboard instantiateViewControllerWithIdentifier:@"Jeu5View"];
        [[self navigationController] pushViewController:avc animated:YES];
    } else if ([_titreJeu  isEqual:  @"Nettoie la vitre"]) {
        
        Jeu3ViewController *evc = [self.storyboard instantiateViewControllerWithIdentifier:@"Jeu3View"];
        [[self navigationController] pushViewController:evc animated:YES];
    }
}

// recuperer le tableau a afficher dans le table view
// recuperer le tableau des jeu -> aleatoire
// recupere objet beacon de la page configuration
// si beacon immediat alors le jeu s affiche sinon alert pas assez proche
// lorsque alert gagne ou perdu alors renvoivers le dashboard
// si beacon est diff immediat alors alert vous aller perde la partie




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

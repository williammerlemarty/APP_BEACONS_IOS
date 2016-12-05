//
//  ConfigurationViewController.m
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import "ConfigurationViewController.h"
#import "InstallationViewController.h"
#import "ALDefaults.h"

@interface ConfigurationViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ConfigurationViewController {
    NSMutableDictionary *_beacons;
    CLLocationManager *_locationManager;
    NSMutableArray *_rangedRegions;
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
    
    
    [self.tableView reloadData];
    
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
    
    self.title = @"Configuration";
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

    
    NSString *lapartyx = [[NSUserDefaults standardUserDefaults] stringForKey:@"laparty"];
    NSLog(@"%@parti", lapartyx);

   
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _beacons.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *sectionValues = [_beacons allValues];
    return [[sectionValues objectAtIndex:section] count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title = nil;
    NSArray *sectionKeys = [_beacons allKeys];
    
    // The table view will display beacons by proximity.
    NSNumber *sectionKey = [sectionKeys objectAtIndex:section];
    switch([sectionKey integerValue])
    {
        case CLProximityImmediate:
            title = @"Immediate";
            break;
            
        case CLProximityNear:
            title = @"Near";
            break;
            
        case CLProximityFar:
            title = @"Far";
            break;
            
        default:
            title = @"Unknown";
            break;
    }
    
    return title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    // Display the UUID, major, minor and accuracy for each beacon.
    NSNumber *sectionKey = [[_beacons allKeys] objectAtIndex:indexPath.section];
    CLBeacon *beacon = [[_beacons objectForKey:sectionKey] objectAtIndex:indexPath.row];
    cell.textLabel.text = [beacon.proximityUUID UUIDString];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Major: %@, Minor: %@, Acc: %.2fm", beacon.major, beacon.minor, beacon.accuracy];
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)suivant2:(id)sender {
    // si le titre = immediate
    // write dans la bdd le major et le minor
    // else message il y a pas de beacon detecte comme immediat
    
    // j appel mon objet = _beacons avec sa key [NSNumber numberWithInt:CLProximityImmediate] et j agis une fonction = count -> pour pouvoir agir la fonction count il faut mettre des [] qui inclue tout l objet key valeur param et la fonction
    if ([_beacons[ [NSNumber numberWithInt:CLProximityImmediate] ] count ] > 0) {
        NSArray *b = _beacons [[NSNumber numberWithInt:CLProximityImmediate] ];
        NSUInteger nbreBeacon = b.count;
        for (int i = 0; i < nbreBeacon; i++) {
            CLBeacon *c =[b objectAtIndex:i];
            NSNumber *partieMinor = c.minor;
            NSNumber *partieMajor = c.major;
            NSUUID *beaconId = c.proximityUUID;
            NSLog(@"%@", beaconId);
            NSLog(@"%@", partieMinor);
            NSLog(@"%@", partieMajor);
            
            
//            
//            
//        NSString *lapartyx = [[NSUserDefaults standardUserDefaults] stringForKey:@"laparty"];
//        NSLog(@"%@parti", lapartyx);
//            
//            
//        NSData *data = [lapartyx dataUsingEncoding:NSUTF8StringEncoding];
//        NSDictionary *parsedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        NSLog(@"party id : %@", [parsedData valueForKey:@"id"]);
//            
//        NSArray* json = [NSJSONSerialization JSONObjectWithData:lapartyx options:kNilOptions error:nil];
//            
//        NSString *string2 = [[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding];
//        NSLog(@"%@",string2);
//            
//        NSData * dataJson = [string2 dataUsingEncoding:NSUTF8StringEncoding];
//        id json = [NSJSONSerialization JSONObjectWithData:dataJson options:0 error:nil];
//        NSDictionary *value = [json objectForKey:@"party"];
//        NSLog(@"%@", value);
//            
            
            
        NSString *letokx = [[NSUserDefaults standardUserDefaults] stringForKey:@"letok"];
        NSLog(@"%@toki", letokx);
            
        NSString *bertok = [NSString stringWithFormat:@"Bearer %@", letokx];
        NSLog(@"%@ beartoki", bertok);
            
            
        NSURL *aUrl = [NSURL URLWithString:@"http://li625-134.members.linode.com/party"];
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:aUrl cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
            
        [request setHTTPMethod:@"POST"];
        [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        //        [request setValue:@"Authorization" forHTTPHeaderField:bertok];
            
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        sessionConfiguration.HTTPAdditionalHeaders = @{@"Authorization": bertok};
            
        NSString *postString = [NSString stringWithFormat:@"party_id=1&minor=%@&major=%@", partieMinor, partieMajor];
        [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
            NSLog(@"beac %@",postString);
            
        NSURLSession *session = [NSURLSession sharedSession]; // Ouvrir connexion
        NSURLSessionDataTask * task = [session dataTaskWithRequest: request completionHandler:^(NSData * _Nullable postString, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            NSString *string2 = [[NSString alloc] initWithData: postString encoding:NSUTF8StringEncoding];
            NSLog(@"%@",string2);
                dispatch_async(dispatch_get_main_queue(), ^{
            
            NSData * dataJson = [string2 dataUsingEncoding:NSUTF8StringEncoding];
        id json = [NSJSONSerialization JSONObjectWithData:dataJson options:0 error:nil];
        NSDictionary *value = [json objectForKey:@"party"];
        NSLog(@"%@", value);
            
        NSDictionary *value2 = [json objectForKey:@"ok"];
        NSLog(@"%@ss", value2);
            
        
            
                                    // Stocker token dans userdefaults
        NSString *partydefault = [NSString stringWithFormat:@"party %@", value];
         [[NSUserDefaults standardUserDefaults] setObject:partydefault forKey:@"laparty"];
       [[NSUserDefaults standardUserDefaults] synchronize];
            
                                    // Enregistrer userdefaults

            
            
            //On push le prochain view controller
                    
            InstallationViewController *ivc = [self.storyboard instantiateViewControllerWithIdentifier:@"InstallView"];
            [[self navigationController] pushViewController:ivc animated:YES];
            
            
                    
        });
        }];
        [task resume];
                        
        }
    } else {
        _nonDetecter.text = @"Aucun beacon détécté comme immédiat";
        _nonDetecter.hidden = NO;
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

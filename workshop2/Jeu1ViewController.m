//
//  Jeu1ViewController.m
//  workshop2
//
//  Created by Sharon Colin on 29/11/2016.
//  Copyright © 2016 Sharon Colin. All rights reserved.
//

#import "Jeu1ViewController.h"


@interface Jeu1ViewController ()
@property (strong, nonatomic) IBOutlet UIRotationGestureRecognizer *rotateVar;
-(IBAction)rotateAction:(id)sender;
@end

@implementation Jeu1ViewController

- (IBAction)rotateAction:(id)sender {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIRotationGestureRecognizer *rotate = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(gestureRotate:)];
    [self.view addGestureRecognizer: rotate];
}

- (void)gestureRotate{
    NSLog(@"rotation yes");
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

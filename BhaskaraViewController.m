//
//  BhaskaraViewController.m
//  Facilities
//
//  Created by André Rodrigues de Jesus on 3/26/15.
//  Copyright (c) 2015 Eduardo Ramos. All rights reserved.
//

#import "BhaskaraViewController.h"

@interface BhaskaraViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldA;

@property (weak, nonatomic) IBOutlet UITextField *textFieldB;

@property (weak, nonatomic) IBOutlet UITextField *textFieldC;

@property (weak, nonatomic) IBOutlet UIButton *buttonCalcular;

@end

@implementation BhaskaraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *swipe = [[ UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(mudarTela2)];
    
    [swipe setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:swipe];
}
-(void)mudarTela2 {

    [self dismissViewControllerAnimated:YES completion:nil];
    
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

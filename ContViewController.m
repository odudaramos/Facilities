//
//  ContViewController.m
//  Facilities
//
//  Created by André Rodrigues de Jesus on 3/26/15.
//  Copyright (c) 2015 Eduardo Ramos. All rights reserved.
//

#import "ContViewController.h"
#import "BhaskaraViewController.h"
@interface ContViewController ()

@property (weak, nonatomic) IBOutlet UILabel *cont1;

@property (weak, nonatomic) IBOutlet UILabel *cont2;

@end

@implementation ContViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    
    UISwipeGestureRecognizer *swipe = [[ UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(mudarTela)];
    
    [swipe setDirection:UISwipeGestureRecognizerDirectionUp];
    
    [self.view addGestureRecognizer:swipe];
    
    UISwipeGestureRecognizer *swipe2 = [[ UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(mudarTela2)];
    ////////asdasdasdasdasd
    [swipe2 setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:swipe2];
    
}
-(void)mudarTela2 {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)mudarTela {
    
    BhaskaraViewController * nova = [[BhaskaraViewController alloc] initWithNibName:@"BhaskaraViewController" bundle:nil] ;
    
    [self presentViewController:nova animated:YES completion:nil];
    
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

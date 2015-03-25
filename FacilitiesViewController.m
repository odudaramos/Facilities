//
//  FacilitiesViewController.m
//  Facilities
//
//  Created by Eduardo Ramos on 25/03/15.
//  Copyright (c) 2015 Eduardo Ramos. All rights reserved.
//

#import "FacilitiesViewController.h"

@interface FacilitiesViewController ()
@property (nonatomic)IBOutlet UILabel *visorLabel;
@property (weak, nonatomic) IBOutlet UIButton *botton7;

@end

@implementation FacilitiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.botton7.layer.cornerRadius = 7.0;
    self.botton7.layer.borderWidth = 10.0;
    self.botton7.layer.borderColor = [[UIColor whiteColor] CGColor];
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

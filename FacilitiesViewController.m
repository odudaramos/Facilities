//
//  FacilitiesViewController.m
//  Facilities
//
//  Created by Eduardo Ramos on 25/03/15.
//  Copyright (c) 2015 Eduardo Ramos. All rights reserved.
//

#import "FacilitiesViewController.h"

@interface FacilitiesViewController ()
@property (weak, nonatomic) IBOutlet UIButton *bottom0;
@property (nonatomic)IBOutlet UILabel *visorLabel;
@property (weak, nonatomic) IBOutlet UIButton *bottom7;
@property (weak, nonatomic) IBOutlet UIButton *bottom4;
@property (weak, nonatomic) IBOutlet UIButton *bottom1;
@property (weak, nonatomic) IBOutlet UIButton *bottom8;
@property (weak, nonatomic) IBOutlet UIButton *bottom5;
@property (weak, nonatomic) IBOutlet UIButton *bottom2;
@property (weak, nonatomic) IBOutlet UIButton *bottom9;
@property (weak, nonatomic) IBOutlet UIButton *bottom6;
@property (weak, nonatomic) IBOutlet UIButton *bottom3;
@property NSArray *numero;

@end

@implementation FacilitiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.botton7.layer.cornerRadius = 7.0;
    self.bottom0.layer.borderWidth = 3.0;
    self.bottom0.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.bottom7.layer.borderWidth = 3.0;
    self.bottom7.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.bottom4.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.bottom4.layer.borderWidth = 3.0;
    self.bottom1.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.bottom1.layer.borderWidth = 3.0;
    self.bottom8.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.bottom8.layer.borderWidth = 3.0;
    self.bottom5.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.bottom5.layer.borderWidth = 3.0;
    self.bottom2.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.bottom2.layer.borderWidth = 3.0;
    self.bottom9.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.bottom9.layer.borderWidth = 3.0;
    self.bottom6.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.bottom6.layer.borderWidth = 3.0;
    self.bottom3.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.bottom3.layer.borderWidth = 3.0;
    [self setNumero:[NSArray arrayWithObjects:self.bottom1,self.bottom2,self.bottom3,self.bottom4,self.bottom5,self.bottom6,self.bottom7,self.bottom8,self.bottom9,self.bottom0, nil]];
    for (int x =0; x<self.numero.count; x++) {
        UIButton * btn = [[self numero] objectAtIndex:x];
        [btn addTarget:self action:@selector(cliqueBotao:) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(void)cliqueBotao: (UIButton * )sender{
   // NSLog(@"%@",sender.titleLabel.text);
    self.visorLabel.text = [NSString stringWithFormat:@"%@%@",self.visorLabel.text,sender.titleLabel.text];//sender.titleLabel.text;
    

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

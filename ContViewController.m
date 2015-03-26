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
@property (weak, nonatomic) IBOutlet UIButton *menos;


@property (weak, nonatomic) IBOutlet UIButton *mais;


@property (weak, nonatomic) IBOutlet UIButton *menos2;


@property (weak, nonatomic) IBOutlet UIButton *mais2;

@property int x,x2;

@property (weak, nonatomic) IBOutlet UIButton *resetar;
@property (weak, nonatomic) IBOutlet UIView *alerta;
@property (weak, nonatomic) IBOutlet UILabel *ganhador;

@property (weak, nonatomic) IBOutlet UIView *break2;


@end

@implementation ContViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    UISwipeGestureRecognizer *swipe = [[ UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(mudarTela)];
    
    [swipe setDirection:UISwipeGestureRecognizerDirectionUp];
    
    [self.view addGestureRecognizer:swipe];
    
    UISwipeGestureRecognizer *swipe2 = [[ UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(mudarTela2)];
    [swipe2 setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:swipe2];
    _x=0;
    _x2=0;
    self.mais.layer.cornerRadius = 15.0;
    self.mais.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.mais.layer.borderWidth = 3.0;
    
    self.menos.layer.cornerRadius = 15.0;
    self.menos.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.menos.layer.borderWidth = 3.0;
    
    self.mais2.layer.cornerRadius = 15.0;
    self.mais2.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.mais2.layer.borderWidth = 3.0;
    
    self.menos2.layer.cornerRadius = 15.0;
    self.menos2.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.menos2.layer.borderWidth = 3.0;
    
    self.resetar.layer.cornerRadius = 15.0;
    self.resetar.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.resetar.layer.borderWidth = 3.0;
    self.alerta.layer.borderWidth =8.0;
    self.alerta.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.alerta.layer.cornerRadius = 10.0;
    self.break2.hidden = true;
    self.break2.layer.borderWidth =8.0;
    self.break2.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.break2.layer.cornerRadius = 10.0;
    
}
-(IBAction)cliqueBotao:(id)sender{
    if(_mais.touchInside){
        _x++;
    }else if(_menos.touchInside)
        _x--;
    if (_mais2.touchInside) {
        _x2++;
    }else if (_menos2.touchInside)
        _x2--;
    if (_x <0 || _x >12)
        _x=0;
    
    if (_x2 <0 || _x2 >12)
        _x2=0;
    

    self.cont1.text = [NSString stringWithFormat:@"%d", _x];
    self.cont2.text = [NSString stringWithFormat:@"%d", _x2];
    
    if (_x ==12) {
        self.alerta.hidden = false;
        self.ganhador.text =@"1";
        self.mais.hidden = true;
        self.menos.hidden = true;
        self.mais2.hidden = true;
        self.menos2.hidden = true;
        self.break2.hidden = true;
    }
    if (_x2 ==12) {
        self.alerta.hidden = false;
        self.ganhador.text =@"2";
        self.mais.hidden = true;
        self.menos.hidden = true;
        self.mais2.hidden = true;
        self.menos2.hidden = true;
        self.break2.hidden = true;
        
    }
    if (_x ==11 && _x2==11) {
        self.break2.hidden = false;
    }

    
    
    
}
-(IBAction)resetar:(id)sender{
    self.x = 0;
    self.x2 =0;
    self.cont1.text = [NSString stringWithFormat:@"%d", _x];
    self.cont2.text = [NSString stringWithFormat:@"%d", _x2];
    self.alerta.hidden = YES;
    self.mais.hidden = NO;
    self.menos.hidden = NO;
    self.mais2.hidden = false;
    self.menos2.hidden = false;
    self.break2.hidden = true;

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

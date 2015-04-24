//
//  BhaskaraViewController.m
//  Facilities
//
//  Created by André Rodrigues de Jesus on 3/26/15.
//  Copyright (c) 2015 Eduardo Ramos. All rights reserved.
//

#import "BhaskaraViewController.h"
#import "FlashLightViewController.h"

@interface BhaskaraViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldA;

@property (weak, nonatomic) IBOutlet UITextField *textFieldB;

@property (weak, nonatomic) IBOutlet UITextField *textFieldC;

@property (weak, nonatomic) IBOutlet UIView *alerta;

@property (weak, nonatomic) IBOutlet UIButton *buttonCalcular;

@property (weak, nonatomic) IBOutlet UIButton *buttonLimpar;

@property (weak, nonatomic) IBOutlet UIButton *buttonNegativoA;

@property (weak, nonatomic) IBOutlet UIButton *buttonNegativoB;

@property (weak, nonatomic) IBOutlet UIButton *buttonNegativoC;

@property (weak, nonatomic) IBOutlet UILabel *lbl;


@end

double a = 0;
double na = 0;
double b = 0;
double nb = 0;
double c = 0;
double nc = 0;

@implementation BhaskaraViewController

@synthesize textFieldA;
@synthesize textFieldB;
@synthesize textFieldC;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *swipe = [[ UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(mudarTela)];
    
    [swipe setDirection:UISwipeGestureRecognizerDirectionUp];
    
    [self.view addGestureRecognizer:swipe];
    
    UISwipeGestureRecognizer *swipe2 = [[ UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(mudarTela2)];
    [swipe2 setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:swipe2];
    
    textFieldA.delegate = self;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeyboard)];
    
    [self.view addGestureRecognizer:singleTap];
    
    
    
    self.textFieldA.layer.cornerRadius = 10.0;
    //self.textFieldA.layer.borderColor = [[UIColor orangeColor] CGColor];
    //self.textFieldA.layer.borderWidth = 3.0;
    
    
    self.textFieldB.layer.cornerRadius = 10.0;
    //self.textFieldB.layer.borderColor = [[UIColor orangeColor] CGColor];
    //self.textFieldB.layer.borderWidth = 3.0;
    
    self.textFieldC.layer.cornerRadius = 10.0;
    //self.textFieldC.layer.borderColor = [[UIColor orangeColor] CGColor];
    //self.textFieldC.layer.borderWidth = 3.0;
    
    self.buttonNegativoA.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.buttonNegativoA.layer.backgroundColor = [[UIColor orangeColor] CGColor];
    self.buttonNegativoA.layer.cornerRadius = 10.0;
    
    self.buttonNegativoB.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.buttonNegativoB.layer.backgroundColor = [[UIColor orangeColor] CGColor];
    self.buttonNegativoB.layer.cornerRadius = 10.0;
    
    self.buttonNegativoC.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.buttonNegativoC.layer.backgroundColor = [[UIColor orangeColor] CGColor];
    self.buttonNegativoC.layer.cornerRadius = 10.0;
    
    self.buttonCalcular.layer.cornerRadius = 10.0;
    //self.buttonCalcular.layer.borderColor = [[UIColor blackColor] CGColor];
    //self.buttonCalcular.layer.borderWidth = 3.0;
    
    self.buttonLimpar.layer.cornerRadius = 10.0;
    //self.buttonLimpar.layer.backgroundColor = [[UIColor whiteColor] CGColor];
    //self.buttonLimpar.layer.borderColor = [[UIColor blackColor] CGColor];
    //self.buttonLimpar.layer.borderWidth = 3.0;
//    
//    textFieldA.keyboardType = UIKeyboardTypeNumberPad;
//    textFieldB.keyboardType = UIKeyboardTypeNumberPad;
//    textFieldC.keyboardType = UIKeyboardTypeNumberPad;
}

-(void)hideKeyboard {
    [textFieldA resignFirstResponder];
    [textFieldB resignFirstResponder];
    [textFieldC resignFirstResponder];
}
-(void)mudarTela2 {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)mudarTela {
    
    FlashLightViewController * nova = [[FlashLightViewController alloc] initWithNibName:@"FlashLightViewController" bundle:nil] ;
    
    [self presentViewController:nova animated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)cliqueBtnNegativoA:(id)sender {
    
    if(textFieldA.text && textFieldA.text.length == 0){
        NSLog(@"Vazio");
    }
    else{
        a = [textFieldA.text doubleValue];
        na = -a;
        //NSLog(@"%f",na);
        self.textFieldA.text = [NSString stringWithFormat:@"%g",na];
    }
}

- (IBAction)cliqueBtnNegativoB:(id)sender {
    
    if(textFieldB.text && textFieldB.text.length == 0){
        NSLog(@"Vazio");
    }
    else{
        b = [textFieldB.text doubleValue];
        nb = -b;
        //NSLog(@"%f",nb);
        self.textFieldB.text = [NSString stringWithFormat:@"%g",nb];
        NSLog(@"%f",nb);
    }
    
    
}

- (IBAction)cliqueBtnNegativoC:(id)sender {
    
    if(textFieldC.text && textFieldC.text.length == 0){
        NSLog(@"Vazio");
    }
    else{
        c = [textFieldC.text doubleValue];
        nc = -c;
        //NSLog(@"%f",nc);
        self.textFieldC.text = [NSString stringWithFormat:@"%g",nc];
    }
    
}

- (IBAction)cliqueLimpar:(id)sender {
    self.textFieldA.text = @"";
    self.textFieldB.text = @"";
    self.textFieldC.text = @"";
}


-(IBAction)cliqueBotao:(id) sender{
    
    if(self.buttonNegativoA.isTouchInside == false)
        a = [textFieldA.text doubleValue];
    else
        a = na;
    if(self.buttonNegativoB.isTouchInside == false)
        b = [textFieldB.text doubleValue];
    else
        b = nb;
    if(self.buttonNegativoC.isTouchInside == false)
        c = [textFieldC.text doubleValue];
    else
        c = nc;
    
    NSLog(@"valor a %f",a);
    NSLog(@"valor b %f",b);
    NSLog(@"valor c %f",c);
    double x = 0;
    
    if(([textFieldA.text  isEqual: @""]) || ([textFieldB.text  isEqual: @""])||([textFieldC.text  isEqual: @""])){
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Atenção!" message:@"Digite o(s) número(s)!"
                              delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else{
        if(a == 0){
            x = (-c)/b;
            
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Resultado" message:[NSString stringWithFormat:@"%g", x]
                                  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        else{
            double delta = pow(b, 2)-4* (a*c);
            double raizDelta = sqrt(delta);
            
            if(delta < 0){
                
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle:@"Resultado" message:[NSString stringWithFormat:@"O resultado de delta foi %g. \n Não existe raiz de número negativo", delta]
                                      delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                
            }
            else{
                double x1 = (-b+raizDelta)/(2*a);
                double x2 = (+b+raizDelta)/(2*a);
                
                if(x2 == 0){
                    x2 = 0;
                }
                else{
                   x2 = -(+b+raizDelta)/(2*a);
                }
                
                NSLog(@"%f",x2);
                
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle:@"Resultado" message:[NSString stringWithFormat:@"\nO valor de delta é %.2lf\n\n x1 = %.2lf\n\n x2 = %g", delta,x1,x2]
                                      delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
            
        }
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

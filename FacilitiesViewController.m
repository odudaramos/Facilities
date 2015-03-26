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


@property (weak, nonatomic) IBOutlet UIButton *bottomMais;

@property (weak, nonatomic) IBOutlet UIButton *bottomMenos;

@property (weak, nonatomic) IBOutlet UIButton *bottomPorcento;

@property (weak, nonatomic) IBOutlet UIButton *bottomVezes;
@property (weak, nonatomic) IBOutlet UIButton *bottomDividir;

@property (weak, nonatomic) IBOutlet UIButton *botttomIgual;
@property (weak, nonatomic) IBOutlet UIButton *bottomCE;
@property (weak, nonatomic) IBOutlet UIButton *bottomPoint;
@property float k,j;
@property BOOL flag;
typedef enum{
    soma,
    dividir,
    multiplicar,
    subtrair,
    porcento
    
    
}operacao;
@property int op;

@property (weak, nonatomic) IBOutlet UIView *barra;


@property (weak, nonatomic) IBOutlet UISwitch *precisao;


@end

@implementation FacilitiesViewController





- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *swipe = [[ UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(mudarTela)];
    
    [swipe setDirection:UISwipeGestureRecognizerDirectionUp];
    
    [self.view addGestureRecognizer:swipe];
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:self.bottom1,self.bottom2,self.bottom3,self.bottom4,self.bottom5,self.bottom6,self.bottom7,self.bottom8,self.bottom9,self.bottom0,self.bottomPoint, nil];
    for (int x =0; x<array.count; x++) {
        UIButton * btn = [array objectAtIndex:x];
        btn.layer.borderColor = [[UIColor whiteColor] CGColor];
        btn.layer.borderWidth = 3.0;
        [btn addTarget:self action:@selector(cliqueBotao:) forControlEvents:UIControlEventTouchUpInside];

    }
    array = [NSMutableArray arrayWithObjects:self.bottomPorcento,self.bottomVezes,self.botttomIgual, self.bottomCE,self.bottomDividir,self.bottomMais,self.bottomMenos,nil];
    for (int x =0; x<array.count; x++) {
        UIButton * btn = [array objectAtIndex:x];
        btn.layer.borderColor = [[UIColor blackColor] CGColor];
        btn.layer.borderWidth = 5.0;
        [btn addTarget:self action:@selector(cliqueBotao:) forControlEvents:UIControlEventTouchUpInside];
    }
    _barra.layer.borderColor = [[UIColor whiteColor] CGColor];
    _barra.layer.borderWidth = 3.0;
    _visorLabel.layer.cornerRadius = 30.0;
    [_precisao setOn:NO animated:NO];
    
}



-(void)cliqueBotao: (UIButton * )sender{
   // NSLog(@"%@",sender.titleLabel.text);
    
    if (sender == self.bottomDividir) {
        _op = dividir;
        _j =[[[self visorLabel] text] floatValue];
         self.visorLabel.text = @"";
        
        return;
        
    }
    if (sender == self.bottomMenos) {
        _op = subtrair;
        _j =[[[self visorLabel] text] floatValue];
        self.visorLabel.text = @"";
        
        return;
        
    }
    if (sender == self.bottomMais) {
        _op = soma;
        _j =[[[self visorLabel] text] floatValue];
        self.visorLabel.text = @"";
        
        return;
        
    }
    if (sender == self.bottomPorcento) {
        _op = porcento;
        _j =[[[self visorLabel] text] floatValue];
        self.visorLabel.text = @"";
        
        return;
        
    }
    if (sender == self.bottomVezes) {
        _op = multiplicar;
        _j =[[[self visorLabel] text] floatValue];
        self.visorLabel.text = @"";
        
        return;
        
    }


    if (sender == self.botttomIgual) {
      _k = [[[self visorLabel] text] floatValue];
        if (_op == dividir) {
            if (_precisao.on) {
                 self.visorLabel.text = [NSString stringWithFormat:@"%f",_j/_k];
            }else
            self.visorLabel.text = [NSString stringWithFormat:@"%.1f",_j/_k];
            
            return;
        }
        if (_op == subtrair) {
            if (_precisao.on) {
                self.visorLabel.text = [NSString stringWithFormat:@"%f",_j-_k];
            }else
                self.visorLabel.text = [NSString stringWithFormat:@"%.1f",_j-_k];            return;
        }
        if (_op == soma) {
            if (_precisao.on) {
                self.visorLabel.text = [NSString stringWithFormat:@"%f",_j+_k];
            }else
                self.visorLabel.text = [NSString stringWithFormat:@"%.1f",_j+_k];
            return;
        }
        if (_op == multiplicar) {
            if (_precisao.on) {
                self.visorLabel.text = [NSString stringWithFormat:@"%f",_j*_k];
            }else
                self.visorLabel.text = [NSString stringWithFormat:@"%.1f",_j*_k];
            return;
        }
        if (_op == subtrair) {
            if (_precisao.on) {
                self.visorLabel.text = [NSString stringWithFormat:@"%f",_j-_k];
            }else
                self.visorLabel.text = [NSString stringWithFormat:@"%.1f",_j-_k];
            return;
        }

        if (_op == porcento) {
            if (_precisao.on) {
                self.visorLabel.text = [NSString stringWithFormat:@"%f",_j/100];
            }else
                self.visorLabel.text = [NSString stringWithFormat:@"%.1f",_j/100];
            return;
        }

    }

    if (sender == self.bottomCE) {
        self.visorLabel.text =@"";
        return;
    }
    self.visorLabel.text = [NSString stringWithFormat:@"%@%@",self.visorLabel.text,sender.titleLabel.text];//sender.titleLabel.text;
    
  
    UIView *ex;
    
    [ex addSubview:[self bottom0]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mudarTela {
    
    ContViewController * nova = [[ContViewController alloc] initWithNibName:@"ContViewController" bundle:nil] ;
    
    [self presentViewController:nova animated:YES completion:nil];
    
    //[self.navigationController pushViewController:nova animated:YES];
    
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

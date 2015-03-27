//
//  FlashLightViewController.m
//  Facilities
//
//  Created by André Rodrigues de Jesus on 3/27/15.
//  Copyright (c) 2015 Eduardo Ramos. All rights reserved.
//

#import "FlashLightViewController.h"

@interface FlashLightViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flashLabel;
@property (weak, nonatomic) IBOutlet UIButton *flashButton;

@property (readwrite) BOOL onOff;


@end

@implementation FlashLightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.flashButton.layer.cornerRadius = 20.0;
    self.flashButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.flashButton.layer.borderWidth = 3.0;
    
    UISwipeGestureRecognizer *swipe2 = [[ UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(mudarTela2)];
    [swipe2 setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:swipe2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mudarTela2 {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)cliqueBotao:(id)sender {
    
    UIButton *button = (UIButton *)sender;
    [self toggleFlashlight];
    
    if(!_onOff){
        [self.view setBackgroundColor:[UIColor whiteColor]];
       // [button setTitle:@"On" forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor blackColor]];
        self.flashLabel.textColor = [UIColor blackColor];
        self.flashButton.layer.cornerRadius = 20.0;
        self.flashButton.layer.borderColor = [[UIColor whiteColor] CGColor];
        self.flashButton.layer.borderWidth = 3.0;
        
    }
    else{
        [self.view setBackgroundColor:[UIColor blackColor]];
        //[button setTitle:@"Off" forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor whiteColor]];
        self.flashLabel.textColor = [UIColor whiteColor];
        self.flashButton.layer.cornerRadius = 20.0;
        self.flashButton.layer.borderColor = [[UIColor whiteColor] CGColor];
        self.flashButton.layer.borderWidth = 3.0;
    }
    
    _onOff = !_onOff;
}

- (void)toggleFlashlight
{
    AVCaptureDevice * captDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([captDevice hasFlash]&&[captDevice hasTorch]) {
        if (captDevice.torchMode == AVCaptureTorchModeOff) {
        //    [backImage setImage:[UIImage imageNamed:@"Icon-76@2x.png"]];
            [captDevice lockForConfiguration:nil];
            [captDevice setTorchMode:AVCaptureTorchModeOn];
            [captDevice unlockForConfiguration];
            
        }else {
            //[backImage setImage:[UIImage imageNamed:@"flashBG0.png"]];
            [captDevice lockForConfiguration:nil];
            [captDevice setTorchMode:AVCaptureTorchModeOff];
            [captDevice unlockForConfiguration];
            
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

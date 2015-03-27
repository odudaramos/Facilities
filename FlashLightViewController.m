//
//  FlashLightViewController.m
//  Facilities
//
//  Created by André Rodrigues de Jesus on 3/27/15.
//  Copyright (c) 2015 Eduardo Ramos. All rights reserved.
//

#import "FlashLightViewController.h"

@interface FlashLightViewController ()

@property (weak, nonatomic) IBOutlet UIButton *flashButton;

@property (readwrite) BOOL onOff;


@end

@implementation FlashLightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UISwipeGestureRecognizer *swipe = [[ UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(mudarTela2)];
    
    [swipe setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:swipe];
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
        [self.view setBackgroundColor:[UIColor blackColor]];
        [button setTitle:@"On" forState:UIControlStateNormal];
        
        
    }
    else{
        [self.view setBackgroundColor:[UIColor blackColor]];
        [button setTitle:@"Off" forState:UIControlStateNormal];
    }
    
    _onOff = !_onOff;
}

- (void)toggleFlashlight
{
    AVCaptureDevice * captDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([captDevice hasFlash]&&[captDevice hasTorch]) {
        if (captDevice.torchMode == AVCaptureTorchModeOff) {
            //[backImage setImage:[UIImage imageNamed:@"flashBG1.png"]];
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

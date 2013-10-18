//
//  ViewController.m
//  SlapFlashCamera
//
//  Created by Nick Such on 10/18/13.
//  Copyright (c) 2013 Awesome Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)makeItFlash:(id)sender {
    self.fakeFlashIndicator.backgroundColor = [UIColor blackColor];
    
    AVCaptureDevice *backCamera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ( [backCamera isTorchAvailable] && [backCamera isTorchModeSupported:AVCaptureTorchModeOn]  )
    {
        BOOL success = [backCamera lockForConfiguration:nil];
        if ( success )
        {
            [backCamera setTorchMode:AVCaptureTorchModeOn];
            [backCamera unlockForConfiguration];
        }
    }
}

- (IBAction)fakeFlashIndicatorOff:(id)sender {
    self.fakeFlashIndicator.backgroundColor = [UIColor whiteColor];
    AVCaptureDevice *backCamera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ( [backCamera isTorchAvailable] && [backCamera isTorchModeSupported:AVCaptureTorchModeOn]  )
    {
        BOOL success = [backCamera lockForConfiguration:nil];
        if ( success )
        {
            [backCamera setTorchMode:AVCaptureTorchModeOff];
            [backCamera unlockForConfiguration];
        }
    }
}

- (IBAction)makeItFlashOffOutside:(id)sender {
    self.fakeFlashIndicator.backgroundColor = [UIColor whiteColor];
}


- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake)
    {
        // User was shaking the device. Post a notification named "shake."
        [[NSNotificationCenter defaultCenter] postNotificationName:@"shake" object:self];
        self.fakeFlashIndicator.backgroundColor = [UIColor blackColor];
        
        AVCaptureDevice *backCamera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if ( [backCamera isTorchAvailable] && [backCamera isTorchModeSupported:AVCaptureTorchModeOn]  )
        {
            BOOL success = [backCamera lockForConfiguration:nil];
            if ( success )
            {
                [backCamera setTorchMode:AVCaptureTorchModeOn];
                [backCamera unlockForConfiguration];
            }
        }
    }
}


@end

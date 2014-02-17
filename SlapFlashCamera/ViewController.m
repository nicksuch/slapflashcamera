//
//  ViewController.m
//  SlapFlashCamera
//
//  Created by Nick Such on 10/18/13.
//  Copyright (c) 2013 Awesome Inc. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

@synthesize picker = _picker;

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

- (IBAction)shutterPressed:(id)sender {
    // Old code, executed on Main Thread. Moved this to background thread.
if (self.picker == nil) {
     self.picker = [[UIImagePickerController alloc] init];
     self.picker.delegate = self;
     self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
     self.picker.allowsEditing = NO;
     }
    [self.navigationController presentModalViewController:_picker animated:YES];
}

#pragma mark UIImagePickerControlDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissModalViewControllerAnimated:YES];
    UIImage *fullImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
    
     self.viewfinderImageView.image = fullImage;
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

//
//  ViewController.h
//  SlapFlashCamera
//
//  Created by Nick Such on 10/18/13.
//  Copyright (c) 2013 Awesome Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) UIImagePickerController *picker;
@property (weak, nonatomic) IBOutlet UILabel *fakeFlashIndicator;
@property (weak, nonatomic) IBOutlet UIImageView *viewfinderImageView;
@property (weak, nonatomic) IBOutlet UILabel *isWoundLabel;

- (IBAction)makeItFlash:(id)sender;
- (IBAction)fakeFlashIndicatorOff:(id)sender;
- (IBAction)makeItFlashOffOutside:(id)sender;
- (IBAction)shutterPressed:(id)sender;
- (IBAction)windCamera:(id)sender;

@end

//
//  ViewController.h
//  SlapFlashCamera
//
//  Created by Nick Such on 10/18/13.
//  Copyright (c) 2013 Awesome Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *fakeFlashIndicator;
- (IBAction)makeItFlash:(id)sender;
- (IBAction)fakeFlashIndicatorOff:(id)sender;
- (IBAction)makeItFlashOffOutside:(id)sender;


@end

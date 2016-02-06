//
//  ViewController.h
//  SuperpoweredAudioIn
//
//  Created by 本池 巧 on 2016/02/06.
//  Copyright © 2016年 MOTOIKE Takumi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuperpoweredIOSAudioIO.h"
#import "SuperpoweredSimple.h"

@interface ViewController : UIViewController
{
    SuperpoweredIOSAudioIO *audioIO;
    float *stereoBuffer;
    float volume;
}

- (IBAction)changeVolume:(UISlider *)sender;

@end


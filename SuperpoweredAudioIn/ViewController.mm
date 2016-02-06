//
//  ViewController.m
//  SuperpoweredAudioIn
//
//  Created by 本池 巧 on 2016/02/06.
//  Copyright © 2016年 MOTOIKE Takumi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // Audio input/output handling.
    audioIO = [[SuperpoweredIOSAudioIO alloc] initWithDelegate:(id<SuperpoweredIOSAudioIODelegate>)self
                                           preferredBufferSize:12
                                    preferredMinimumSamplerate:44100
                                          audioSessionCategory:AVAudioSessionCategoryPlayAndRecord
                                                      channels:2];
    [audioIO start];
    if (posix_memalign((void **)&stereoBuffer, 16, 4096 + 128) != 0)
        abort();
    volume = 0.5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)interruptionStarted {}
- (void)interruptionEnded {}
- (void)recordPermissionRefused {}
- (void)mapChannels:(multiOutputChannelMap *)outputMap inputMap:(multiInputChannelMap *)inputMap externalAudioDeviceName:(NSString *)externalAudioDeviceName outputsAndInputs:(NSString *)outputsAndInputs {}

- (bool)audioProcessingCallback:(float **)buffers inputChannels:(unsigned int)inputChannels outputChannels:(unsigned int)outputChannels numberOfSamples:(unsigned int)numberOfSamples samplerate:(unsigned int)currentsamplerate hostTime:(UInt64)hostTime {
    for( int i = 0 ; i < numberOfSamples ; i++){
        buffers[0][i] *= volume;
        buffers[1][i] *= volume;
    }
        return true;
}

- (IBAction)changeVolume:(UISlider *)sender {
    volume = sender.value;
}
@end

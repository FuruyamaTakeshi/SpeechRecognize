//
//  FTRecognizerManager.m
//  SpeechRecognize
//
//  Created by 古山 健司 on 2013/11/04.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "FTSKRecognizerManager.h"
#import <SpeechKit/SpeechKit.h>

const unsigned char SpeechKitApplicationKey[] = {};

@implementation FTSKRecognizerManager

- (id)init
{
    LOG_METHOD
    self = [super init];
    if (self) {
        [SpeechKit setupWithID:@""
                          host:@""
                          port:0
                        useSSL:NO
                      delegate:nil];
    }
    return self;
}
@end

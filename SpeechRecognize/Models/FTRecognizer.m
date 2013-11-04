//
//  FTRecognizer.m
//  SpeechRecognize
//
//  Created by 古山 健司 on 2013/11/04.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "FTRecognizer.h"

@implementation FTRecognizer
- (id)initWithDelegate:(id)delegate
{
    self = [super init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

- (void)stopRecording
{
    LOG_METHOD
}

- (void)cancel
{
    LOG_METHOD
}
- (NSString *)firstResult
{
    LOG_METHOD
    return nil;
}
@end

//
//  FTSKRecognition.m
//  SpeechRecognize
//
//  Created by 古山 健司 on 2013/11/04.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "FTSKRecognition.h"
#import <SpeechKit/SpeechKit.h>
@implementation FTSKRecognition
- (id)initWithRecognition:(SKRecognition *)recognition
{
    self = [super initWithRecognition:recognition];
    if (self) {
        self.results = recognition.results;
        self.scores = recognition.scores;
        self.suggestion = recognition.suggestion;
    }
    return self;
}

- (NSString *)firstResult
{
    LOG_METHOD
    return [self.recognition firstResult];
}
@end

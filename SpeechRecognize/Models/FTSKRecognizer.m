//
//  FTSKRecognizer.m
//  SpeechRecognize
//
//  Created by 古山 健司 on 2013/11/04.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "FTSKRecognizer.h"
#import "FTSKRecognition.h"

@implementation FTSKRecognizer

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    SKEndOfSpeechDetection detectionType = SKNoEndOfSpeechDetection;
    NSString *recoType = SKDictationRecognizerType;
    NSString *langType = @"ja-JP";
    SKRecognizer *recognizer = [[SKRecognizer alloc] initWithType:recoType
                                           detection:detectionType
                                            language:langType
                                            delegate:self];

    self.voiceSearch = recognizer;
    self.audioLevel = recognizer.audioLevel;
    return self;
}

- (void)stopRecording
{
    LOG_METHOD
    [self.voiceSearch stopRecording];
}

- (void)cancel
{
    LOG_METHOD
    [self.voiceSearch cancel];
}

- (void)recognizerDidBeginRecording:(SKRecognizer *)recognizer
{
    LOG_METHOD
    [self.delegate recognizerDidBeginRecording:self];
}

- (void)recognizerDidFinishRecording:(SKRecognizer *)recognizer
{
    LOG_METHOD
    [self.delegate recognizerDidFinishRecording:self];
}

- (void)recognizer:(SKRecognizer *)recognizer didFinishWithResults:(SKRecognition *)results
{
    LOG_METHOD
    FTSKRecognition *recognition = [[FTSKRecognition alloc] initWithRecognition:results];
    [self.delegate recognizer:recognizer didFinishWithResults:recognition];
}

- (void)recognizer:(SKRecognizer *)recognizer didFinishWithError:(NSError *)error suggestion:(NSString *)suggestion
{
    LOG_METHOD
    [self.delegate recognizer:recognizer didFinishWithError:error suggestion:suggestion];
}


@end

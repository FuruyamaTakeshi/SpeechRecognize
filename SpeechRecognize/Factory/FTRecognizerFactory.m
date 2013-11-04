//
//  FTRecognizerFactory.m
//  SpeechRecognize
//
//  Created by 古山 健司 on 2013/11/04.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "FTRecognizerFactory.h"
#import "FTSKRecognizer.h"
@implementation FTRecognizerFactory
- (id)createProductWithName:(NSString *)name delegate:(id)delegate
{
    if ([name isEqualToString:@"SKSpeech"]) {
        return [[FTSKRecognizer alloc] initWithDelegate:delegate];
    }
    return nil;
}

@end

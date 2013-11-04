//
//  FTRecognition.m
//  SpeechRecognize
//
//  Created by 古山 健司 on 2013/11/04.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "FTRecognition.h"

@implementation FTRecognition
- (id)initWithRecognition:(id)recognition
{
    self = [super init];
    if (self) {
        self.recognition = recognition;
    }
    return self;
}
- (NSString *)firstResult
{
    return nil;
}
@end

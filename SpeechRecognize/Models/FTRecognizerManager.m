//
//  FTRecognizerManager.m
//  SpeechRecognize
//
//  Created by 古山 健司 on 2013/11/04.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "FTRecognizerManager.h"

@implementation FTRecognizerManager
+ (id)sharedManager
{
    LOG_METHOD
    static id sharedmanager = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        sharedmanager = [[self alloc] init];
    });
    return sharedmanager;
}
@end

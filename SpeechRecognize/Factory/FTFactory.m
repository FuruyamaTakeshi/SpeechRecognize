//
//  FTFactory.m
//  SpeechRecognize
//
//  Created by 古山 健司 on 2013/11/04.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "FTFactory.h"
#import "FTRecognizerFactory.h"
#import "FTManagerFactory.h"

@implementation FTFactory
+ (id)factoryWithName:(NSString *)name
{
    if ([name isEqualToString:@"speechRecognizer"]) {
        return [[FTRecognizerFactory alloc] init];
    }
    if ([name isEqualToString:@"recogManager"]) {
        return [[FTManagerFactory alloc] init];
    }
    return nil;
}

- (id)createProductWithName:(NSString *)name delegate:(id)delegate
{
    return nil;
}

- (id)createProductWithName:(NSString *)name
{
    return nil;
}
@end

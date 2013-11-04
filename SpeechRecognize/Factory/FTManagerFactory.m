//
//  FTManagerFactory.m
//  SpeechRecognize
//
//  Created by 古山 健司 on 2013/11/04.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "FTManagerFactory.h"
#import "FTSKRecognizerManager.h"

@implementation FTManagerFactory
- (id)createProductWithName:(NSString *)name
{
    LOG_METHOD
    if ([name isEqualToString:@"SKManager"]) {
        return [FTSKRecognizerManager sharedManager];
    }
    return nil;
}
@end

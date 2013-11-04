//
//  FTSKRecognition.h
//  SpeechRecognize
//
//  Created by 古山 健司 on 2013/11/04.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "FTRecognition.h"
/**
 * @brief 認識結果格納クラス(SpeechKit Dragon Mobile SDK)具象クラス
 */
@class SKRecognition;
@interface FTSKRecognition : FTRecognition
- (id)initWithRecognition:(SKRecognition *)recognition;

@end

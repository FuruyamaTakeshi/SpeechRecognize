//
//  FTSKRecognizer.h
//  SpeechRecognize
//
//  Created by 古山 健司 on 2013/11/04.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import "FTRecognizer.h"
#import <SpeechKit/SpeechKit.h>
/**
 * @brief 認識エンジンクラス(具象クラス)本クラスはDragonMobileSDKをWrappする
 */
@interface FTSKRecognizer : FTRecognizer <SKRecognizerDelegate>

@end

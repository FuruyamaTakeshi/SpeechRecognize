//
//  FTRecognizerManager.h
//  SpeechRecognize
//
//  Created by 古山 健司 on 2013/11/04.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * @brief 認識処理管理クラス(抽象クラス)　Singletonモデル
 */
@interface FTRecognizerManager : NSObject
/**
 * @brief クラスメソッド
 * @return インスタンス
 */
+ (id)sharedManager;
@end

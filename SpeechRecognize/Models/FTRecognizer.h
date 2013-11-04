//
//  FTRecognizer.h
//  SpeechRecognize
//
//  Created by 古山 健司 on 2013/11/04.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol FTRecognizerDelegate
@optional
- (void)recognizerDidBeginRecording:(id)recognizer;
- (void)recognizerDidFinishRecording:(id)recognizer;
@required
- (void)recognizer:(id)recognizer didFinishWithResults:(id)results;
- (void)recognizer:(id)recognizer didFinishWithError:(NSError *)error suggestion:(NSString *)suggestion;
@end
/**
 * @brief 認識エンジンクラス(抽象クラス)
 */
@interface FTRecognizer : NSObject
@property (nonatomic) id delegate;
@property (nonatomic) id voiceSearch;
@property (nonatomic) float audioLevel;
/**
 * @brief イニシャライザ
 * @param[in] 認識結果格納クラスインスタンス
 * @return インスタンス
 */
- (id)initWithDelegate:(id<FTRecognizerDelegate>)delegate;
/**
 * @brief 録音を停止して、認識処理を開始する
 * @param[in] delegate
 * @return 本インスタンス
 */
- (void)stopRecording;
/**
 * @brief 認識処理をキャンセルする
 * @param[in] 認識結果格納クラスインスタンス
 * @return 無し
 */
- (void)cancel;
@end

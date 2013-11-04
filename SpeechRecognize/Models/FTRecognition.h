//
//  FTRecognition.h
//  SpeechRecognize
//
//  Created by 古山 健司 on 2013/11/04.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * @brief 認識結果集約クラス(抽象クラス)
 */
@interface FTRecognition : NSObject
@property (nonatomic) id recognition;
@property (nonatomic) NSString *result;
@property (nonatomic) NSArray *results;
@property (nonatomic) NSArray *scores;
@property (nonatomic) NSString *suggestion;
/**
 * @brief イニシャライザ
 * @param[in] 認識結果格納クラスインスタンス
 * @return インスタンス
 */
- (id)initWithRecognition:(id)recognition;
/**
 * @brief 認識結果文字列配列の１番目を返すメソッド
 * @return 認識結果文字列
 */
- (NSString *)firstResult;
@end

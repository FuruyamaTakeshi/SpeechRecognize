//
//  FTFactory.h
//  SpeechRecognize
//
//  Created by 古山 健司 on 2013/11/04.
//  Copyright (c) 2013年 TF. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * @brief Factoryクラス
 */
@interface FTFactory : NSObject
/**
 * @brief Factory具象クラスを生成する
 * @param[in] key
 * @return Factory具象クラスインスタンス
 */
+ (id)factoryWithName:(NSString *)name;
/**
 * @brief インスタンス生成メソッド
 * @param[in] key
 * @return インスタンス
 */
- (id)createProductWithName:(NSString *)name;
/**
 * @brief インスタンス生成メソッド
 * @param[in] key
 * @param[in] delgate
 * @return インスタンス
 */
- (id)createProductWithName:(NSString *)name delegate:(id)delegate;

@end

//
//  GCDTimer.h
//  体系_OC
//
//  Created by z Hahn on 2022/6/20.
//

#import <Foundation/Foundation.h>

@interface GCDTimer : NSObject


/**
 * 对象创建定时器 主线程创建
 * interval 定时时间
 * repeat 是否轮询
 * block 返回
 */
- (instancetype)initWithTimeInterval:(NSTimeInterval)interval repeat:(BOOL)repeat block:(dispatch_block_t)block;

/**
 * 对象创建定时器 主线程创建
 * interval 定时时间
 * repeat 是否轮询
 * queue 线程
 * block 返回
 */
- (instancetype)initWithTimeInterval:(NSTimeInterval)interval repeat:(BOOL)repeat queue:(dispatch_queue_t)queue block:(dispatch_block_t)block;

/**
 * 类创建定时器 主线程创建
 * interval 定时时间
 * repeat 是否轮询
 * block 返回
 */
+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeat:(BOOL)repeat queue:(dispatch_queue_t)queue block:(dispatch_block_t)block;

/**
 * 类创建定时器 主线程创建
 * interval 定时时间
 * repeat 是否轮询
 * queue 线程
 * block 返回
 */
+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeat:(BOOL)repeat block:(dispatch_block_t)block;

/**
 * 设置定时器时间
 * interval 定时时间
 */
- (void)setTimeInterval:(NSTimeInterval)interval;

/**
 * 停止定时器
 */
- (void)stop;

/**
 * 重启定时器
 */
- (void)restart;

/**
 * 释放定时器
 */
- (void)invalidate;

@end



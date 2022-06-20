//
//  GCDTimer.m
//  体系_OC
//
//  Created by z Hahn on 2022/6/20.
//

#import "GCDTimer.h"

@interface GCDTimer() {
    dispatch_source_t _timer;
    BOOL _isFire;
}

@end

@implementation GCDTimer

- (instancetype)initWithTimeInterval:(NSTimeInterval)interval repeat:(BOOL)repeat block:(dispatch_block_t)block {
    return [self initWithTimeInterval:interval repeat:repeat queue:dispatch_get_main_queue() block:block];
}

- (instancetype)initWithTimeInterval:(NSTimeInterval)interval repeat:(BOOL)repeat queue:(dispatch_queue_t)queue block:(dispatch_block_t)block {
    NSAssert(queue != NULL, @"queue can't be NULL while create GCDTimer");
    
    if (self = [super init]) {
        // 创建线程
        _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        dispatch_source_set_timer(_timer, dispatch_time(DISPATCH_TIME_NOW, 0), interval * NSEC_PER_SEC, 0);
       
        // 执行任务
        dispatch_source_set_event_handler(_timer, ^{
            if (block) {
                block();
            }
            if (!repeat) {
                self->_isFire = NO;
                dispatch_source_cancel(self->_timer);
            }
        });
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(interval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            dispatch_resume(self->_timer);
            self->_isFire = YES;
        });
    }
    
    return self;
}

+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeat:(BOOL)repeat queue:(dispatch_queue_t)queue block:(dispatch_block_t)block {
    return [[GCDTimer alloc] initWithTimeInterval:interval repeat:repeat queue:queue block:block];
}

+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeat:(BOOL)repeat block:(dispatch_block_t)block {
    return [self scheduledTimerWithTimeInterval:interval repeat:repeat queue:dispatch_get_main_queue() block:block];
}

- (void)setTimeInterval:(NSTimeInterval)interval {
    if (_isFire) {
        dispatch_source_set_timer(_timer, dispatch_time(DISPATCH_TIME_NOW, 0), interval * NSEC_PER_SEC, 0);
    }
}

- (void)stop {
    if (_isFire) {
        _isFire = NO;
        //  挂起定时器队列
        dispatch_suspend(_timer);
    }
}

- (void)restart {
    if (!_isFire) {
        _isFire = YES;
        // 恢复定时器队列
        dispatch_resume(_timer);
    }
}

- (void)invalidate {
    _isFire = NO;
    // 取消定时器队列
    dispatch_source_cancel(_timer);
}

- (void)dealloc {
    _isFire = NO;
    // 取消定时器队列
    dispatch_source_cancel(_timer);
}

@end


//
//  BaseModel.h
//  StudyOC
//
//  Created by z Hahn on 2022/7/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, CellType) {
    CellTypeWidget = 0, // 小组件
    CellTypeCategory = 1, // 分类和扩展
    CellTypeCGDTimer = 2, // CGD 定时器
};

@interface BaseModel : NSObject

@end

NS_ASSUME_NONNULL_END

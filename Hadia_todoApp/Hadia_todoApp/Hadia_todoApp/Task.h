//
//  Task.h
//  Hadia_todoApp
//
//  Created by Hadia Yehia on 30/04/2023.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSObject
@property NSString *name;
@property NSString *desc;
@property NSString *priority;
@property NSString *state;
@property NSString *imgPath;
// automatic date;
@property NSDate *date;

@end

NS_ASSUME_NONNULL_END

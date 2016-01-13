//
//  Person.h
//  EqualAndHashTest
//
//  Created by sjpsega on 16/1/7.
//  Copyright © 2016年 sjpsega. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCopying>

@property (copy, nonatomic)NSString *name;

- (instancetype)initWithName:(NSString *)name;
- (BOOL)isEqualToPerson:(Person *)person;
@end

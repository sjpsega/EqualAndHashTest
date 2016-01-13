//
//  PersonWithoutHash.m
//  EqualAndHashTest
//
//  Created by sjpsega on 16/1/13.
//  Copyright © 2016年 sjpsega. All rights reserved.
//

#import "PersonWithoutHash.h"

@implementation PersonWithoutHash

- (NSUInteger)hash{
    return random();
}
@end

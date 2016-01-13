//
//  Person.m
//  EqualAndHashTest
//
//  Created by sjpsega on 16/1/7.
//  Copyright © 2016年 sjpsega. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name{
    self = [super init];
    if(self){
        _name = [name copy];
    }
    return self;
}

- (BOOL)isEqualToPerson:(Person *)person{
    if(!person){
        return NO;
    }
    if((!person.name && !self.name) || [person.name isEqualToString:self.name]){
        return YES;
    }
    return NO;
}

#pragma mark - NSObject
- (BOOL)isEqual:(id)object{
    NSLog(@"isEqual 1");
    if(self == object){
        return YES;
    }
    if(![object isKindOfClass:[Person class]]){
        return NO;
    }
    return [self isEqualToPerson:(Person *)object];
}

- (NSUInteger)hash{
    NSLog(@"hash 22");
    return [_name hash];
}

#pragma mark - implement NSCopying
- (id)copyWithZone:(nullable NSZone *)zone{
    NSLog(@"copyWithZone 333");
    Person *copy = [[[self class] alloc] initWithName:self.name];
    return copy;
}
@end

//
//  EqualAndHashTestTests.m
//  EqualAndHashTestTests
//
//  Created by sjpsega on 16/1/7.
//  Copyright © 2016年 sjpsega. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Person.h"
#import "PersonWithoutHash.h"

@interface EqualAndHashTestTests : XCTestCase
@property (strong, nonatomic)NSMutableDictionary *dic;
@end

@implementation EqualAndHashTestTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _dic = [@{} mutableCopy];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [_dic removeAllObjects];
    _dic = nil;
    [super tearDown];
}

- (void)testEqual {
    Person *a = [[Person alloc] initWithName:@"1"];
    Person *b = [[Person alloc] initWithName:@"1"];
    XCTAssertTrue([a isEqualToPerson:b]);
    XCTAssertTrue([a isEqual:b]);
    XCTAssertFalse(a == b);
}

- (void)testPersonByDicKey {
    Person *a = [[Person alloc] initWithName:@"1"];
    Person *b = [[Person alloc] initWithName:@"22"];
    _dic[a] = @"a";
    _dic[b] = @"bb";
    NSLog(@"------");
    XCTAssertTrue([_dic[a] isEqualToString:@"a"]);
    XCTAssertTrue([_dic[b] isEqualToString:@"bb"]);
}

//相同 name 的 person，后面存入集合对象的，会把之前的顶掉
- (void)testPersonSameNameByDicKey {
    Person *a = [[Person alloc] initWithName:@"1"];
    Person *b = [[Person alloc] initWithName:@"1"];
    _dic[a] = @"a";
    _dic[b] = @"bb";
    NSLog(@"------");
    XCTAssertTrue([_dic[a] isEqualToString:@"bb"]);
    XCTAssertTrue([_dic[b] isEqualToString:@"bb"]);
}

//对象没有实现 hash 或 hash 算法随机，很高几率!导致存入集合对象后，取不出来，因为 hash 值不一样
- (void)testPersonWithoutHashWithDicKey {
    PersonWithoutHash *a = [[PersonWithoutHash alloc] initWithName:@"1"];
    PersonWithoutHash *b = [[PersonWithoutHash alloc] initWithName:@"22"];
    _dic[a] = @"a";
    _dic[b] = @"bb";
    NSLog(@"------");
    XCTAssertNil(_dic[a]);
    XCTAssertNil(_dic[b]);
}
@end

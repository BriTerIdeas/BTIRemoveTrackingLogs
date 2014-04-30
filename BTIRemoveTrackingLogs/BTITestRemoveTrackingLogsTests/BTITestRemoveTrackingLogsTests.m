//
//  BTITestRemoveTrackingLogsTests.m
//  BTITestRemoveTrackingLogsTests
//
//  Created by Brian Slick on 9/22/13.
//  Copyright (c) 2013 BriTer Ideas LLC. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "BTIStringProcessor.h"

@interface BTITestRemoveTrackingLogsTests : XCTestCase

@end

@implementation BTITestRemoveTrackingLogsTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - Test 1

- (void)testThatUncommentedBTITrackingLogsAreRemoved
{
	NSURL *inputURL = [[NSBundle mainBundle] URLForResource:@"test1input-removeBTIlog" withExtension:@"txt"];
    NSURL *outputURL = [[NSBundle mainBundle] URLForResource:@"test1output" withExtension:@"txt"];

	NSString *inputString = [[NSString alloc] initWithContentsOfURL:inputURL encoding:NSUTF8StringEncoding error:nil];
    NSString *outputStringReference = [[NSString alloc] initWithContentsOfURL:outputURL encoding:NSUTF8StringEncoding error:nil];

	BTIStringProcessor *processor = [[BTIStringProcessor alloc] initWithInputString:inputString];
	NSString *outputString = [processor outputString];
	    
    XCTAssertEqualObjects(outputString, outputStringReference, @"Tracking logs should have been removed");
}

#pragma mark - Test 2

- (void)testThatCommentedBTITrackingLogsAreRemoved
{
	NSURL *inputURL = [[NSBundle mainBundle] URLForResource:@"test2input-removeBTIlog" withExtension:@"txt"];
    NSURL *outputURL = [[NSBundle mainBundle] URLForResource:@"test2output" withExtension:@"txt"];
    
	NSString *inputString = [[NSString alloc] initWithContentsOfURL:inputURL encoding:NSUTF8StringEncoding error:nil];
    NSString *outputStringReference = [[NSString alloc] initWithContentsOfURL:outputURL encoding:NSUTF8StringEncoding error:nil];
    
	BTIStringProcessor *processor = [[BTIStringProcessor alloc] initWithInputString:inputString];
	NSString *outputString = [processor outputString];
    
    XCTAssertEqualObjects(outputString, outputStringReference, @"Tracking logs should have been removed");
}

#pragma mark - Test 3

- (void)testThatUncommentedNSTrackingLogsAreRemoved
{
	NSURL *inputURL = [[NSBundle mainBundle] URLForResource:@"test3input-removeNSLog" withExtension:@"txt"];
    NSURL *outputURL = [[NSBundle mainBundle] URLForResource:@"test3output" withExtension:@"txt"];
    
	NSString *inputString = [[NSString alloc] initWithContentsOfURL:inputURL encoding:NSUTF8StringEncoding error:nil];
    NSString *outputStringReference = [[NSString alloc] initWithContentsOfURL:outputURL encoding:NSUTF8StringEncoding error:nil];
    
	BTIStringProcessor *processor = [[BTIStringProcessor alloc] initWithInputString:inputString];
	NSString *outputString = [processor outputString];
    
    XCTAssertEqualObjects(outputString, outputStringReference, @"Tracking logs should have been removed");
}

#pragma mark - Test 4

- (void)testThatCommentedNSTrackingLogsAreRemoved
{
	NSURL *inputURL = [[NSBundle mainBundle] URLForResource:@"test4input-removeNSLog" withExtension:@"txt"];
    NSURL *outputURL = [[NSBundle mainBundle] URLForResource:@"test4output" withExtension:@"txt"];
    
	NSString *inputString = [[NSString alloc] initWithContentsOfURL:inputURL encoding:NSUTF8StringEncoding error:nil];
    NSString *outputStringReference = [[NSString alloc] initWithContentsOfURL:outputURL encoding:NSUTF8StringEncoding error:nil];
    
	BTIStringProcessor *processor = [[BTIStringProcessor alloc] initWithInputString:inputString];
	NSString *outputString = [processor outputString];
    
    XCTAssertEqualObjects(outputString, outputStringReference, @"Tracking logs should have been removed");
}

#pragma mark - Test 5

- (void)testThatExtraBlankLinesAreRemoved
{
	NSURL *inputURL = [[NSBundle mainBundle] URLForResource:@"test5input-removeBlankLines" withExtension:@"txt"];
    NSURL *outputURL = [[NSBundle mainBundle] URLForResource:@"test5output" withExtension:@"txt"];
    
	NSString *inputString = [[NSString alloc] initWithContentsOfURL:inputURL encoding:NSUTF8StringEncoding error:nil];
    NSString *outputStringReference = [[NSString alloc] initWithContentsOfURL:outputURL encoding:NSUTF8StringEncoding error:nil];
    
	BTIStringProcessor *processor = [[BTIStringProcessor alloc] initWithInputString:inputString];
	NSString *outputString = [processor outputString];
    
    XCTAssertEqualObjects(outputString, outputStringReference, @"Tracking logs should have been removed");
}

@end

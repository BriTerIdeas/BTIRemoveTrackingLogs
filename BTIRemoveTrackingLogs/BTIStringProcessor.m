//
//  BTIStringProcessor.m
//  BTIRemoveTrackingLogs
//
//  Created by Brian Slick on 9/22/13.
//  Copyright (c) 2013 BriTer Ideas LLC. All rights reserved.
//

#import "BTIStringProcessor.h"
#import "NSString+BTIAdditions.h"

// Private Constants

@interface BTIStringProcessor ()

// Private Properties
@property (nonatomic, copy) NSString *originalString;

// Private Methods

@end

@implementation BTIStringProcessor

@synthesize originalString;

- (instancetype)initWithInputString:(NSString *)input
{
	self = [super init];
	if (self)
	{
		[self setOriginalString:input];
	}
	return self;
}

- (NSString *)outputString
{
    NSString *inputString = [self originalString];

    __block NSMutableIndexSet *indexesToRemove = [NSMutableIndexSet indexSet];

    NSArray *originalLines = [inputString componentsSeparatedByString:@"\n"];
    
    NSUInteger maxIndex = [originalLines count] - 1;

    [originalLines enumerateObjectsUsingBlock:^(NSString *line, NSUInteger index, BOOL *stop) {

        BOOL isTrackingLogLine = [self isATrackingLogLine:line];
        
        if (!isTrackingLogLine)
        {
            return;
        }
        
        [indexesToRemove addIndex:index];

        // Determine if leading or following blank lines need to be removed.
        
        if ([self isAnEnteringLine:line])
        {
            NSUInteger nextIndex = index + 1;
            if (nextIndex > maxIndex)
            {
                return;
            }
            
            NSString *nextLine = [originalLines objectAtIndex:nextIndex];
            
            if ([self isABlankLine:nextLine])
            {
                [indexesToRemove addIndex:nextIndex];
            }
            
            return;
        }
        
        if ([self isALeavingLine:line])
        {
            if (index == 0)
            {
                return;
            }
            
            NSUInteger previousIndex = index - 1;
            
            NSString *previousLine = [originalLines objectAtIndex:previousIndex];
            
            if ([self isABlankLine:previousLine])
            {
                [indexesToRemove addIndex:previousIndex];
            }
            
            return;
        }
        
    }];

    NSMutableArray *cleanedLines = [NSMutableArray arrayWithArray:originalLines];
    [cleanedLines removeObjectsAtIndexes:indexesToRemove];

    NSString *outputString = [cleanedLines componentsJoinedByString:@"\n"];

    return outputString;
}

- (BOOL)isATrackingLogLine:(NSString *)line
{
    if ([line rangeOfString:@"BTITrackingLog"].location != NSNotFound)
    {
        return YES;
    }
    
    if ([line rangeOfString:@"NSLog"].location == NSNotFound)
    {
        return NO;
    }
    
    if ([self isAnEnteringLine:line] || [self isALeavingLine:line])
    {
        return YES;
    }
    
    return NO;
}

- (BOOL)isAnEnteringLine:(NSString *)line
{
    if ([line rangeOfString:@">>> Entering"].location != NSNotFound)
    {
        return YES;
    }
    
    return NO;
}

- (BOOL)isALeavingLine:(NSString *)line
{
    if ([line rangeOfString:@"<<< Leaving"].location != NSNotFound)
    {
        return YES;
    }
    
    return NO;
}

- (BOOL)isABlankLine:(NSString *)line
{
    NSString *cleanString = [line stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    return ([cleanString length] == 0);
}


@end

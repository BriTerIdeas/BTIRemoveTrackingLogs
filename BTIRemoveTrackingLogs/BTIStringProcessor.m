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
	NSLog(@">>> Entering <%p> %s <<<", self, __PRETTY_FUNCTION__);

    NSSet *enteringLogPrefixes = [NSSet setWithObjects:@"NSLog(@\">>> Entering <%p> %s <<<", @"BTITrackingLog(@\">>> Entering <%p> %s <<<", @"NSLog(@\">>> Entering %s <<<", nil];
    NSSet *leavingLogPrefixes = [NSSet setWithObjects:@"NSLog(@\"<<< Leaving  <%p> %s >>>", @"BTITrackingLog(@\"<<< Leaving  <%p> %s >>>", @"NSLog(@\"<<< Leaving %s >>>", nil];

    NSString *inputString = [self originalString];

    __block NSMutableIndexSet *indexesToRemove = [NSMutableIndexSet indexSet];

    NSArray *originalLines = [inputString componentsSeparatedByString:@"\n"];

    [originalLines enumerateObjectsUsingBlock:^(NSString *line, NSUInteger index, BOOL *stop) {

        NSString *cleanLine = [line stringByRemovingLeadingWhitespaceBTI];

        BOOL hasEnteringPrefix = NO;
        for (NSString *prefix in enteringLogPrefixes)
        {
            if ([cleanLine hasPrefix:prefix])
            {
                hasEnteringPrefix = YES;
                break;
            }
        }

        BOOL hasLeavingPrefix = NO;
        if (!hasEnteringPrefix)
        {
            for (NSString *prefix in leavingLogPrefixes)
            {
                if ([cleanLine hasPrefix:prefix])
                {
                    hasLeavingPrefix = YES;
                    break;
                }
            }
        }

        NSInteger nextIndex = NSNotFound;

        if (hasEnteringPrefix)
        {
            [indexesToRemove addIndex:index];

            NSInteger checkIndex = index + 1;
            if (checkIndex < [originalLines count])
            {
                nextIndex = checkIndex;
            }
        }
        else if (hasLeavingPrefix)
        {
            [indexesToRemove addIndex:index];

            NSInteger checkIndex = index - 1;
            if (checkIndex >= 0)
            {
                nextIndex = checkIndex;
            }
        }

        if (nextIndex != NSNotFound)
        {
            NSString *nextLine = [originalLines objectAtIndex:nextIndex];
            NSString *nextCleanLine = [nextLine stringByRemovingLeadingWhitespaceBTI];

            if ([nextCleanLine length] == 0)
            {
                [indexesToRemove addIndex:nextIndex];
            }
        }
    }];

    NSMutableArray *cleanedLines = [NSMutableArray arrayWithArray:originalLines];
    [cleanedLines removeObjectsAtIndexes:indexesToRemove];

    NSString *outputString = [cleanedLines componentsJoinedByString:@"\n"];

	NSLog(@"<<< Leaving  <%p> %s >>>", self, __PRETTY_FUNCTION__);
    return outputString;
}

@end

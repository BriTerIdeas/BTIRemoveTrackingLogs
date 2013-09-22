//
//  BTIStringProcessor.h
//  BTIRemoveTrackingLogs
//
//  Created by Brian Slick on 9/22/13.
//  Copyright (c) 2013 BriTer Ideas LLC. All rights reserved.
//

// Libraries
#import <Foundation/Foundation.h>

// Classes and Forward Declarations

// Public Constants

// Protocols

@interface BTIStringProcessor : NSObject

// Public Properties

// Public Methods
- (instancetype)initWithInputString:(NSString *)input;
- (NSString *)outputString;

@end

//
//  BTIRemoveTrackingLogs.h
//  BTIRemoveTrackingLogs
//
//  Created by Brian Slick on 9/22/13.
//  Copyright (c) 2013 BriTer Ideas LLC. All rights reserved.
//

#import <Automator/AMBundleAction.h>

@interface BTIRemoveTrackingLogs : AMBundleAction

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo;

@end

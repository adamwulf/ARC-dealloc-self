//
//  AppDelegate.m
//  ArcTest
//
//  Created by Adam Wulf on 10/29/13.
//  Copyright (c) 2013 Adam Wulf. All rights reserved.
//

#import "AppDelegate.h"
#import "StuffDoer.h"

@implementation AppDelegate{
    StuffDoer* obj;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    @autoreleasepool {
        obj = [[StuffDoer alloc] init];
        obj.delegate = self;
        [obj doStuff];
    }
}


-(void) didStuff:(StuffDoer*)objThatDidTheStuff{
    obj = nil;
}

@end

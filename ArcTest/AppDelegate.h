//
//  AppDelegate.h
//  ArcTest
//
//  Created by Adam Wulf on 10/29/13.
//  Copyright (c) 2013 Adam Wulf. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
#import "StuffDoerDelegate.h"

@interface AppDelegate : NSObject <NSApplicationDelegate,StuffDoerDelegate>

@property (assign) IBOutlet NSWindow *window;

@end

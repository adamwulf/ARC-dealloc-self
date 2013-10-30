//
//  ObjTestDelegate.h
//  ArcTest
//
//  Created by Adam Wulf on 10/29/13.
//  Copyright (c) 2013 Adam Wulf. All rights reserved.
//

#import <Foundation/Foundation.h>

@class StuffDoer;

@protocol StuffDoerDelegate <NSObject>

-(void) didStuff:(StuffDoer*)objThatDidTheStuff;

@end

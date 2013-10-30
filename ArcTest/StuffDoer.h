//
//  ObjTest.h
//  ArcTest
//
//  Created by Adam Wulf on 10/29/13.
//  Copyright (c) 2013 Adam Wulf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StuffDoerDelegate.h"

@interface StuffDoer : NSObject{
    __weak NSObject<StuffDoerDelegate>* delegate;
}

@property (nonatomic, weak) NSObject<StuffDoerDelegate>* delegate;

-(void) doStuff;

@end

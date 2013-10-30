//
//  ObjTest.m
//  ArcTest
//
//  Created by Adam Wulf on 10/29/13.
//  Copyright (c) 2013 Adam Wulf. All rights reserved.
//

#import "StuffDoer.h"

@implementation StuffDoer

@synthesize delegate;

-(void) dealloc{
    NSLog(@"ObjTest dealloc");
}

-(void) doStuff{
    //
    // uncomment the different lines to
    // see how each of them work
    [self doStuffFixOption1Broken];
//    [self doStuffFixOption2];
//    [self doStuffFixOption3];
//    [self doStuffFixOption4];
}

/**
 * This option shows the bug in action.
 *
 * When this object calls out to its delegate,
 * the delegate releases the object, causing it
 * to dealloc, so when the delegate call returns
 * it's next call to [self talk] is to a
 * dealloc'd self, causing an EXEC_BAD_ACCESS
 */
-(void) doStuffFixOption1Broken{
    NSLog(@"ObjTest is doing stuff");
    [delegate didStuff:self];
    // since our delegate released us, by this line we've
    // actually been dealloc'd, so the following call
    // to [talk] will cause an EXEC_BAD_ACCESS! yikes!
    [self talk];
}


/**
 * when possible, this is the easiest solution
 * to fix the exception. instead of calling
 * delegate methods at the beginning/middle of
 * a method, call them at the very end. that
 * way if this object is dealloc'd, it won't
 * matter b/c there's no more code to run
 * inside of it anyways.
 */
-(void) doStuffFixOption2{
    NSLog(@"ObjTest is doing stuff");
    [self talk];
    [delegate didStuff:self];
}

/**
 * option 2 isn't always possible, sometimes
 * you need to call out to a delegate, and then
 * process addiontional information based on 
 * the delegate's response, etc.
 *
 * In this case, we create a block which
 * closes over the /self/ object, retaining it
 * while the block is still being held.
 *
 * then, once the block finishes, the block
 * dealloc's, which releases /self/ which will
 * dealloc self.
 */
-(void) doStuffFixOption3{
    ^{
        NSLog(@"ObjTest is doing stuff");
        [delegate didStuff:self];
        //
        // since our delegate released us, by this line we've
        // actually been dealloc'd, so the following call
        // to [talk] will cause an execbadaccess!
        //
        // yikes!
        [self talk];
    }();
}

/**
 * This last option creates a new strong
 * ref to self explicitly, and calls
 * [talk] on this strong ref variable.
 *
 * that way, this strong ref will keep
 * one additional retain on /self/ until
 * strongRef is out of scope, which will
 * release /self/ and delay the dealloc
 */
-(void) doStuffFixOption4{
    StuffDoer* strongRef = self;
    NSLog(@"ObjTest is doing stuff");
    [delegate didStuff:self];
    //
    // since our delegate released us, by this line we've
    // actually been dealloc'd, so the following call
    // to [talk] will cause an execbadaccess!
    //
    // yikes!
    [strongRef talk];
}

/**
 * just a helper method to show
 * what happens when an object calls
 * a method on itself after it's been
 * dealloc'd
 */
-(void) talk{
    NSLog(@"ObjTest talk");
}

@end

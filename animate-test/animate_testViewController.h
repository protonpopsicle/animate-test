//
//  animate_testViewController.h
//  animate-test
//
//  Created by nimbus on 6/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface animate_testViewController : UIViewController {
    CGSize wrench1ShadowOffsetStart;
    CGSize wrench2ShadowOffsetStart;
    CGSize wrench1ShadowOffsetEnd;
    CGSize wrench2ShadowOffsetEnd;
}

@property (nonatomic, retain) CALayer *paper;
@property (nonatomic, retain) CALayer *spotlight;
@property (nonatomic, retain) CALayer *wrench1;
@property (nonatomic, retain) CALayer *wrench2;

@property (nonatomic, retain) CABasicAnimation *wrench1FlyIn;
@property (nonatomic, retain) CABasicAnimation *wrench2FlyIn;
@property (nonatomic, retain) CABasicAnimation *spotlightSwing;
@property (nonatomic, retain) CABasicAnimation *wrench1ShadowSwing;
@property (nonatomic, retain) CABasicAnimation *wrench2ShadowSwing;

@end

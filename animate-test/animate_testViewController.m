//
//  animate_testViewController.m
//  animate-test
//
//  Created by nimbus on 6/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "animate_testViewController.h"

@implementation animate_testViewController

@synthesize paper, spotlight, wrench1, wrench2;
@synthesize wrench1FlyIn, wrench2FlyIn, spotlightSwing, wrench1ShadowSwing, wrench2ShadowSwing;

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)setupLayers {
    UIImage *paperImage = [UIImage imageNamed:@"paper.png"];
    UIImage *spotlightImage = [UIImage imageNamed:@"spotlight.png"];
    UIImage *wrenchImage = [UIImage imageNamed:@"wrench.png"];
    
    wrench1ShadowOffsetStart = CGSizeMake(9.0, 9.0);
    wrench2ShadowOffsetStart = CGSizeMake(9.0, -9.0);
    wrench1ShadowOffsetEnd = CGSizeMake(-9.0, 9.0);
    wrench2ShadowOffsetEnd = CGSizeMake(9.0, 9.0);
    
    // wrench1 layer
    wrench1 = [CALayer layer];
    wrench1.contents = (id)wrenchImage.CGImage;
    wrench1.bounds = CGRectMake(0.0, 0.0, wrenchImage.size.width, wrenchImage.size.height);
    wrench1.anchorPoint = CGPointMake(0.0, 0.0);
    wrench1.position = CGPointMake(400.0, 200.0);
    wrench1.zPosition = -1.0;
    wrench1.shadowRadius = 3.0;
    wrench1.shadowOpacity = 1.0;
    wrench1.shadowOffset = wrench1ShadowOffsetStart;
    wrench1.shadowColor = [UIColor blackColor].CGColor;
    
    // wrench2 layer
    wrench2 = [CALayer layer];
    wrench2.contents = (id)wrenchImage.CGImage;
    wrench2.bounds = CGRectMake(0.0, 0.0, wrenchImage.size.width, wrenchImage.size.height);
    wrench2.anchorPoint = CGPointMake(0.0, 0.0);
    wrench2.position = CGPointMake(700, 350);
    wrench2.zPosition = -1.0;
    wrench2.transform = CATransform3DMakeRotation(90.0 / 180.0 * M_PI, 0.0, 0.0, 1.0);
    wrench2.shadowRadius = 3.0;
    wrench2.shadowOpacity = 1.0;
    wrench2.shadowOffset = wrench2ShadowOffsetStart;
    wrench2.shadowColor = [UIColor blackColor].CGColor;
    
    // paper layer
    paper = [CALayer layer];
    paper.contents = (id)paperImage.CGImage;
    paper.bounds = CGRectMake(0.0, 0.0, paperImage.size.width, paperImage.size.height);
    paper.anchorPoint = CGPointMake(0.0, 0.0);
    paper.opacity = 0.8;
    paper.zPosition = -3.0;
    
    // spotlight layer
    spotlight = [CALayer layer];
    spotlight.contents = (id)spotlightImage.CGImage;
    spotlight.bounds = CGRectMake(0.0, 0.0, spotlightImage.size.width, spotlightImage.size.height);
    spotlight.anchorPoint = CGPointMake(0.0, 0.0);
    spotlight.position = CGPointMake(-250, 0.0);
    spotlight.opacity = 1.0;
    spotlight.zPosition = -2.0;
    
    // add layers to view
    [self.view.layer addSublayer:paper];
    [self.view.layer addSublayer:spotlight];
    [self.view.layer addSublayer:wrench1];
    [self.view.layer addSublayer:wrench2];
}

- (void)setupAnimations {
    wrench1FlyIn = [CABasicAnimation animationWithKeyPath:@"position"];
    wrench1FlyIn.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    wrench1FlyIn.fromValue = [NSValue valueWithCGPoint:CGPointMake(0.0 - wrench1.bounds.size.width, wrench1.position.y)];
    wrench1FlyIn.duration = 0.5;
    wrench1FlyIn.delegate = self;
    
    wrench2FlyIn = [CABasicAnimation animationWithKeyPath:@"position"];
    wrench2FlyIn.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    wrench2FlyIn.fromValue = [NSValue valueWithCGPoint:CGPointMake(1024.0 - wrench2.bounds.size.width, wrench2.position.y)];
    wrench2FlyIn.duration = 0.5;
    
    wrench1ShadowSwing = [CABasicAnimation animationWithKeyPath:@"shadowOffset"];
    wrench1ShadowSwing.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    wrench1ShadowSwing.toValue = [NSValue valueWithCGSize:wrench1ShadowOffsetEnd];
    wrench1ShadowSwing.repeatCount = HUGE_VAL;
    wrench1ShadowSwing.autoreverses = YES;
    wrench1ShadowSwing.duration = 1.0;
    wrench1ShadowSwing.beginTime = CACurrentMediaTime() + 0.5;
    
    wrench2ShadowSwing = [CABasicAnimation animationWithKeyPath:@"shadowOffset"];
    wrench2ShadowSwing.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    wrench2ShadowSwing.toValue = [NSValue valueWithCGSize:wrench2ShadowOffsetEnd];
    wrench2ShadowSwing.repeatCount = HUGE_VAL;
    wrench2ShadowSwing.autoreverses = YES;
    wrench2ShadowSwing.duration = 1.0;
    wrench2ShadowSwing.beginTime = CACurrentMediaTime() + 0.5;
    
    spotlightSwing = [CABasicAnimation animationWithKeyPath:@"position"];
    spotlightSwing.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    spotlightSwing.toValue = [NSValue valueWithCGPoint:CGPointMake(0.0, 0.0)];
    spotlightSwing.repeatCount = HUGE_VAL;
    spotlightSwing.autoreverses = YES;
    spotlightSwing.duration = 1.0;
    spotlightSwing.beginTime = CACurrentMediaTime() + 0.5;
    
    // add animations to layers
    [wrench1 addAnimation:wrench1FlyIn forKey:@"position"];
    [wrench2 addAnimation:wrench2FlyIn forKey:@"position"];
    [wrench1 addAnimation:wrench1ShadowSwing forKey:@"shadowOffset"];
    [wrench2 addAnimation:wrench2ShadowSwing forKey:@"shadowOffset"];
    [spotlight addAnimation:spotlightSwing forKey:@"position"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"%@", anim);
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupLayers];
    [self setupAnimations];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (interfaceOrientation==UIInterfaceOrientationLandscapeLeft || interfaceOrientation==UIInterfaceOrientationLandscapeRight) {
        return YES;
    }
    
    return NO;
}

@end

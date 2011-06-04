//
//  animate_testAppDelegate.h
//  animate-test
//
//  Created by nimbus on 6/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class animate_testViewController;

@interface animate_testAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet animate_testViewController *viewController;

@end

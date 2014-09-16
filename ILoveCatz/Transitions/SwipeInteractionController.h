//
//  SwipeInteractionController.h
//  ILoveCatz
//
//  Created by Jaime Yesid Leon Parada on 9/16/14.
//  Copyright (c) 2014 com.razeware. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeInteractionController : UIPercentDrivenInteractiveTransition

- (void)wireToViewController:(UIViewController*)viewController;

@property (nonatomic, assign) BOOL interactionInProgress;

@end

//
//  SwipeInteractionController.m
//  ILoveCatz
//
//  Created by Jaime Yesid Leon Parada on 9/16/14.
//  Copyright (c) 2014 com.razeware. All rights reserved.
//

#import "SwipeInteractionController.h"

@implementation SwipeInteractionController
{
    BOOL _shouldCompleteTransition;
    UINavigationController *_navigationController;
}


- (void)wireToViewController:(UIViewController *)viewController
{
    _navigationController = viewController.navigationController;
    [self prepareGestureRecognizerInView:viewController.view];
}

- (void)prepareGestureRecognizerInView:(UIView*)view
{
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handleGesture:)];
    [view addGestureRecognizer:gesture];
}

- (CGFloat)completionSpeed
{
    return 1 - self.percentComplete;
}




@end

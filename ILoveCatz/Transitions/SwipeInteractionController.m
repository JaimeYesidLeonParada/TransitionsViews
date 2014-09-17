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

- (void)handleGesture:(UIPanGestureRecognizer*)gestureRecognizer
{
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view.superview];
    
    switch (gestureRecognizer.state){
        case UIGestureRecognizerStateBegan:{
            self.interactionInProgress = YES;
            [_navigationController popViewControllerAnimated:YES];
            break;
        }
            
        case UIGestureRecognizerStateChanged:{
            CGFloat fraction = -(translation.x / 200.0);
            fraction = fmin(fmaxf(fraction, 0.0), 1.0);
            _shouldCompleteTransition = (fraction > 0.5);
            [self updateInteractiveTransition:fraction];
            break;
        }
            
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:{
            self.interactionInProgress = NO;
            if (!_shouldCompleteTransition || gestureRecognizer.state == UIGestureRecognizerStateCancelled){
                [self cancelInteractiveTransition];
            }else{
                [self finishInteractiveTransition];
            }
            break;
        }
        default:
            break;
        }
}



@end

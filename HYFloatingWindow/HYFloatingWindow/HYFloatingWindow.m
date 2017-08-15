//
//  HYFloatingWindow.m
//  HYFloatingWindow
//
//  Created by 杨小雨 on 2017/8/15.
//  Copyright © 2017年 杨小雨. All rights reserved.
//

#import "HYFloatingWindow.h"

#define TOP_BOTTOM_MARGIN 10.0f
#define Left_RIGHT_MARGIN 10.0f

#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

@implementation HYFloatingWindow

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self setupGesture];
}
- (void)setupGesture {
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(locationChange:)];
    [self addGestureRecognizer:panGesture];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
    [self addGestureRecognizer:tapGesture];
}

- (void)locationChange:(UIPanGestureRecognizer *)gesture {
    CGPoint panPoint = [gesture locationInView:[[UIApplication sharedApplication] keyWindow]];
    if (gesture.state == UIGestureRecognizerStateChanged) {
        self.center = CGPointMake(panPoint.x, panPoint.y);
    } else if (gesture.state == UIGestureRecognizerStateEnded) {
        CGPoint temPoint;
        
        if(panPoint.x <= kScreenWidth/2) {
            CGFloat offsetX = fabs(panPoint.x - Left_RIGHT_MARGIN );
            
            
            if (panPoint.y <= kScreenHeight / 2.0) {
                CGFloat offsetY = fabs(panPoint.y - TOP_BOTTOM_MARGIN  );
                
                if (offsetX <= offsetY) {
                    CGFloat pointY  = panPoint.y < (HEIGHT / 2.0 + TOP_BOTTOM_MARGIN) ? (HEIGHT / 2.0 + TOP_BOTTOM_MARGIN) : panPoint.y;
                    temPoint = CGPointMake(Left_RIGHT_MARGIN + WIDTH/2.0, pointY);
                } else {
                    CGFloat pointX  = panPoint.x < (WIDTH / 2.0 + Left_RIGHT_MARGIN) ? (WIDTH / 2.0 + Left_RIGHT_MARGIN) : panPoint.x;
                    temPoint = CGPointMake(pointX, TOP_BOTTOM_MARGIN + HEIGHT / 2.0);
                }
                
            } else {
                CGFloat offsetY = fabs(kScreenHeight - TOP_BOTTOM_MARGIN  - panPoint.y);
                
                if (offsetX <= offsetY) {
                    CGFloat pointY  = panPoint.y + HEIGHT / 2.f > (kScreenHeight - TOP_BOTTOM_MARGIN) ? (kScreenHeight - TOP_BOTTOM_MARGIN - HEIGHT / 2.0) : panPoint.y;
                    temPoint = CGPointMake(Left_RIGHT_MARGIN + WIDTH/2.0, pointY);
                } else {
                    CGFloat pointX  = panPoint.x < (WIDTH / 2.0 + Left_RIGHT_MARGIN) ? (WIDTH / 2.0 + Left_RIGHT_MARGIN) : panPoint.x;
                    temPoint = CGPointMake(pointX,kScreenHeight - TOP_BOTTOM_MARGIN - HEIGHT / 2.0);
                }
                
            }
        } else {
            CGFloat offsetX = fabs(kScreenWidth - Left_RIGHT_MARGIN  - panPoint.x);
            if (panPoint.y <= kScreenHeight / 2.f) {
                CGFloat offsetY = fabs(panPoint.y - TOP_BOTTOM_MARGIN);
                if (offsetX <= offsetY) {
                    CGFloat pointY  = panPoint.y < (HEIGHT / 2.0 + TOP_BOTTOM_MARGIN) ? (HEIGHT / 2.0 + TOP_BOTTOM_MARGIN) : panPoint.y;
                    temPoint = CGPointMake(kScreenWidth - Left_RIGHT_MARGIN - WIDTH/2.0, pointY);
                    
                } else {
                    CGFloat pointX  = panPoint.x + WIDTH / 2.f > (kScreenWidth - Left_RIGHT_MARGIN) ? (kScreenWidth - Left_RIGHT_MARGIN - WIDTH / 2.f) : panPoint.x;
                    temPoint = CGPointMake(pointX, TOP_BOTTOM_MARGIN + HEIGHT / 2.0);
                }
            } else {
                CGFloat offsetY = fabs(kScreenHeight - TOP_BOTTOM_MARGIN  - panPoint.y);
                if (offsetX <= offsetY) {
                    CGFloat pointY  = panPoint.y + HEIGHT / 2.f > (kScreenHeight - TOP_BOTTOM_MARGIN) ? (kScreenHeight - TOP_BOTTOM_MARGIN - HEIGHT / 2.0) : panPoint.y;
                    temPoint = CGPointMake(kScreenWidth - Left_RIGHT_MARGIN - WIDTH/2.0, pointY);
                } else {
                    CGFloat pointX  = panPoint.x + WIDTH / 2.f > (kScreenWidth - Left_RIGHT_MARGIN) ? (kScreenWidth - Left_RIGHT_MARGIN - WIDTH / 2.f) : panPoint.x;
                    temPoint = CGPointMake(pointX, kScreenHeight - TOP_BOTTOM_MARGIN - HEIGHT / 2.0);
                    
                }
                
            }
            
        }
        [UIView animateWithDuration:0.15f animations:^{
            self.center = CGPointMake(temPoint.x, temPoint.y);
        }];
    }
}

- (void)click:(UITapGestureRecognizer *)gesture {
    
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"frame"];
}


@end

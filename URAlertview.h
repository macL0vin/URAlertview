//
//  URAlertview.h
//  Created by Uahit Ramazanov on 11/2/15.
//  Copyright © 2015. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^OKButtonClick)(UIView *_self);

@interface URAlertview : UIView

@property (nonatomic, copy) OKButtonClick onTap;

// Initialization
- (id)initWithFrame:(CGRect)frame
              title:(NSString*)title
        buttonColor:(UIColor*)color
              onTap:(OKButtonClick)block;

@end

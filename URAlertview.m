//
//  URAlertview.m
//  Created by Uahit Ramazanov on 11/2/15.
//  Copyright © 2015. All rights reserved.
//

#import "URAlertview.h"
#import "AppDelegate.h"

@implementation URAlertview

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
              title:(NSString*)title
        buttonColor:(UIColor*)color
              onTap:(OKButtonClick)block
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.onTap = block;
        
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        
        UIView *blurView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height)];
        blurView.backgroundColor = [UIColor colorWithWhite:0 alpha:.6];
        blurView.alpha = 0;
        
        UIView *menuView = [[UIView alloc] init];
        menuView.x = 0;
        menuView.y = 0;
        menuView.width = ([ASize screenWidth] * 0.5) * 0.75;
        menuView.height = 100;
        menuView.layer.cornerRadius = 10;
        menuView.layer.masksToBounds = YES;
        menuView.backgroundColor=[UIColor whiteColor];
        [blurView addSubview:menuView];
        
        UILabel *notificationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        notificationLabel.x = 20;
        notificationLabel.y = 30;
        notificationLabel.width = menuView.width - 40;
        notificationLabel.backgroundColor = [UIColor clearColor];
        notificationLabel.textColor = [UIColor blackColor];
        notificationLabel.font = [UIFont systemFontOfSize:17];
        notificationLabel.numberOfLines = 0;
        notificationLabel.lineBreakMode = NSLineBreakByWordWrapping;
        notificationLabel.text = title;
        [notificationLabel sizeToFit];
        notificationLabel.centerX = menuView.width * 0.5;
        [menuView addSubview:notificationLabel];
        
        UIButton *okButton = [UIButton new];
        okButton.x = 0;
        okButton.y = notificationLabel.bottom + 30;
        okButton.width = menuView.width;
        okButton.height = kEmployeSearchCellHeight;
        [okButton setTitle:@"OK" forState:UIControlStateNormal];
        [okButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        okButton.backgroundColor = color;
        [okButton addTarget:self action:@selector(okButtonPress:) forControlEvents:UIControlEventTouchUpInside];
        [menuView addSubview:okButton];
        
        menuView.height = okButton.bottom;
        menuView.centerX = screenSize.width * 0.5;
        menuView.centerY = screenSize.height * 0.5 - 50;
        
        AppDelegate *appdelegate = [UIApplication sharedApplication].delegate;
        [[appdelegate window] addSubview:blurView];
        
        [UIView animateWithDuration:0.2 animations:^{
            blurView.alpha = 1;
        }];
    }
    return self;
}

- (void)okButtonPress:(id)sender
{
    if (self.onTap) {
        self.onTap(self);
    }
}

@end

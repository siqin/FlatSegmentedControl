//
//  FlatSegmentedControl.h
//  JDY
//
//  Created by Jason Lee on 15/4/26.
//  Copyright (c) 2015年 Tmall.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlatSegmentedControl : UIControl

@property (nonatomic, assign) NSInteger selectedIndex;

- (void)setTitles:(NSArray *)titles;

@end

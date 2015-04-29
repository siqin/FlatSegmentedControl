//
//  FlatSegmentedControl.m
//  JDY
//
//  Created by Jason Lee on 15/4/26.
//  Copyright (c) 2015年 Tmall.com. All rights reserved.
//

#import "FlatSegmentedControl.h"

#define NormalColor         [UIColor colorWithRed:147.0f/255 green:147.0f/255 blue:147.0f/255 alpha:1.0f]
#define HightlightColor     [UIColor colorWithRed:28.0f/255 green:75.0f/255 blue:167.0f/255 alpha:1.0f]

@interface FlatSegmentedControl ()

@property (nonatomic, strong) NSMutableArray *labelArray;

@end

@implementation FlatSegmentedControl

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setTitles:(NSArray *)titles {
    NSUInteger count = titles.count;
    if (count == 0) return ;
    
    self.labelArray = [[NSMutableArray alloc] initWithCapacity:count];
    
    CGFloat width = self.bounds.size.width / count;
    CGFloat height = self.bounds.size.height;
    for (int i = 0; i < count; ++i) {
        CGFloat x = i * width;
        CGRect labelRect = CGRectMake(x, 0, width, height);
        UILabel *label = [[UILabel alloc] initWithFrame:labelRect];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = titles[i];
        label.textColor = NormalColor;
        label.font = [UIFont systemFontOfSize:14];
        
        [self addSubview:label];
        [self.labelArray addObject:label];
        
        if (i < count - 1) {
            [self addSeparatorAtXOffset:x + width];
        }
    }
    
    _selectedIndex = -1;
    //self.selectedIndex = 0;
}

- (void)addSeparatorAtXOffset:(NSUInteger)xOffset {
    CGFloat y = 5;
    CGFloat width = 1;
    CGFloat height = self.bounds.size.height - 2 * y;
    CGRect rect = CGRectMake(xOffset, y, width, height);
    
    UILabel *separator = [[UILabel alloc] initWithFrame:rect];
    separator.text = @"";
    separator.backgroundColor = [UIColor colorWithRed:242.0f/255 green:242.0f/255 blue:242.0f/255 alpha:1.0f];
    [self addSubview:separator];
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    if (_selectedIndex >= 0 && _selectedIndex < self.labelArray.count) {
        UILabel *oldLabel = self.labelArray[_selectedIndex];
        [oldLabel setTextColor:NormalColor];
    }
    
    if (selectedIndex >= 0 && selectedIndex < self.labelArray.count) {
        UILabel *newLabel = self.labelArray[selectedIndex];
        [newLabel setTextColor:HightlightColor];
    }
    
    if (_selectedIndex != selectedIndex) {
        _selectedIndex = selectedIndex;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
    
    _selectedIndex = selectedIndex;
}

#pragma mark -

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self];
    
    CGFloat width = self.bounds.size.width / self.labelArray.count;
    self.selectedIndex = point.x / width;
    
    [super touchesEnded:touches withEvent:event];
}

#pragma mark -

@end

// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolViewCell.h"

const UIEdgeInsets CLNTextInsets = {
    .top = 7,
    .bottom = 8,
    .left = 12,
    .right = 12,
};

@interface CLNCoolViewCell ()
@property (getter=isHighlighted, nonatomic) BOOL highlighted;
@property (class, readonly, nonatomic) NSDictionary *textAttributes;
@end

@implementation CLNCoolViewCell

// FIXME: We need to eventually cover the NSCoding initialization path

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self == nil) return nil;
    
    self.layer.borderWidth = 3;
    self.layer.borderColor = UIColor.whiteColor.CGColor;
    
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {
    _highlighted = highlighted;
    self.alpha = highlighted ? 0.5 : 1.0;
}

// MARK: - Drawing and resizing

+ (NSDictionary *)textAttributes {
    // TODO: Cache the instance
    return @{ NSFontAttributeName : [UIFont boldSystemFontOfSize:20],
              NSForegroundColorAttributeName : UIColor.whiteColor };
}

- (void)setText:(NSString *)text {
    _text = [text copy];
    [self sizeToFit];
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize newSize = [self.text sizeWithAttributes:self.class.textAttributes];
    newSize.width += CLNTextInsets.left + CLNTextInsets.right;
    newSize.height += CLNTextInsets.top + CLNTextInsets.bottom;
    return newSize;
}

- (void)drawRect:(CGRect)rect {
    // TODO: Adjust the origin as necessary.
    CGPoint origin = CGPointMake(CLNTextInsets.left, CLNTextInsets.top);
    [self.text drawAtPoint:origin withAttributes:self.class.textAttributes];
}

// MARK: - UIResponder methods

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.superview bringSubviewToFront:self];
    self.highlighted = YES;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint currLocation = [touch locationInView:nil];
    CGPoint prevLocation = [touch previousLocationInView:nil];
    CGFloat deltaX = currLocation.x - prevLocation.x;
    CGFloat deltaY = currLocation.y - prevLocation.y;
    
    self.frame = CGRectOffset(self.frame, deltaX, deltaY);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = NO;
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = NO;
}

@end

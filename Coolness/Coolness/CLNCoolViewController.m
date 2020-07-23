// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolViewController.h"
#import "CLNCoolViewCell.h"

@interface CLNCoolViewController () <UITextFieldDelegate>
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) UIView *contentView;
@end

@implementation CLNCoolViewController

- (void)addCell {
    NSLog(@"In %s", __func__);
    CLNCoolViewCell *newCell = [[CLNCoolViewCell alloc] init];
    newCell.text = self.textField.text;
    newCell.backgroundColor = UIColor.systemBlueColor;
    [self.contentView addSubview:newCell];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"In %s", __func__);
    [textField resignFirstResponder];
    return YES;
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"In %s", __func__);
//    [UIApplication.sharedApplication sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
//}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"In %s", __func__);
//    [super touchesBegan:touches withEvent:event];
//}

- (void)loadView {
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = UIColor.brownColor;
    
    CGRect screenRect = UIScreen.mainScreen.bounds;
    CGRect accessoryRect;
    CGRect contentRect;
    CGRectDivide(screenRect, &accessoryRect, &contentRect, 90, CGRectMinYEdge);
    
    UIView *accessoryView = [[UIView alloc] initWithFrame:accessoryRect];
    self.contentView = [[UIView alloc] initWithFrame:contentRect];
    
    self.contentView.clipsToBounds = YES;
    
    [self.view addSubview:accessoryView];
    [self.view addSubview:self.contentView];
    
    accessoryView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
    self.contentView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.4];
    
    // Controls
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 45, 240, 36)];
    [accessoryView addSubview:self.textField];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"Enter a label";
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    self.textField.delegate = self;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [accessoryView addSubview:button];
    [button setTitle:@"Add Cell" forState:UIControlStateNormal];
    [button sizeToFit];
    
    button.frame = CGRectOffset(button.frame, 270, 50);
    
    [button addTarget:self action:@selector(addCell) forControlEvents:UIControlEventTouchUpInside];
    
    // Cells
    CLNCoolViewCell *cell1 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(20, 80, 220, 40)];
    CLNCoolViewCell *cell2 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(50, 150, 220, 40)];
    
    [self.contentView addSubview:cell1];
    [self.contentView addSubview:cell2];
    
    cell1.text = @"Hello World! 🌍🌎🌏";
    cell2.text = @"Cool View Cells Rock! 🥂🍾";
    
    cell1.backgroundColor = UIColor.systemPurpleColor;
    cell2.backgroundColor = UIColor.systemOrangeColor;
}

@end

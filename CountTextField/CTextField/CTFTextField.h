//
//  CTFTextField.h
//  CountTextField
//
//  Created by Saif Al-Dilaimi on 12.04.14.
//  Copyright (c) 2014 Saif Al-Dilaimi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTFTextField : UITextField<UITextFieldDelegate>


@property (nonatomic, strong) UIColor *countTextColor;
@property (nonatomic, strong) UIColor *countLabelBackgroundColor;
@property (nonatomic, strong) UIFont *countFont;
@property (nonatomic, assign) int maxTextLength;
@property (nonatomic, assign) CGFloat defaultTextSize;
@property (nonatomic, assign) BOOL fitCountTextSize;

@end

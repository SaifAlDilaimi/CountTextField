//
//  CTFTextField.m
//  CountTextField
//
//  Created by Saif Al-Dilaimi on 12.04.14.
//  Copyright (c) 2014 Saif Al-Dilaimi. All rights reserved.
//

#import "CTFTextField.h"

@implementation CTFTextField
UILabel *yourLabel;

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom Implementation
        if (!_maxTextLength) {
            _maxTextLength = 400;
        }
        [self setupCountLabel];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        if (!_maxTextLength) {
            _maxTextLength = 400;
        }
        
        [self setupCountLabel];
    }
    return self;
}

-(void)setupCountLabel{
    yourLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width-42, 12, 40, 20)];//Change your size, you will need to experiment with the size

    if (!_defaultTextSize) {
        _defaultTextSize = 14.0;
    }
    
    if (_countTextColor) {
        [yourLabel setTextColor:_countTextColor];
    }else{
        [yourLabel setTextColor:[UIColor blackColor]];
    }
    
    if (_countFont) {
        [yourLabel setFont:_countFont];
    } else {
        [yourLabel setFont:[UIFont fontWithName:@"AppleSDGothicNeo-Light" size:_defaultTextSize]];
    }

    [yourLabel setBackgroundColor:[UIColor clearColor]];
    [yourLabel setAdjustsFontSizeToFitWidth:_fitCountTextSize];
    [yourLabel setTextAlignment:NSTextAlignmentRight];
    [yourLabel setText:@""];
    [self addSubview:yourLabel];
    self.delegate=self;
    [self textField:self shouldChangeCharactersInRange:NSMakeRange(0, 0) replacementString:@""];//To change the limit label
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if(newText.length>_maxTextLength) {
        return NO;
    }
    
    [self updateCharsRemainingLabel:newText.length];
    
    return YES;
}

- (void)updateCharsRemainingLabel:(NSInteger)currentLength {
    NSInteger remaining = _maxTextLength - currentLength;
    yourLabel.text = [NSString stringWithFormat:@"%d", remaining];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

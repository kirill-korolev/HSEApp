//
//  SignInField.h
//  HSEApp
//
//  Created by Kirill Korolev on 20/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface SignInField : UITextField

@property (assign, nonatomic) IBInspectable CGFloat borderWidth;
@property (strong, nonatomic) IBInspectable UIColor* borderColor;

@end

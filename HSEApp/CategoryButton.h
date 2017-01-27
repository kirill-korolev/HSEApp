//
//  CategoryButton.h
//  HSEApp
//
//  Created by Kirill Korolev on 24/01/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface CategoryButton : UIButton

@property (assign, nonatomic) IBInspectable CGFloat borderRadius;
@property (strong, nonatomic) UIColor* color;

@end

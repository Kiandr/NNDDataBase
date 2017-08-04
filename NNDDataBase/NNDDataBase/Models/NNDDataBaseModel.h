/*  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
 Author: Kian D.Rad
 Date:   August 3rd 2017
 ReadMe:
 */

#ifndef NNDCheckInModel_h
#define NNDCheckInModel_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "NNDCheckInService.h"
@interface NNDDataBaseModel : NSObject

@property (strong, nonatomic) UIView* NNDCheckInUIView;
@property (strong, nonatomic) UIButton* NNDCheckInUIButton;
@property (assign, nonatomic) id NNDCheckInUIButtonCallBackFunction;
@property (assign, nonatomic) NNDCheckInService* NNDCheckInService;


@end

#endif /* NNDCheckInModel_h */

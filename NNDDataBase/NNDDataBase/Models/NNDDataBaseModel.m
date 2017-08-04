/*  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
 Author: Kian D.Rad
 Date:   August 3rd 2017
 ReadMe:
 */

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "NNDDataBaseModel.h"

@implementation NNDDataBaseModel: NSObject

/*
 Author: Kian D.Rad
 Date: July 4th 2017
 README: The following classes are UIVIews and callBackFunctions to manage in and out transition
 ToDo:

 */
- (instancetype)init {
    self = [super init];
    if (self) {


    }
    return self;
}


/*
 Author: Kian D.Rad
 Date: July 4th 2017
 README: The following classes are UIVIews and callBackFunctions to manage in and out transition
 ToDo:

 */
- (instancetype)initWithNNDCheckInModel: (NNDCheckInModel*) model{
    self = [super init];
    if (self) {
/*
 This function will initalize the follwoing and then the user can set various properties to configure the datamodel. just like the Appl camera object. But not as complex as camera 
 
 
 @property (strong, nonatomic) UIView* NNDCheckInUIView;
 @property (strong, nonatomic) UIButton* NNDCheckInUIButton;
 @property (assign, nonatomic) id NNDCheckInUIButtonCallBackFunction;
 @property (assign, nonatomic) NNDCheckInService* NNDCheckInService;
 

 */


    }
    return self;
}



@end

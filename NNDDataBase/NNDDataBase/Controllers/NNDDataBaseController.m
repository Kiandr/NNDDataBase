
/*  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
 Author: Kian D.Rad
 Date:   August 3rd 2017
 ReadMe:
 */

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "NNDDataBaseController.h"

#include "NNDDataBaseService.h"

///NNDDataBaseService

@interface NNDDataBaseController()


@property (strong, nonatomic) NNDDataBaseService *service;
@end

@implementation NNDDataBaseController: NSObject


- (instancetype)init {
    self = [super init];
    if (self) {
        _service = [[NNDDataBaseService alloc]init];

    }
    return self;
}

-(void) HelloDepenecyIntegrationNNDCheckInController{

    NSLog(@"-(void) HelloDepenecyIntegrationNNDCheckInController;");
}


@end



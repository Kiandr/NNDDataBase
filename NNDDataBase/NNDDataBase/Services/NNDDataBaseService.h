
/*  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
 Author: Kian D.Rad
 Date:   August 3rd 2017
 ReadMe:
 */
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#include "NNDDataBaseBusinessRepository.h"
#include "NNDPatientDataModel.h"
#include "NNDDeviceUserDataModel.h"

@protocol NNDDataBaseServiceProtocolDelegate <NSObject>



@end

@interface NNDDataBaseService : NSObject<NNDDataBaseServiceProtocolDelegate>

@property (strong, nonatomic) id<NNDDataBaseServiceProtocolDelegate> delegate;

- (void)AddPerson;
- (void)fetch;

#pragma Testing local database; adding patient and device data
- (void) addOnePatinetDataIntoTheUserFile;
- (void) addOneUserDataModelInDataBase;
- (NNDPatientDataModel*) PatiendModelDataInitWithUserId:(NNDDeviceUserDataModel*) deviceUserDataModel;
- (NNDDeviceUserDataModel*) NNDDeviceUserDataModelWithGoogleGSuitTool:(NNDDeviceUserDataModel*) deviceUserDataModel;
@end



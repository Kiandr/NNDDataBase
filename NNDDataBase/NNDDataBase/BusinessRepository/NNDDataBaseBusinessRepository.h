
/*  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
    Author: Kian D.Rad
    Date:   August 3rd 2017
    ReadMe:
 */

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#include "NNDPatientDataModel.h"
#include "NNDDeviceUserDataModel.h"

@interface NNDDataBaseBusinessRepository : NSObject

@property (strong, nonatomic) NSManagedObjectContext       *managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel         *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

//- (void)saveContext;

#pragma  DataBase Methods

- (NSURL*)applicationDocumentsDirectory;

- (NSManagedObjectModel*)managedObjectModel ;

- (NSPersistentStoreCoordinator*)persistentStoreCoordinator ;

- (NSManagedObjectContext*)managedObjectContext ;

- (void)saveContext ;

- (void)AddPerson;

- (void)fetch;

#pragma Test methods, adding patinet and Device user data base inquery

-(NNDPatientDataModel*) PatiendModelDataInitWithUserId:(NNDDeviceUserDataModel*) deviceUserDataModel;
- (NNDDeviceUserDataModel*) NNDDeviceUserDataModelWithGoogleGSuitTool:(NNDDeviceUserDataModel*) deviceUserDataModel;
- (void) addOnePatinetDataIntoTheUserFile;
- (void) addOneUserDataModelInDataBase;

@end

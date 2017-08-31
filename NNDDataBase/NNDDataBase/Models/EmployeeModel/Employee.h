//
//  Employee+CoreDataClass.h
//  CoreDataHelloWorld
//
//  Created by Kian Davoudi-Rad on 2017-08-25.
//  Copyright © 2017 Kian Davoudi-Rad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>



@interface Employee : NSObject
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *phone;

@end


//
//  Character.h
//  LostCharacterDatabase
//
//  Created by Efrén Reyes Torres on 8/13/14.
//  Copyright (c) 2014 Efrén Reyes Torres. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Character : NSManagedObject

@property (nonatomic, retain) NSString * actor;
@property (nonatomic, retain) NSString * passenger;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * nationality;
@property (nonatomic, retain) NSString * gender;

@end

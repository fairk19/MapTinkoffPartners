//
//  DepositionPoint+CoreDataProperties.h
//  MapTinkoffPartners
//
//  Created by Александр on 11.04.16.
//  Copyright © 2016 Home. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "DepositionPoint.h"

NS_ASSUME_NONNULL_BEGIN

@interface DepositionPoint (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *addressInfo;
@property (nullable, nonatomic, retain) NSString *fullAddress;
@property (nullable, nonatomic, retain) NSNumber *latitude;
@property (nullable, nonatomic, retain) NSNumber *longitude;
@property (nullable, nonatomic, retain) NSString *partnerName;
@property (nullable, nonatomic, retain) NSString *workHours;
@property (nullable, nonatomic, retain) Partner *partner;

@end

NS_ASSUME_NONNULL_END

//
//  Partner.m
//  MapTinkoffPartners
//
//  Created by Александр on 08.04.16.
//  Copyright © 2016 Home. All rights reserved.
//

#import "Partner.h"
#import "DepositionPoint.h"

@implementation Partner

+ (Partner *)findOrCreatePartnerWithIdentifier:(NSString *)identifier inContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[self entityName]];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"name = %@", identifier];
    NSError *error = nil;
    NSArray *result = [context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"Error: %@", [error localizedDescription]);
    }
    if (result.lastObject) {
        return result.lastObject;
    } else {
        Partner *partner = [self insertNewObjectIntoContext:context];
        return partner;
    }
}

- (void)loadFromDictionary:(NSDictionary *)dictionary {
     self.idPartner = dictionary[@"id"];
     self.name = dictionary[@"name"];
     self.picture = dictionary[@"picture"];
     self.url = dictionary[@"url"];
     self.depositionDuration = dictionary[@"depositionDuration"];
     self.limitations = dictionary[@"limitations"];
     self.pointType = dictionary[@"pointType"];
     self.descriptionPartner = dictionary[@"description"];
    
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    self.hasLocations = [numberFormatter numberFromString:[NSString stringWithFormat:@"%@", dictionary[@"hasLocations"]]];
    self.isMomentary = [numberFormatter numberFromString:[NSString stringWithFormat:@"%@", dictionary[@"isMomentary"]]];
    self.hasPreferentialDeposition = [numberFormatter numberFromString:[NSString stringWithFormat:@"%@", dictionary[@"hasPreferentialDeposition"]]];
    self.externalPartnerId = [numberFormatter numberFromString:[NSString stringWithFormat:@"%@", dictionary[@"externalPartnerId"]]];
    self.moneyMin = [numberFormatter numberFromString:[NSString stringWithFormat:@"%@", dictionary[@"moneyMin"]]];
    self.moneyMax = [numberFormatter numberFromString:[NSString stringWithFormat:@"%@", dictionary[@"moneyMax"]]];
}

@end

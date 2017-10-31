//
//  DMCache+CoreDataProperties.m
//  
//
//  Created by 郭枫 on 2017/10/31.
//
//

#import "DMCache+CoreDataProperties.h"

@implementation DMCache (CoreDataProperties)

+ (NSFetchRequest<DMCache *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"DMCache"];
}

@dynamic key;
@dynamic value;

@end

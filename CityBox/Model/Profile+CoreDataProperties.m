//
//  Profile+CoreDataProperties.m
//  
//
//  Created by 郭枫 on 2017/10/31.
//
//

#import "Profile+CoreDataProperties.h"

@implementation Profile (CoreDataProperties)

+ (NSFetchRequest<Profile *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Profile"];
}

@dynamic passWord;
@dynamic userName;
@dynamic studentName;

@end

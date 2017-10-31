//
//  DMCache+CoreDataProperties.h
//  
//
//  Created by 郭枫 on 2017/10/31.
//
//

#import "DMCache+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface DMCache (CoreDataProperties)

+ (NSFetchRequest<DMCache *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *key;
@property (nullable, nonatomic, copy) NSString *value;

@end

NS_ASSUME_NONNULL_END

//
//  Profile+CoreDataProperties.h
//  
//
//  Created by 郭枫 on 2017/10/31.
//
//

#import "Profile+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Profile (CoreDataProperties)

+ (NSFetchRequest<Profile *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *passWord;
@property (nullable, nonatomic, copy) NSString *userName;
@property (nullable, nonatomic, copy) NSString *studentName;

@end

NS_ASSUME_NONNULL_END

//
//  LibraryInfo.h
//  CityBox
//
//  Created by 郭枫 on 2017/11/1.
//  Copyright © 2017年 郭枫. All rights reserved.
//

#import "BaseDTO.h"

@interface LibraryInfo : BaseDTO

@property (nonatomic, copy) NSString *bookId;
@property (nonatomic, copy) NSString *bookNo;
@property (nonatomic, copy) NSString *bookName;
@property (nonatomic, copy) NSString *bookAuther;
@property (nonatomic, copy) NSString *bookPress;
@property (nonatomic, copy) NSString *bookTime;
@property (nonatomic, copy) NSString *bookSearch;
@property (nonatomic, copy) NSString *bookPlace;
@property (nonatomic, copy) NSString *bookStatus;

+ (instancetype)libraryInfoWithData:(NSDictionary *)data;

@end

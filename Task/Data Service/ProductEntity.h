//
//  ProductEntity.m
//  Task
//
//  Created by new on 23.08.17.
//  Copyright © 2017 Home. All rights reserved.
//
#import "BaseEntity.h"
#import <Foundation/Foundation.h>

@interface ProductEntity : BaseEntity

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *price;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *image;

@end

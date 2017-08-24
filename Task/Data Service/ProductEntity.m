//
//  ProductEntity.m
//  Task
//
//  Created by new on 23.08.17.
//  Copyright © 2017 Home. All rights reserved.
//

#import "ProductEntity.h"

@implementation ProductEntity

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name" : @"name",
             @"price" : @"price",
             @"category" : @"category",
             @"image" : @"image"
             };
}

@end

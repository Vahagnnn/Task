//
//  ListViewModel.h
//  Task
//
//  Created by new on 23.08.17.
//  Copyright © 2017 Home. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ProductEntity.h"

@interface ListViewModel : NSObject

- (void)getProducts:(void (^)(NSArray <ProductEntity *> *array))completionBlock;

- (void)getProductsByCategories:(NSArray *)array
                     complation:(void (^)(NSArray <ProductEntity *> *array))completionBlock;

@end

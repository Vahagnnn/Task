//
//  ListViewModel.h
//  Task
//
//  Created by new on 23.08.17.
//  Copyright © 2017 Home. All rights reserved.
//

#import "ListViewModel.h"

@implementation ListViewModel

- (void)getProducts:(void (^)(NSArray <ProductEntity *> *array))completionBlock {
    NSDictionary *productsDict = [self dictionaryWithContentsOfJSONString:@"Products.json"];
    NSArray *array = [ProductEntity arrayOfEntitiesFromArray:productsDict[@"products"]].mutableCopy;
    completionBlock(array);
}

- (void)getProductsByCategories:(NSArray *)array complation:(void (^)(NSArray <ProductEntity *> *array))completionBlock {
    __block NSArray *blockArray = array;
    [self getProducts:^(NSArray<ProductEntity *> *arrayProducts) {
        if (blockArray.count == 0) {
            completionBlock(arrayProducts);
            return;
        }
        
        NSMutableArray *result = [[NSMutableArray alloc] init];
        
        for (ProductEntity *entity in arrayProducts) {
            for (NSString *string in blockArray) {
                if ([entity.category isEqualToString:string]) {
                    [result addObject:entity];
                }
            }
        }

        completionBlock(result);
    }];
}

- (NSDictionary *)dictionaryWithContentsOfJSONString:(NSString *)fileLocation {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileLocation stringByDeletingPathExtension] ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

@end

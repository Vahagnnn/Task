//
//  ListViewPresenter.h
//  Task
//
//  Created by new on 23.08.17.
//  Copyright © 2017 Home. All rights reserved.
//

#import "ListViewPresenter.h"
@interface ListViewPresenter ()

@property (nonatomic, strong) NSArray *categoryArray;
@property (nonatomic, strong) NSString *sortKey;

@end

@implementation ListViewPresenter
#pragma mark - Getters
- (NSInteger)numberOfProducts {
    return self.products.count;
}

#pragma mark - Public Methods
- (void)present {
    __weak typeof(self)weakSelf = self;

    [self.model getProducts:^(NSArray<ProductEntity *> *array) {
        [weakSelf handleProductsReceived:array];
    }];
}

- (void)configureCell:(ProductTableViewCell *)cell forRow:(NSInteger)row {
    ProductEntity *entity = _products[row];
    [cell displayImage:[UIImage imageNamed:entity.image]];
    [cell displayName:entity.name];
    [cell displayCategory:entity.category];
    [cell displayPrice:[NSString stringWithFormat:@"%@$", entity.price]];
}

- (void)filterByCategoryArray:(NSArray *)array {
    _categoryArray = array;
    __weak typeof(self)weakSelf = self;

    [self.model getProductsByCategories:array complation:^(NSArray<ProductEntity *> *array) {
        [weakSelf handleProductsReceived:array];
    }];
}

- (void)sortByKey:(NSString *)key {
    _sortKey = key;
    [self handleProductsReceived:self.products];
}

- (void)searchByText:(NSString *)string {
    if (string.length == 0) {
        __weak typeof(self)weakSelf = self;

        [self.model getProducts:^(NSArray<ProductEntity *> *array) {
            [weakSelf handleProductsReceived:array];
        }];
    }else if (string.length > 0)
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name CONTAINS[cd] %@", string];
        __weak typeof(self)weakSelf = self;

        [self.model getProductsByCategories:_categoryArray complation:^(NSArray<ProductEntity *> *array) {
            NSArray *filterArray = [array filteredArrayUsingPredicate:predicate];
            [weakSelf handleProductsReceived:filterArray];
        }];
    }
}

- (void)openSettings {
    NSArray *filterNames = @[@"Books", @"Sporting Goods", @"Music", @"Travel", @"Electronics",@"Other"];
    NSArray *sortNames = @[@"name", @"price"];
    if (_categoryArray == nil) {
        _categoryArray = filterNames;
    }
    [self.view presentSeetingsViewController:filterNames selectedCategoryArray:_categoryArray sortArray:sortNames slectedSort:_sortKey];
}

#pragma mark - Private Methods
- (void)handleProductsReceived:(NSArray <ProductEntity *> *)array {
    array = [self sortByProperty:nil array:array];
    self.products = array;
    [self.view refreshTableView];
}

- (NSArray *)sortByProperty:(NSString *)string array:(NSArray *)array{
    if (_sortKey == nil) {
        _sortKey = @"name";
    }
    NSMutableArray *sortArray = [[NSMutableArray alloc] initWithArray:array];
    [sortArray sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:_sortKey ascending:YES]]];
    return sortArray;
}

@end

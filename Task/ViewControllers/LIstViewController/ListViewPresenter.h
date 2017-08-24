//
//  ListViewPresenter.h
//  Task
//
//  Created by new on 23.08.17.
//  Copyright © 2017 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListViewModel.h"
#import "ProductTableViewCell.h"

@protocol ListViewDelegate <NSObject>

- (void)refreshTableView;

//Routing
@optional
- (void)presentSeetingsViewController:(NSArray *)categoryArray selectedCategoryArray:(NSArray *)selectedFilterArray sortArray:(NSArray *)sortArray slectedSort:(NSString *)sortKey;

@end

@interface ListViewPresenter : NSObject

@property (nonatomic, strong) NSArray <ProductEntity *> *products;
@property (nonatomic, assign) NSInteger numberOfProducts;

@property (nonatomic, weak) id <ListViewDelegate> view;
@property (nonatomic, strong) ListViewModel *model;

- (void)present;
- (void)configureCell:(ProductTableViewCell *)cell forRow:(NSInteger)row;
- (void)filterByCategoryArray:(NSArray *)array;
- (void)sortByKey:(NSString *)key;
- (void)searchByText:(NSString *)string;

- (void)openSettings;
@end

//
//  ListViewController+Router.h
//  Task
//
//  Created by new on 23.08.17.
//  Copyright © 2017 Home. All rights reserved.
//

#import "ListViewController+Router.h"

@implementation ListViewController (Router) 

#pragma mark - ListViewDelegate
- (id)getViewControllerByStoryboardID:(NSString *)identifier {
    return [self.storyboard instantiateViewControllerWithIdentifier:identifier];
}

- (void)presentSeetingsViewController:(NSArray *)categoryArray selectedCategoryArray:(NSArray *)selectedFilterArray sortArray:(NSArray *)sortArray slectedSort:(NSString *)sortKey {
    SettingsViewController *vc = [self getViewControllerByStoryboardID:NSStringFromClass([SettingsViewController class])];
    vc.filterArray = categoryArray;
    vc.sortArray = sortArray;
    vc.filterSelectedArray = [NSMutableArray arrayWithArray:selectedFilterArray];
    vc.sortSelectedKey = sortKey;
    vc.delegate = self;
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)updateCategoryArray:(NSArray *)arrayCategory sort:(NSString *)sortKey {
    [self.presenter sortByKey:sortKey];
    [self.presenter filterByCategoryArray:arrayCategory];
}

@end

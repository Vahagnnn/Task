//
//  SettingsViewController.m
//  Task
//
//  Created by new on 24.08.17.
//  Copyright © 2017 Home. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *settingsTableView;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.delegate updateCategoryArray:_filterSelectedArray sort:_sortSelectedKey];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Sort";
    }
    
    return @"Filter";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return _sortArray.count;
    }
    return _filterArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        SortTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SortTableViewCell" forIndexPath:indexPath];
        NSString *key = _sortArray[indexPath.row];
        cell.textLabel.text = key;
        if (![key isEqualToString:_sortSelectedKey]) {
            cell.accessoryType = UITableViewCellAccessoryNone;
        } else {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        return cell;
    }
    
    FilterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FilterTableViewCell" forIndexPath:indexPath];
    NSString *filter = _filterArray[indexPath.row];
    cell.textLabel.text = filter;
    
    if ([self filterIsSelected:filter]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }

    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            [self chooseSortKey:indexPath];
            break;
        case 1:
            [self chooseFilter:indexPath];
            break;
        default:
            break;
    }
}

#pragma mark - Private Methods
- (void)chooseSortKey:(NSIndexPath *)indexPath {
    _sortSelectedKey = _sortArray[indexPath.row];
    [self.settingsTableView reloadData];
}

- (void)chooseFilter:(NSIndexPath *)indexPath {
    NSString *filterName = _filterArray[indexPath.row];
    if ([self filterIsSelected:filterName]) {
        [_filterSelectedArray removeObject:filterName];
    } else {
        [_filterSelectedArray addObject:filterName];
    }
    [self.settingsTableView reloadData];
}

- (BOOL)filterIsSelected:(NSString *)filter {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF == %@", filter];
    NSArray *array = [_filterSelectedArray filteredArrayUsingPredicate:predicate];
    if (array.count == 0) {
        return NO;
    }
    
    return YES;
}

@end

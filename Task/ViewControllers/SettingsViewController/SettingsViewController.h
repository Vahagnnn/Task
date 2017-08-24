//
//  SettingsViewController.h
//  Task
//
//  Created by new on 24.08.17.
//  Copyright © 2017 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SortTableViewCell.h"
#import "FilterTableViewCell.h"
@protocol SettingsViewControllerDelegate <NSObject>

- (void)updateCategoryArray:(NSArray *)arrayCategory sort:(NSString *)sortKey;

@end

@interface SettingsViewController : UIViewController

@property (nonatomic, weak) id <SettingsViewControllerDelegate> delegate;

@property (nonatomic, strong) NSArray *filterArray;
@property (nonatomic, strong) NSArray *sortArray;

@property (nonatomic, strong) NSMutableArray *filterSelectedArray;
@property (nonatomic, strong) NSString *sortSelectedKey;

@end

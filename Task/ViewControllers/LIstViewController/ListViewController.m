//
//  ListViewController.h
//  Task
//
//  Created by new on 23.08.17.
//  Copyright © 2017 Home. All rights reserved.
//

#import "ListViewController.h"
#import "ListViewController+Configurator.h"

@interface ListViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *productsTableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
    [self.presenter present];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self.presenter searchByText:searchText];
}

- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [searchBar resignFirstResponder];
    }
    
    return YES;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.presenter.numberOfProducts;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductTableViewCell" forIndexPath:indexPath];
    [self.presenter configureCell:cell forRow:indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

#pragma mark - Action Methods
- (IBAction)settingsBarButtonAction:(id)sender {
    [self.presenter openSettings];
}

#pragma mark - ListViewDelegate
- (void)refreshTableView {
    [self.productsTableView reloadData];
}

@end

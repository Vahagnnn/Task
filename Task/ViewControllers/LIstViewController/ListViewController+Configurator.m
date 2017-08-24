//
//  ListViewController+Configurator.h
//  Task
//
//  Created by new on 23.08.17.
//  Copyright © 2017 Home. All rights reserved.
//
#import "ListViewController+Configurator.h"

@implementation ListViewController (Configurator) 

- (void)configure {
    ListViewModel *model = [[ListViewModel alloc] init];
    
    ListViewPresenter *presenter = [[ListViewPresenter alloc] init];
    presenter.view = self;
    presenter.model = model;
    
    self.presenter = presenter;
}

@end

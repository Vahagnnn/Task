//
//  ListViewController.h
//  Task
//
//  Created by new on 23.08.17.
//  Copyright © 2017 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListViewPresenter.h"

@interface ListViewController : UIViewController <ListViewDelegate>

@property (nonatomic, strong) ListViewPresenter *presenter;

@end


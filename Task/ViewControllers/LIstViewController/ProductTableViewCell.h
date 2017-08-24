//
//  ProductTableViewCell.h
//  Task
//
//  Created by new on 23.08.17.
//  Copyright © 2017 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *categoryLbl;
@property (weak, nonatomic) IBOutlet UILabel *priceLbl;

- (void)displayName:(NSString *)name;
- (void)displayCategory:(NSString *)category;
- (void)displayImage:(UIImage *)image;
- (void)displayPrice:(NSString *)price;

@end

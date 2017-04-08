//
//  Corporations.h
//  Home Task
//
//  Created by Ян on 02.04.17.
//  Copyright © 2017 Ян. All rights reserved.
//
#import <UIKit/UIKit.h>
@interface Corporations: NSObject
@property(nonatomic,strong) NSString* title;
@property(nonatomic,strong) NSString* creditRating;
@property(nonatomic,assign) BOOL* Default;
@property(nonatomic,assign) NSDate* dateOfFoundation;
@property(nonatomic,assign) NSNumber* profit;
-(id) initWithDictionary: (NSDictionary*) dictionary;

- (NSDateFormatter*)dateFormatter;
@end

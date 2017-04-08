//
//  Corporations.m
//  Home Task
//
//  Created by Ян on 02.04.17.
//  Copyright © 2017 Ян. All rights reserved.
//


#import "Corporations.h"
@interface Corporations()
@end

@implementation Corporations
-(id) initWithDictionary: (NSDictionary*) dictionary
{
    if(self == [super init])
    {
        _title = dictionary[@"@title"];
        _creditRating = dictionary[@"creditRating"];
        _Default = [dictionary[@"Default"]boolValue] ;
        _dateOfFoundation = dictionary[@"dateOfFoundation"];
        _profit = dictionary[@"profit"];
    }
    return self;
}
- (NSDateFormatter*)dateFormatter {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterShortStyle;
    return df;
}
-(NSString *)textDescription
{
    return[NSString stringWithFormat:@"Title - %@,Credit Rating - %@, Date of Foundation - %@, Profit - %@, Default - %s",
           _title,
           _creditRating,
           [[self dateFormatter] stringFromDate:_dateOfFoundation],
           _profit,
           (_Default == 1? "yes" : "no")
           ];
}

@end

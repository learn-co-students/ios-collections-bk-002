//
//  FISAppDelegate.m
//  Collections
//
//  Created by Chris Gonzales on 5/30/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSArray *)arrayBySortingArrayAscending:(NSArray *)array {
    NSSortDescriptor *sortByNilAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *sortedArray = [array sortedArrayUsingDescriptors:@[sortByNilAsc]];
    return sortedArray;
}

- (NSArray *)arrayBySortingArrayDescending:(NSArray *)array {
    NSSortDescriptor *sortByNilDsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    NSArray *sortedArray = [array sortedArrayUsingDescriptors:@[sortByNilDsc]];
    return sortedArray;
}

- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array {
    NSMutableArray *mArray = [array mutableCopy];
    [mArray exchangeObjectAtIndex:0 withObjectAtIndex:[array count]-1];
    return mArray;
}

- (NSArray *)arrayByReversingArray:(NSArray *)array {
    NSArray *reversedArray = [[array reverseObjectEnumerator] allObjects];
    return reversedArray;
}

- (NSString *)stringInBasicLeetFromString:(NSString *)string {
    NSDictionary *translator = @{ @"a" : @"4",
                                  @"s" : @"5",
                                  @"i" : @"1",
                                  @"l" : @"1",
                                  @"e" : @"3",
                                  @"t" : @"7"
                                  };
    
    NSMutableString *leetForm = [NSMutableString new];
    for (int i=0; i < string.length; i++) {
        NSString *character = [string substringWithRange:NSMakeRange(i, 1)];
        if (translator[character] != nil) {
            [leetForm appendString:translator[character]];
        } else {
            [leetForm appendString:character];
        }
    };
    return leetForm;
}


- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array {
    NSPredicate *positivePredicate = [NSPredicate predicateWithFormat:@"SELF > 0"];
    NSArray *positives = [array filteredArrayUsingPredicate:positivePredicate];
    
    NSPredicate *negativePredicate = [NSPredicate predicateWithFormat:@"SELF < 0"];
    NSArray *negatives = [array filteredArrayUsingPredicate:negativePredicate];
    
    return @[negatives, positives];
}

- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)hobbits {
    NSArray *hobbitNames = [hobbits allKeysForObject:@"hobbit"];
    return hobbitNames;
}

- (NSArray *)stringsBeginningWithAInArray:(NSArray *)array {
    NSPredicate *aPredicate =[NSPredicate predicateWithFormat:@"SELF beginswith[c] 'a'"];
    NSArray *beginWithA =[array filteredArrayUsingPredicate:aPredicate];
    return beginWithA;
}

- (NSInteger)sumOfIntegersInArray:(NSArray *)array {
    int sum = 0;
    for (NSNumber *n in array) {
        sum += [n integerValue];
    };
    return sum;
}

- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array {
    
    NSArray *plurals = @[ @"hands" ,
                          @"feet"  ,
                          @"knees" ,
                          @"tables",
                          @"boxes" ,
                          @"oxen"  ,
                          @"axles" ,
                          @"radii" ,
                          @"trivia"];
    return plurals;
}

- (NSDictionary *)countsOfWordsInString:(NSString *)string {
    
    NSString *filteredData = [[string componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]] componentsJoinedByString:@" "];
    NSMutableArray *components = [[filteredData componentsSeparatedByString:@" "] mutableCopy];
    [components removeObject:@""];
    NSMutableDictionary *countOfWords = [NSMutableDictionary new];
    for (NSString *word in components) {
        NSInteger wordCount = [countOfWords[[word lowercaseString]] intValue];
        wordCount++;
        countOfWords[[word lowercaseString]] = @(wordCount);
    }
    return countOfWords;
}

- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array {
    
    NSMutableDictionary *songsGroupedByArtist = [NSMutableDictionary new];
    for (NSString *group in array) {
        NSArray *entry = [group componentsSeparatedByString:@" - "];
        if (songsGroupedByArtist[entry[0]] == nil) {
            NSMutableArray *songs = [NSMutableArray new];
            [songs addObject:entry[1]];
            songsGroupedByArtist[entry[0]] = songs;
        } else {
            NSSortDescriptor *alphabetize = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
            NSMutableArray *newsongs = [songsGroupedByArtist valueForKey:entry[0]];
            [newsongs addObject:entry[1]];
            [newsongs sortUsingDescriptors:@[alphabetize]];
            songsGroupedByArtist[entry[0]] = newsongs;
        }
    }
    return songsGroupedByArtist;
}

@end

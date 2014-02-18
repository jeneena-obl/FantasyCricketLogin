//
//  FC_User.h
//  FantasyCricketLogin
//
//  Created by Pushparaj Zala on 2/17/14.
//  Copyright (c) 2014 Pushparaj Zala. All rights reserved.
//

#import <Foundation/Foundation.h>

#define USER_IMAGE @"UserProfileImage"
#define RIDESHARE_DIRECTORY @"RideShareBuddy"

@interface FC_User : NSObject

@property(nonatomic) NSUInteger userId;
@property(nonatomic, strong) NSString *realName;
@property(nonatomic, strong) NSString *email;
@property(nonatomic, strong) NSString *facebookId;
@property(nonatomic, strong) NSString *googlePlusId;

@property(nonatomic, strong) NSString *apiKey;

@property(nonatomic, strong) NSString *gender;
@property(nonatomic, strong) NSString *birthdate;

@property(nonatomic, strong) NSString *createAt;
@property(nonatomic, strong) NSString *imageUrl;
@property(nonatomic, strong) NSString *password;

@property(nonatomic, strong) NSData * image;

@property (nonatomic, strong) NSUserDefaults * userDefaults;

- (void)saveUserInfo;
- (id)init;
- (int)calculateAge:(NSString *)date;

@end

//
//  FC_User.m
//  FantasyCricketLogin
//
//  Created by Pushparaj Zala on 2/17/14.
//  Copyright (c) 2014 Pushparaj Zala. All rights reserved.
//

#import "FC_User.h"

@implementation FC_User
@synthesize image = _image, imageUrl = _imageUrl, realName = _realName, gender = _gender, createAt = _createAt;
@synthesize userId = _userId;
@synthesize email = _email;
@synthesize password = _password;
@synthesize userDefaults = _userDefaults;
@synthesize birthdate = _birthdate, apiKey = _apiKey;
@synthesize facebookId = _facebookId;
@synthesize googlePlusId = _googlePlusId;

- (id)init
{
    if(self = [super init])
    {
        _userDefaults = [[NSUserDefaults alloc] init];
        _userDefaults = [NSUserDefaults standardUserDefaults];
    }
    
    return self;
}

- (void)setUserId:(NSUInteger)userId
{
    if(_userId!=userId && userId)
    {
        _userId = userId;
        [self.userDefaults setInteger:_userId forKey:@"userId"];
    }
}

- (void)setRealName:(NSString *)realName
{
    if(![_realName isEqualToString:realName] && realName != nil)
    {
        _realName = realName;
        [self.userDefaults setObject:_realName forKey: @"realName"];
    }
}

-(void)setEmail:(NSString *)email
{
    if(![_email isEqualToString:email] && email != nil)
    {
        _email = email;
        [self.userDefaults setObject:_email forKey: @"email"];
    }
}

- (void)setFacebookId:(NSString *)facebookId
{
    if (![_facebookId isEqualToString:facebookId] && facebookId != nil)
    {
        _facebookId = facebookId;
        [self.userDefaults setObject:_facebookId forKey:@"facebookId"];
    }
}

-(void)setGooglePlusId:(NSString *)googlePlusId
{
    if (![_googlePlusId isEqualToString:googlePlusId] && googlePlusId != nil)
    {
        _googlePlusId = googlePlusId;
        [self.userDefaults setObject:_googlePlusId forKey:@"googlePlusId"];
    }
}

-(void)setApiKey:(NSString *)apiKey
{
    if (![_apiKey isEqualToString:apiKey] && apiKey != nil)
    {
        _apiKey = apiKey;
        [self.userDefaults setObject:_apiKey forKey:@"apiKey"];
    }
}

-(void)setGender:(NSString *)gender
{
    if (![_gender isEqualToString:gender] && gender != nil)
    {
        _gender = gender;
        [self.userDefaults setObject:_gender forKey:@"gender"];
    }
}

-(void)setBirthdate:(NSString *)birthdate
{
    if (![_birthdate isEqualToString:birthdate] && birthdate != nil)
    {
        _birthdate = birthdate;
        [self.userDefaults setObject:_birthdate forKey:@"birthDate"];
    }
}

-(void)setCreateAt:(NSString *)createAt
{
    if (![_createAt isEqualToString:createAt] && createAt != nil)
    {
        _createAt = createAt;
        [self.userDefaults setObject:_createAt forKey:@"createAt"];
    }
}

-(void)setImageUrl:(NSString *)imageUrl
{
    if (![_imageUrl isEqualToString:imageUrl] && imageUrl != nil)
    {
        _imageUrl = imageUrl;
        [self.userDefaults setObject:_imageUrl forKey:@"imageUrl"];
    }
}

-(void)setPassword:(NSString *)password
{
    if (![_password isEqualToString:password] && password != nil)
    {
        _password = password;
        [self.userDefaults setObject:_password forKey:@"password"];
    }
}

-(void)setImage:(NSData *)image
{
   // NSData* imageData = UIImagePNGRepresentation(image);
//    NSData* myEncodedImageData = [NSKeyedArchiver archivedDataWithRootObject:imageData];
//    [appDelegate.userDefaults setObject:myEncodedImageData forKey:@"myEncodedImageDataKey"];
    
    if (![_image isEqual:(NSData *)image] && image != nil)
    {
        _image = image;
        [self.userDefaults setObject:_image forKey:@"image"];
    }
}


#pragma mark - GETTER METHODS

- (NSString *)googlePlusId
{
    _googlePlusId=[self.userDefaults objectForKey:@"googlePlusId"];;
    return _googlePlusId;
    
}

-(NSString *)facebookId
{
    _facebookId=[self.userDefaults objectForKey:@"facebookId"];;
    return _facebookId;
}

-(NSString *)email
{
    _email=[self.userDefaults objectForKey:@"email"];;
    return _email;
}

-(NSString *)realName
{
    _realName=[self.userDefaults objectForKey:@"realName"];;
    return _realName;
}

- (NSString *)birthdate
{
    _birthdate = [self.userDefaults objectForKey: @"birthDate"];
    return _birthdate;
}

- (NSString *)apiKey
{
    _apiKey = [self.userDefaults objectForKey:@"apiKey"];
    return _apiKey;
}

- (NSUInteger)userId
{
    _userId = [self.userDefaults integerForKey:@"userId"];
    return _userId;
}


- (NSString *)imageUrl
{
    _imageUrl = [self.userDefaults objectForKey: @"imageUrl"];
    return _imageUrl;
}

- (NSString *)password
{
    _password = [self.userDefaults objectForKey:@"password"];
    return _password;
}

- (NSData *)image
{
    _image = [self.userDefaults objectForKey:@"image"];
    return _image;
}

- (NSString *)gender
{
    _gender = [self.userDefaults objectForKey: @"gender"];
    return _gender;
}

- (NSString *)createdAt
{
    _createAt = [self.userDefaults objectForKey: @"createAt"];
    return _createAt;
}


- (void)saveUserInfo
{
    //save to NSUserDefaults
    [self.userDefaults synchronize];
}

// clear all user variables from user defaults
- (void) clearUserDetailsFromUserDefaults
{
    [self.userDefaults removeObjectForKey: @"realName"];
    [self.userDefaults removeObjectForKey: @"imageUrl"];
    [self.userDefaults removeObjectForKey: @"gender"];
    [self.userDefaults removeObjectForKey: @"birthdate"];
    [self.userDefaults removeObjectForKey: @"createAt"];
    [self saveUserInfo];
}

- (int)calculateAge:(NSString *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *bdate = [dateFormatter dateFromString:date];
    NSInteger years;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    
    NSDateComponents *dateComponentsNow = [calendar components:unitFlags fromDate:[NSDate date]];
    NSDateComponents *dateComponentsBirth = [calendar components:unitFlags fromDate:bdate];
    if (([dateComponentsNow month] < [dateComponentsBirth month]) ||
        
        (([dateComponentsNow month] == [dateComponentsBirth month]) && ([dateComponentsNow day] < [dateComponentsBirth day])))
    {
        years = [dateComponentsNow year] - [dateComponentsBirth year] - 1;;
        
    }
    else
    {
        years = [dateComponentsNow year] - [dateComponentsBirth year];
    }
    return years;
    
}

@end

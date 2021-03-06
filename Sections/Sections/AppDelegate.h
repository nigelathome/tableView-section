//
//  AppDelegate.h
//  Sections
//
//  Created by Nigel Lee on 9/1/16.
//  Copyright © 2016 Apress. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


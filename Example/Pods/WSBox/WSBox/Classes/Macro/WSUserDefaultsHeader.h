//
//  WSUserDefaultsHeader.h
//  VVSBox
//
//  Created by ws on 17/1/23.
//  Copyright © 2017年 ws. All rights reserved.
//

#ifndef WSUserDefaultsHeader_h
#define WSUserDefaultsHeader_h

#define GET_DEFAULTS [NSUserDefaults standardUserDefaults]
#define GET_DEFAULTS_OBJECT_FOR_KEY(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]
#define SET_DEFAULTS_OBJECT_FOR_KEY(object,key) [[NSUserDefaults standardUserDefaults] setObject:object forKey:key]

#endif /* WSUserDefaultsHeader_h */

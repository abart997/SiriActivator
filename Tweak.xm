#import <UIKit/UIKit.h>

%hook ADAccount

-(NSString*)aceHost{

NSDictionary *plist = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.andev.siriactivator.plist"];

return [plist objectForKey:@"aceHost"];
}

-(void)setAceHost:(NSString*)aceHost{

NSDictionary *plist = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.andev.siriactivator.plist"];
    
	%orig([plist objectForKey:@"aceHost"]);
}

-(NSString*)speechIdentifier{

NSDictionary *plist = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.andev.siriactivator.plist"];

    return [plist objectForKey:@"speechID"];
}

-(void)setSpeechIdentifier:(NSString*)speechIdentifier{

NSDictionary *plist = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.andev.siriactivator.plist"];

     %orig([plist objectForKey:@"speechID"]);
}


-(NSString*)assistantIdentifier{

NSDictionary *plist = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.andev.siriactivator.plist"];

     return [plist objectForKey:@"assistantID"];
}

-(void)setAssistantIdentifier:(NSString*)assistantIdentifier{

NSDictionary *plist = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.andev.siriactivator.plist"];

     %orig([plist objectForKey:@"assistantID"]);
}


-(NSString*)validationData{

NSDictionary *plist = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.andev.siriactivator.plist"];

     return [plist objectForKey:@"validationData"];
}

-(BOOL)setValidationData:(NSData*)validationData{

NSDictionary *plist = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.andev.siriactivator.plist"];

return %orig([plist objectForKey:@"validationData"]);

}

%end
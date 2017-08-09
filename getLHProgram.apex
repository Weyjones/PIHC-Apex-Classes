@RestResource(urlMapping='/getLHProgram/*')
global with sharing class getLHProgram {
    
 
    @HttpGet
    global static List<Program_Location__c> getNutrition() {
        //String email = RestContext.request.params.get('email');
        //List<Program__c> nutritions = [SELECT Id, Name, Address__c, Account__r.Name, Description__c, Program_Focus__c, Program_Type__c, Focus_Area__c, What_ages_do_you_reach__c, Do_you_serve__c, LH2020_Does_your_program_serve__c, Sub_community_or_ethnic_group_reach__c, Program_Objective__c, Geographic_Scope__c, PIHC_Engagement__r.Name FROM Program__c WHERE PIHC_Engagement__r.Name  ='LiveHealthy2020'];
        
        String lat = RestContext.request.params.get('lat');
        String lng = RestContext.request.params.get('lng');
        List<Program_Location__c> nutritions;
        if(lat != null && lng != null && lat != '' && lng != ''){
            Decimal mylat = Decimal.ValueOf(lat);
            Decimal mylng = Decimal.ValueOf(lng);
            
            //List<Program__c> nutritions = [SELECT Id, Name, Address__c, Account__r.Name, Description__c, LWL_Dimension__c, LWL_program_website__c, LWL_Sub_category__c, LWL_Topic__c, LWL_Hours_of_Operation__c, PIHC_Engagement__r.Name FROM Program__c WHERE PIHC_Engagement__r.Name  ='LiveWellLocal'];
            nutritions = [SELECT Engagement__r.Name, Program__r.Program_Contact__r.Title, Program__r.Program_Contact__r.Name, Program__r.Program_Contact__r.Phone, Address__c, Program__r.Name, Program__r.Program_Contact__r.Email, Program__r.Account__r.Name, Program__r.Description__c, Program__r.Program_Focus__c, Program__r.Program_Type__c, Program__r.Focus_Area__c, Program__r.State__c, Program__r.What_ages_do_you_reach__c, Program__r.Do_you_serve__c, Program__r.LH2020_Does_your_program_serve__c, Program__r.Sub_community_or_ethnic_group_reach__c, Program__r.Program_Objective__c, Program__r.Geographic_Scope__c, GeoInfo__c, GeoInfo__Latitude__s, GeoInfo__Longitude__s, Zip_Postal_Code__c, City__c, DISTANCE(GeoInfo__c, GEOLOCATION(:mylat,:mylng), 'mi') FROM Program_Location__c Where Engagement__r.Name = 'LiveHealthy2020' and Program__c != null];
            
        } else {
            nutritions = [SELECT Engagement__r.Name, Program__r.Program_Contact__r.Title, Program__r.Program_Contact__r.Name, Program__r.Program_Contact__r.Phone, Address__c, Program__r.Name, Program__r.Program_Contact__r.Email, Program__r.Account__r.Name, Program__r.Description__c, Program__r.Program_Focus__c, Program__r.Program_Type__c, Program__r.Focus_Area__c, Program__r.State__c, Program__r.What_ages_do_you_reach__c, Program__r.Do_you_serve__c, Program__r.LH2020_Does_your_program_serve__c, Program__r.Sub_community_or_ethnic_group_reach__c, Program__r.Program_Objective__c, Program__r.Geographic_Scope__c, GeoInfo__Latitude__s, GeoInfo__Longitude__s, Zip_Postal_Code__c, City__c FROM Program_Location__c Where Engagement__r.Name = 'LiveHealthy2020' and Program__c != null];
        
        }
        return nutritions;
    }
    
}
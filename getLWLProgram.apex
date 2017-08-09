@RestResource(urlMapping='/getLWLProgram/*')
global with sharing class getLWLProgram {
    
 
    @HttpGet
    global static List<Program_Location__c> getNutrition() {
        String lat = RestContext.request.params.get('lat');
        String lng = RestContext.request.params.get('lng');
        List<Program_Location__c> nutritions;
        if(lat != null && lng != null && lat != '' && lng != ''){
            Decimal mylat = Decimal.ValueOf(lat);
            Decimal mylng = Decimal.ValueOf(lng);
            
            //List<Program__c> nutritions = [SELECT Id, Name, Address__c, Account__r.Name, Description__c, LWL_Dimension__c, LWL_program_website__c, LWL_Sub_category__c, LWL_Topic__c, LWL_Hours_of_Operation__c, PIHC_Engagement__r.Name FROM Program__c WHERE PIHC_Engagement__r.Name  ='LiveWellLocal'];
            nutritions = [SELECT Engagement__r.Name, Name, Address__c,  Program__r.Name, Program__r.Account__r.Name, Program__r.Account__r.LWL_Account_Common_Name__c, Program__r.Description__c, Program__r.LWL_Dimension__c, Program__r.LWL_program_website__c, Program__r.LWL_Sub_category__c, Program__r.LWL_Topic__c, Program__r.State__c, Program__r.LWL_Hours_of_Operation__c, GeoInfo__c, GeoInfo__Latitude__s, GeoInfo__Longitude__s, Zip_Postal_Code__c, City__c, DISTANCE(GeoInfo__c, GEOLOCATION(:mylat,:mylng), 'mi') FROM Program_Location__c Where Engagement__r.Name = 'LiveWellLocal' and Program__c != null];
        } else {
            nutritions = [SELECT Engagement__r.Name, Name, Address__c,  Program__r.Name, Program__r.Account__r.Name, Program__r.Account__r.LWL_Account_Common_Name__c, Program__r.Description__c, Program__r.LWL_Dimension__c, Program__r.LWL_program_website__c, Program__r.LWL_Sub_category__c, Program__r.LWL_Topic__c, Program__r.State__c, Program__r.LWL_Hours_of_Operation__c, GeoInfo__c, GeoInfo__Latitude__s, GeoInfo__Longitude__s, Zip_Postal_Code__c, City__c FROM Program_Location__c Where Engagement__r.Name = 'LiveWellLocal' and Program__c != null];

        }
        

        //Decimal lat = 47.72020;
        //Decimal lng = -122.31127;
        //for(Integer i=0; i<nutritions.size(); i++){
        //   if(!nutritions[i].Address__c.contains('ebsite')){
        //       Double distance = DISTANCE(nutritions[i].GeoInfo__c, GEOLOCATION(lat,lng), 'mi');
        //   }
        //}        
        return nutritions;
    }
    
}
@RestResource(urlMapping='/getAllLocations/*')
global with sharing class getAllLocations {
    @HttpPost
      global static String createNewGeoInfo() {      
         String idd = RestContext.request.params.get('id');
         String lat = RestContext.request.params.get('lat');
         String lng = RestContext.request.params.get('long');
         List<Program_Location__c> nutritions = new List<Program_Location__c>();
         nutritions=[SELECT Id, GeoInfo__latitude__s, GeoInfo__longitude__s from Program_Location__c where Id=:idd limit 1];
         
         nutritions[0].GeoInfo__latitude__s = Decimal.ValueOf(lat);
         nutritions[0].GeoInfo__longitude__s = Decimal.ValueOf(lng);
    
         update nutritions;
         return 'success update' + nutritions ;
      }
 
    @HttpGet
    global static List<Program_Location__c> getNutrition() {
        //String email = RestContext.request.params.get('email');
        //List<Program_Location__c> nutritions = [SELECT Id, Name, Address__c, Program__r.Id, Program__r.Name, Zip_Postal_Code__c, City__c FROM Program_Location__c];
        List<Program_Location__c> nutritions = [SELECT Engagement__r.Name, Name, Address__c, Program__r.Id, Program__r.Name, Program__r.Account__r.Name, Zip_Postal_Code__c, City__c FROM Program_Location__c];
        return nutritions;
    }
    
}
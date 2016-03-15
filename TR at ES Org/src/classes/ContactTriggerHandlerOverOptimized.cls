public class ContactTriggerHandlerOverOptimized{
      public boolean associateAccountToContact(List<Contact> trgReturnedContacts){
          List<Account> allAccounts = [select id,name,Domain__c from Account where Domain__c != NULL];
          Map<String,ID> mapDomainAccountID = new Map<String,ID>();
          List<String> emailSplit = new List<String>(); 
          String domain;
         for(Account eachAccount : allAccounts )
         {
             mapDomainAccountID.put(eachAccount.Domain__c,eachAccount.id);
         } 
         System.debug(mapDomainAccountID);                   
      
      
           for(Contact eachContact : trgReturnedContacts){
               if(eachContact.Email != NULL){
                   emailSplit = eachContact.Email.split('@');
                   domain = emailSplit[1];
                   if(mapDomainAccountID.containsKey(domain)){
                       eachContact.Accountid = mapDomainAccountID.get(domain );
                   }
               }   
           }
      return true;
      }
}
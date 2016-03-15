public class ContactTriggerHandlerOptimized{
    public boolean associateAccountToContact(List<Contact> trgReturnedContacts){
        List<Account> allAccounts = [select id,name,Domain__c from Account where Domain__c != NULL];
        System.debug(trgReturnedContacts);
        List<String> emailSplit = new List<String>(); 
        String domain;
        Map<String,List<Contact>> mapDomainContacts = new Map<String,List<Contact>>();
      //List<Contact> sameDomainContacts = new List<Contact>();
        
        for(Contact eachContact : trgReturnedContacts){
            if(eachContact.Email != NULL){
                emailSplit = eachContact.Email.split('@');
                domain = emailSplit[1];
                if(mapDomainContacts.containsKey(domain)){
                      /*Old Code
                      sameDomainContacts = mapDomainContacts.get(domain);
                      sameDomainContacts.add(eachContact);
                      mapDomainContacts.put(domain,sameDomainContacts);
                      */
                      mapDomainContacts.get(domain).add(eachContact);//Chaining
                 }
                else{
                    mapDomainContacts.put(domain,new List<Contact>{eachContact});
                }
                
            } 
        }
        System.debug('=========>>>>>>>>>'+mapDomainContacts);
        Id accId;
        for(String key : mapDomainContacts.keySet()){
            List<Contact> eachDomainSet = mapDomainContacts.get(key);
            for(Account eachAccount : allAccounts ){
                if(eachAccount.domain__c.contains(key))
                {
                    accId = eachAccount.Id;
                }
                
            }
            for(Contact eachContact : eachDomainSet){
                eachcontact.accountid = accid;
            }mapDomainContacts.put(key,eachDomainSet);
               
        }

        return true;
    }
}
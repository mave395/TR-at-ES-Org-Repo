public class ContactTriggerHandler{
    public boolean associateAccountToContact(List<Contact> trgReturnedContacts){
        List<Account> allAccounts = [select id,name,Domain__c from Account];
        //System.debug(trgReturnedContacts);
        List<String> emailSplit = new List<String>(); 
        String domain;
       
        for(Contact eachContact : trgReturnedContacts ){
                if(eachContact.Email != NULL){
                    emailSplit = eachContact.Email.split('@');
                    domain = emailSplit[1]; 
                    for(Account eachAccount : allAccounts){
                        if(eachAccount.Domain__c == domain)
                            eachContact.AccountId = eachAccount.id;
                    }
                }      
        }
        
        return true;
    }

}
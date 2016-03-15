public class DisplayAccounts {
    public List<Account> accList{set;get;}
    public String accId {set;get;}
    public String searchTerm {get;set;}
    public Integer noOfAccounts {get;set;}
   
    public DisplayAccounts (ApexPages.StandardController sc){
        System.debug(sc);
        accList = [select Name,Person_Email__c,Phone,Website from Account];
        noOfAccounts = accList.size();
        
    }
    
    
    
    public PageReference getAccountDetails(Integer Accid){
        return new PageReference('');
    }
    
    public PageReference showContacts(){
        //System.debug('+++++++++++>>>>>>>>'+accId);
        return new PageReference('/apex/AccountReletedContacts?id='+accId);
        
    }
    public PageReference search(){
        System.debug(searchTerm);
        string str = '%'+searchTerm +'%';
        accList = [select Name,Person_Email__c,Phone,Website from Account where Name like : str];
        System.debug('accList ============'+accList );
        noOfAccounts = accList.size();
        return null;
    }
}
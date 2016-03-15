public class ContactController{

    public String contactToBeDeleted {get;set;}
    
    public String getClickedAccount() {
        return null;
    }
    private List<Account> selectAccount;
    
    public String accountName{get;set;}
    
    public List<Contact> accRelatedContacts{get;set;}
    
    public String accId = ApexPages.CurrentPage().getParameters().get('id');
    
    public String accIdPermanent;
    
    public Integer noOfContacts {get;set;}
    
    public List<String> SerchAlpabet{get;set;}
    
    public String SearchVar{get;set;}
    
    public list<contact> showCon{set;get;}
    
    public list<contact> alphabetContacts{set;get;}


            
      
    public ContactController() {        
        
        accIdPermanent = accId;
        SerchAlpabet=new List<string>{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','All'};
        accRelatedContacts = [SELECT Id,Name,Email,Phone FROM Contact where AccountId = : accId ];
        noOfContacts = accRelatedContacts.size();
        SearchVar='All';
        selectAccount = [select name from Account where id = :accId ];     
        accountName = (String)selectAccount[0].name;  
        System.debug('accountName : ======='+accountName );
        
        
        
    }
    
    public PageReference deleteContacts (){
        if(!accRelatedContacts.isEmpty()){
            delete accRelatedContacts;
        }
        return new PageReference('/apex/List_of_All_Accouts'); 
    }
    
    public void deleteContact(){
        List<Contact> lstContactDelete = [select id from Contact where id = :contactToBeDeleted];
        //delete lstContactDelete;
        accRelatedContacts = [SELECT Id,Name,Email,Phone FROM Contact where AccountId = : accId ];
        noOfContacts = accRelatedContacts.size();
    }
    
    public PageReference display() {
        
        showCon = new List<Contact>();
        alphabetContacts = [SELECT Id,Name,Email,Phone FROM Contact where AccountId = : accIdPermanent];
         System.debug('SearchVar======>>>>>>>>'+SearchVar);
        for(Contact c : alphabetContacts)
        {
            if(SearchVar.equals('All'))
                showCon.add(c);
            else 
                if(c.Name.startsWith(SearchVar.toLowerCase())||c.Name.startsWith(SearchVar))
                showCon.add(c);
        }
        System.debug('ShowCon======>>>>>>>>'+ShowCon);
        accRelatedContacts = ShowCon;
        noOfContacts = accRelatedContacts.size();
        return null;
    }
    
    
}
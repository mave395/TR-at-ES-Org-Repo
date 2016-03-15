trigger AssociateCaseToAccount on Case (before insert) {
        List<Account> allAccounts = [Select id,name,Person_Email__c from account where RecordTypeId in(select id from recordtype where name = 'Person Account')];
        List<Case> trigNewCases = new  List<Case>(Trigger.new);
        
        for(Account eachAccount : allAccounts ){
            for(Case eachCase : trigNewCases ){
            if(eachCase.Origin=='Email' || eachCase.Origin=='Web'){
                System.debug(' Outer hola !!!!!!!!!!!!!');
                if(eachCase.SuppliedEmail == eachAccount.Person_Email__c){
                    System.debug('hola !!!!!!!!!!!!!');
                    eachCase.AccountId = eachAccount.id;
                }
            } 
        }
        }
}
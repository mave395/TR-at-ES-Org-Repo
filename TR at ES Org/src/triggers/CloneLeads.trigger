trigger CloneLeads on Lead (after insert) {
    List<Lead> trg_newLeads = Trigger.new;
    List<Lead> cloneLeads = new List<Lead>();
    Lead leadWithoutId = new Lead();
    //System.debug('dsfsagvasdf'+Trigger.new);
    for (Lead eachLead : trg_newLeads){
        leadWithoutId  = eachLead.clone(); 
        cloneLeads.add(leadWithoutId  );
    }System.debug('77777777'+leadWithoutId);
   
     if(checkRecursive.runOnce())
        {
         insert cloneLeads;
        } 
}
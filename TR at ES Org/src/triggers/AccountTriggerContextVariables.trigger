trigger AccountTriggerContextVariables on Account (before insert,after insert,
                                   before update,after update,
                                   before delete,after delete,
                                   after undelete) {
    
    if (Trigger.isBefore){
        if(Trigger.isInsert){
            System.debug('isBefore isInsert====>>>>>>>>======>>>>>>>'+Trigger.New);
        
        }
        
        if(Trigger.isUpdate){
            System.debug('isBefore  isUpdate====>>>>>>>>======>>>>>>>'+Trigger.New);
            System.debug('isBefore  isUpdate====>>>>>>>>======>>>>>>>'+Trigger.NewMap);
            System.debug('isBefore  isUpdate====>>>>>>>>======>>>>>>>'+Trigger.Old);
            System.debug('isBefore  isUpdate====>>>>>>>>======>>>>>>>'+Trigger.oldMap);
        }
        
        if(Trigger.isDelete){
            System.debug('isBefore  isDelete====>>>>>>>>======>>>>>>>'+Trigger.Old);
            System.debug('isBefore  isDelete====>>>>>>>>======>>>>>>>'+Trigger.oldMap);
        }       
    }
    
    if (Trigger.isAfter){
        if(Trigger.isInsert){
            System.debug('isAfter isInsert====>>>>>>>>======>>>>>>>'+Trigger.New);
            System.debug('isAfter isInsert====>>>>>>>>======>>>>>>>'+Trigger.NewMap);
        
        }
        
        if(Trigger.isUpdate){
            System.debug('isAfter isUpdate====>>>>>>>>======>>>>>>>'+Trigger.New);
            System.debug('isAfter isUpdate====>>>>>>>>======>>>>>>>'+Trigger.NewMap);
            System.debug('isAfter isUpdate====>>>>>>>>======>>>>>>>'+Trigger.Old);
            System.debug('isAfter isUpdate====>>>>>>>>======>>>>>>>'+Trigger.oldMap);
        
        }
        
        if(Trigger.isDelete){
        System.debug('isAfter  isDelete====>>>>>>>>======>>>>>>>'+Trigger.Old);
        System.debug('isAfter  isDelete====>>>>>>>>======>>>>>>>'+Trigger.oldMap);
        
        }
        if(Trigger.isUndelete){
         System.debug('isAfter  isUndelete====>>>>>>>>======>>>>>>>'+Trigger.Old);
        System.debug('isAfter  isUndelete====>>>>>>>>======>>>>>>>'+Trigger.oldMap);
            
             System.debug('isAfter  isUndelete===>>>>>>>>======>>>>>>>'+Trigger.New);
            System.debug('isAfter  isUndelete====>>>>>>>>======>>>>>>>'+Trigger.NewMap);
        
        }
       
       
    }        
    
}
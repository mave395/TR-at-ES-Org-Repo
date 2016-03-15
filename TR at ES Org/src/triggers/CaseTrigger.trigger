trigger CaseTrigger on Case (before insert) {
    CaseTriggerHandler caseTrgHandle = new CaseTriggerHandler();
    caseTrgHandle.associateCaseToAccount(Trigger.new);
}
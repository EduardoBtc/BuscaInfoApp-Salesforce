trigger BuscaCepTrigger on BuscaCep__c (after insert) {
    switch on Trigger.operationType {
        when AFTER_INSERT {
            BuscaCepTriggerHandler.onAfterInsert(Trigger.new);
        }
    }
}
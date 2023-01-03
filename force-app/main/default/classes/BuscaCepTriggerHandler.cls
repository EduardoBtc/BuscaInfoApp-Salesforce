public with sharing class BuscaCepTriggerHandler {
    public static void onAfterInsert(List<BuscaCep__c> buscaCepList) {
        for(BuscaCep__c buscaCep : buscaCepList) {
            BuscaCepService.checkCepIsValid(buscaCepList);
            BuscaCepService.populateFieldsCEP(new Set<Id> {buscaCep.Id});
        }
    }
}
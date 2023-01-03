public with sharing class BuscaCepSelector {
    public static List<BuscaCep__c> getBuscaCepById(Set<Id> ids) {
        return [
            SELECT
            Id,
            Name,
            Bairro__c,
            Cidade__c,
            Estado__c,
            Rua__c
            FROM BuscaCep__c
            WHERE Id IN :ids
        ];
    }
}
public with sharing class BuscaCepService {

    public static void checkCepIsValid(List<BuscaCep__c> buscaCepList) {
        for (BuscaCep__c buscaCep : buscaCepList) {
            if (StringUtils.removeSpecialCharacters(buscaCep.Name).length() != 8) {
                buscaCep.Name.addError('CEP inválido, digite um CEP com oito digitos.');
            }
        }
    }

    @future(callout=true)
    public static void populateFieldsCEP(Set<Id> informacoesIds) {

        List<BuscaCep__c> listBuscaCep = BuscaCepSelector.getBuscaCepById(informacoesIds);

        String cepInserted;
        for(BuscaCep__c buscaCep : listBuscaCep) {
            cepInserted = StringUtils.removeSpecialCharacters(buscaCep.Name);
        }

        BrasilApiFacadeService facadeCep = new BrasilApiFacadeService();
        BrasilApiFacadeService.BrasilApiResponseCep facadeCepResponse = new BrasilApiFacadeService.BrasilApiResponseCep();
        facadeCepResponse = facadeCep.getCEP(cepInserted);

        for (BuscaCep__c buscaCep : listBuscaCep) {
            buscaCep.Cidade__c = facadeCepResponse.city;
            buscaCep.Estado__c = facadeCepResponse.state;
            buscaCep.Bairro__c = facadeCepResponse.neighborhood;
            buscaCep.Rua__c = facadeCepResponse.street;
        }
        update listBuscaCep;
    }
}

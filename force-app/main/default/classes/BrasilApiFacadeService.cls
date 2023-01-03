public with sharing class BrasilApiFacadeService {
    public class BrasilApiResponseCep {
        public String cep;
        public String state;
        public String city;
        public String neighborhood;
        public String street;
        public String service;
    }

    public class BrasilApiResponseCnpj {
        public String cnpj;
        public Integer identificador_matriz_filial;
        public String descricao_matriz_filial;
        public String razao_social;
        public String nome_fantasia;
        public Integer situacao_cadastral;
        public String descricao_situacao_cadastral;
        public Date data_situacao_cadastral; 
        public Integer codigo_natureza_juridica;
        public Date data_inicio_atividade;
        public Integer cnae_fiscal;
        public String cnae_fiscal_descricao;
        public String descricao_tipo_logradouro;
        public String logradouro;
        public String numero;
        public String complemento;
        public String bairro;
        public Integer cep;
        public String uf;
        public Integer codigo_municipio;
        public String municipio;
        public String ddd_telefone_1;
        public Integer qualificacao_do_responsavel;
        public Integer capital_social;
        public String porte;
        public String descricao_porte;
        public Boolean opcao_pelo_simples;
        public Date data_opcao_pelo_simples;
        public Date data_exclusao_do_simples;
        public Boolean opcao_pelo_mei;
        public String situacao_especial;
        public Date data_situacao_especial;
    }

    public BrasilApiResponseCep getCep(String cep) {
        CalloutConfig__c endpointCep = CalloutConfigSelector.getByName('BaseBrasilApiCep');

        String url = endpointCep.EndPoint__c + cep;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        request.setTimeout(30000);
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            return (BrasilApiResponseCep) JSON.deserialize(response.getBody(), BrasilApiResponseCep.class);
        } else {
            return null;
        }
    }

    public BrasilApiResponseCnpj getCnpj(String cep) {
        CalloutConfig__c endpointCep = CalloutConfigSelector.getByName('BaseBrasilApiCnpj');

        String url = endpointCep.EndPoint__c + cep;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        request.setTimeout(30000);
        HttpResponse response = http.send(request);
        System.debug('DEBUG: ' + JSON.serialize(response.getBody()));
        if (response.getStatusCode() == 200) {
            return (BrasilApiResponseCnpj) JSON.deserialize(response.getBody(), BrasilApiResponseCnpj.class);
        } else {
            return null;
        }
    }
}
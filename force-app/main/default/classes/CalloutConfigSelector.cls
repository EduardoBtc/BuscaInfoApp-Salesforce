public with sharing class CalloutConfigSelector {
    public static CalloutConfig__c getByName(String name) {
        CalloutConfig__c calloutConfig = CalloutConfig__c.getInstance(name);

        if (calloutConfig == null) {
            NoDataFoundException ex = new NoDataFoundException();
            ex.setMessage(String.format('Callout config with name "{0}" not found.', new List<String>{ name }));

            throw ex;
        }

        return calloutConfig;
    }
}
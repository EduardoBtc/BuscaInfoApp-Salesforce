import { LightningElement, api, wire} from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';

import STREET from '@salesforce/schema/BuscaCep__c.Rua__c';
import CITY from '@salesforce/schema/BuscaCep__c.Cidade__c';
import STATE from '@salesforce/schema/BuscaCep__c.Estado__c';
import POSTAL_CODE from '@salesforce/schema/BuscaCep__c.Name';

export default class MapBuscaCep extends LightningElement {
    @api recordId;

    street;
    city;
    state;
    postalCode;

    mapMarkers;
    zoomLevel;
    listView;

    @wire(getRecord, { recordId: '$recordId', fields: [STREET, CITY, STATE, POSTAL_CODE] })
    wiredRecord({ error, data }) {
        console.log('data', data);
        if (data) {
            this.street = getFieldValue(data, STREET);
            this.city = getFieldValue(data, CITY);
            this.state = getFieldValue(data, STATE);
            this.postalCode = getFieldValue(data, POSTAL_CODE);
            this.connectedCallback();
        } else if (error) {
            this.error = error;
        }
    }

    connectedCallback() {
        this.mapMarkers = [{
            location: {
                Street: this.street,
                City: this.city,
                State: this.state,
                PostalCode: this.postalCode
            },
            title: this.street,
            description: this.city
        }];
        this.zoomLevel = 14;
        this.listView = 'visible';
    }
}
public class AccessToken {
    //Use your Client Id Destination org's
    String clientId ='3MVG954MqIw6FnnO3PeLpRFrMcUWwqgY1IiVLT6q.6NCgQE1IpXhmR1KpQ1WeFcsdgvaF29QEHAdEdwc0nmt0';
    				  
    //Use your Client Secret Destination org's
    String clientsecret='C9CF287B972D5617630F171E64A0F0AC29FE6E05066E23DF9A2D96C6C3816756';
    				
    
    //Your Destination org username
    String username='khadeeja.suleman@flowbird.group.devparknyc';
  
    
    //Your Destination orgPassword+Security Token--- vOl7AzMXVer01FczAjCq1pnP6  mha3NN5esITNB5N4yuuvaZeV
    String password='Iloveflowbird23059!vOl7AzMXVer01FczAjCq1pnP6';
    
    String accesstoken_url='https://test.salesforce.com/services/oauth2/token';
    
    String authurl='https://test.salesforce.com/services/oauth2/authorize';
    
    public class deserializeResponse {
        
        public String id;
        
        public String access_token;
        
    }
    //CaseWebService Acc
    public String ReturnAccessToken(){        
        
    Http h= new Http();
    
    HttpRequest req= new HttpRequest(); 
    req.setHeader('Content-Type','application/json');  
    req.setMethod('POST');    
    
    req.setEndpoint('https://test.salesforce.com/services/oauth2/token?grant_type=password'+
                    '&client_id=' + clientId +
                    '&client_secret=' + clientsecret +
                    '&username=' + EncodingUtil.urlEncode(username, 'UTF-8') +
                    '&password=' + EncodingUtil.urlEncode(password, 'UTF-8')
                    );         
                    HttpResponse res=h.send(req);
                    
                    System.debug('response body '+res.getBody());
        Map<String, Object> respObj = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
        String accn = String.valueOf(respObj.get('access_token'));
        System.debug('deserializeresponse '+accn);
                    
                    return accn;
                    
   }

}
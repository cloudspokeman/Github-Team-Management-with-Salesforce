public with sharing class CallOutAPIGitHub {
	
	public static HttpCalloutMock mock1 = null;
	public static HttpResponse response = null;

	@future(callout=true)
	public static void callOut_deleteUser(String user){
		
        String urlWebserviceString 		= 'https://api.github.com/teams/'+Label.TeamID+'/members/'+user;
        Http callReq = new Http();
    	HttpRequest request = new HttpRequest();
    	request.setEndpoint(urlWebserviceString);
    	request.setHeader('Authorization', 'Token ' + Label.AccessTokenGitHub);
    	request.setMethod('DELETE');
    	
    	if(Test.isRunningTest() && (mock1!=null)){
    		response = mock1.respond(request);
    	}else{
    		response = callReq.send(request); 
    	}
    	
    	if(response.getStatusCode() == 204 && response.getStatus() == 'No Content'){
    		System.debug('\n--->Response API GitHub -delete-: OK');
    	}else{
    		System.debug('\n--->Response API GitHub -delete-: ERROR');
    	}    
		
	}
	
	@future(callout=true)
	public static void callOut_addUser(String user){
		
        String urlWebserviceString 		= 'https://api.github.com/teams/'+Label.TeamID+'/members/'+user;
        Http callReq = new Http();
    	HttpRequest request = new HttpRequest();
    	request.setEndpoint(urlWebserviceString);
    	request.setHeader('Authorization', 'Token ' + Label.AccessTokenGitHub);
    	request.setMethod('PUT');
		request.setBody('');
		    	
    	if(Test.isRunningTest() && (mock1!=null)){
    		response = mock1.respond(request);
    	}else{
    		response = callReq.send(request); 
    	}
    	    	
    	if(response.getStatusCode() == 204 && response.getStatus() == 'No Content'){
    		System.debug('\n--->Response API GitHub -add-: OK');
    	}else{
    		System.debug('\n--->Response API GitHub -add-: ERROR');
    	}      
		
	}	
	
	
	
	

}
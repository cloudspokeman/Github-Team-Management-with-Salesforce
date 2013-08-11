/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class testTgChallengeParticipant {

    static testMethod void myUnitTest() {
    	
    	test.startTest();
    	//Implements HttpCalloutMock to test CallOut
    	Test.setMock(HttpCalloutMock.class, new TestCallOutMock());
        CallOutAPIGitHub.mock1 = new TestCallOutMock();
        
        //Create a challenge
        Challenge__c challenge = new Challenge__c(Name='test');
        insert challenge;
        
        //Create a member
        Member__c member = new Member__c();
        member.Name = 'test';
        member.Email__c = 'test@test.com';
        member.Github__c = 'githubUser';
        insert member;
        
        //Create a challenge Participant
        Challenge_Participant__c participant = new Challenge_Participant__c();
        participant.Challenge__c = challenge.id;
        participant.Member__c	 = member.id;
        participant.Status__c	 = 'Registered';
        insert participant;
        
        //Delete a challenge Participant
        Challenge_Participant__c participant_delete = [SELECT id FROM Challenge_Participant__c WHERE id =: participant.id];	
        delete participant_delete;
        test.stopTest();
        
        
        
    }
}
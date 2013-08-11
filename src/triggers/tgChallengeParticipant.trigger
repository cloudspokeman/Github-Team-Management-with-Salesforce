trigger tgChallengeParticipant on Challenge_Participant__c (after insert, before delete, before update) {
	
	map<Id,String>	mapaIdMemberName	=	new map<Id,String>();
	set<Id>			setIDMember			=	new set<Id>();
		
	if(trigger.isAfter){
		for(Challenge_Participant__c participant : trigger.new){
			setIDMember.add(participant.member__c);
		}
	}else{
		for(Challenge_Participant__c participant : trigger.old){
			setIDMember.add(participant.member__c);
		}		
	}
	
	for(Member__c member : [SELECT Github__c FROM Member__c WHERE id IN : setIDMember]){
		mapaIdMemberName.put(member.id,member.Github__c);
	}
	
	
	if(trigger.isInsert || trigger.isUpdate){
		for(Challenge_Participant__c participant : trigger.new){
			if(participant.status__c == 'Watching'){
				//Future method to will do the callOut to Github API
				CallOutAPIGitHub.callOut_deleteUser(mapaIdMemberName.get(participant.member__c));				
			}else{
				CallOutAPIGitHub.callOut_addUser(mapaIdMemberName.get(participant.member__c));				
			}
		}
	}
	
	if(trigger.isDelete){
		for(Challenge_Participant__c participant : trigger.old){
			CallOutAPIGitHub.callOut_deleteUser(mapaIdMemberName.get(participant.member__c));				
		}
	}	


}
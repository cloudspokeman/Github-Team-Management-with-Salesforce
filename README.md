SalesforceConnectAPIGithub--challenge2634-
==========================================

Cloudspokes Challenge 2634

Link to requeriments : http://www.cloudspokes.com/challenges/2634

Here at CloudSpokes, we love Github just as much as we love Salesforce.com. They are great platforms but ... sadly... are independent of one another. We want you to make our lives easier by allowing us to manage our Github team members from Salesforce!

When a member is participanting in a challenge we want to add them to a specific Github team. When their status chagnes to "watching" or they are removed as a particiapnt, we want to remove them from the Github team.


Please implement the following requirements:

When a record is inserted or updated with the status OTHER than "Watching", the corresponding member's Github user is added to the team.
When a record is inserted or updated with the status of "Watching", remove the corresponding member's Github user from the team.
When a Challenge Participant record is deleted, remove the corresponding member's Github user from the team.
Implementation takes advantage of @future method to perform transactions with Github API.

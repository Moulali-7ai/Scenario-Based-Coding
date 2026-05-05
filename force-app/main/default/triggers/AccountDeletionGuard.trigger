trigger AccountDeletionGuard on Account (before delete) {
    // 1. Get IDs of accounts being deleted
    Set<Id> accIds = Trigger.oldMap.keySet();

    // 2. Query for open opportunities related to these accounts
    Map<Id, Account> accountsWithOpenOpps = new Map<Id, Account>(
        [SELECT Id, (SELECT Id FROM Opportunities WHERE IsClosed = false LIMIT 1) 
         FROM Account WHERE Id IN :accIds]
    );

    // 3. Add error to prevent deletion
    for (Account acc : Trigger.old) {
        if (accountsWithOpenOpps.get(acc.Id).Opportunities.size() > 0) {
            acc.addError('Cannot delete Account: There are still open Opportunities linked to it.');
        }
    }
}
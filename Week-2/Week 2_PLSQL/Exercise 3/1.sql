CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
    FOR account IN (SELECT AccountID, Balance FROM Accounts WHERE AccountType = 'Savings')
    LOOP
        UPDATE Accounts
        SET Balance = Balance + (Balance * 0.01),
            LastModified = SYSDATE
        WHERE AccountID = account.AccountID;
    END LOOP;

    COMMIT;
END ProcessMonthlyInterest;
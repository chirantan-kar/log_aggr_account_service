package com.chirantan.account_service.service;

import com.chirantan.account_service.model.Account;

import java.util.List;
import java.util.Optional;

public interface AccountService {

    List<Account> getAllAccounts();

    Optional<Account> getAccountById(Long id);

    List<Account> getAccountsByCustomerId(Long customerId);

    Account createAccount(Account account);

    Account updateAccount(Long id, Account accountDetails);

    void deleteAccount(Long id);

    Account creditAccount(Long accountId, Double amount);

    Account debitAccount(Long accountId, Double amount);
}


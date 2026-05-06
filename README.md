# Salesforce DX Project: Next Steps

Now that you’ve created a Salesforce DX project, what’s next? Here are some documentation resources to get you started.

## How Do You Plan to Deploy Your Changes?

Do you want to deploy a set of changes, or create a self-contained application? Choose a [development model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

## Configure Your Salesforce DX Project

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
This is a great way to showcase your technical skills on GitHub. A well-structured `README.md` not only explains what you did but also demonstrates your understanding of the Salesforce Order of Execution and best practices.

Here is a professional and clean `README.md` template for your repository.

---

# Salesforce Apex Triggers: Scenario-Based Solutions

This repository contains a collection of Apex triggers designed to solve common business requirements within the Salesforce ecosystem. Each scenario focuses on specific trigger events, best practices (bulkification), and logic implementation.

## 🚀 Scenarios & Implementation

### 1. Lead Automation (Before Insert)
**Requirement:** Whenever a new Lead is created, if the `LeadSource` is 'Web', the system must automatically set the `Rating` to 'Warm' and the `Industry` to 'Technology'.

*   **Trigger Event:** `before insert`
*   **Key Logic:** Uses a "Before" trigger to update fields on the same record without needing an additional DML statement, optimizing performance.

---

### 2. Related Record Creation (After Insert)
**Requirement:** Every time a new Account is created, automatically create a default Contact for that account with the Last Name "Direct Representative".

*   **Trigger Event:** `after insert`
*   **Key Logic:** Utilizes the `after insert` event to ensure the Parent Account ID is available before associating and inserting the child Contact record.

---

### 3. Complex Cross-Object Validation (Before Delete)
**Requirement:** Prevent a user from deleting an Account if it has any "Open" (not Closed Won/Lost) Opportunities attached to it.

*   **Trigger Event:** `before delete`
*   **Key Logic:** 
    *   Queries related Opportunity records using the `Trigger.oldMap` keys.
    *   Uses the `.addError()` method to block the DML operation and display a custom error message to the user if open opportunities exist.

---

## 🛠 Best Practices Followed
*   **Bulkification:** All triggers are designed to handle 200+ records efficiently using Sets and Maps.
*   **One Trigger Per Object:** Logic is organized to prevent conflict and ensure a predictable order of execution.
*   **DML Optimization:** Minimized DML statements inside loops to avoid hitting Salesforce governor limits.
*   **Context Awareness:** Proper use of `Trigger.isBefore`, `Trigger.isAfter`, `Trigger.isInsert`, and `Trigger.isDelete`.

## 📖 How to Use
1. Clone this repository.
2. Deploy the classes and triggers to your Salesforce Developer Sandbox or Scratch Org.
3. Refer to the `force-app/main/default/triggers` folder for the source code.

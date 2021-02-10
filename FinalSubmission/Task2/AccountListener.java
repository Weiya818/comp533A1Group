package Task2;
// Kaiyue Pan - 260627397

import java.awt.event.ActionListener;
import javax.swing.DefaultListModel;
import javax.swing.JList;
import java.awt.event.ActionEvent;

// Start of user code for imports
// End of user code

/**
 * AccountListener class definition.
 * Generated by the TouchCORE code generator.
 */
public class AccountListener implements ActionListener {
    
    protected DefaultListModel<Account> accountListModel;
    protected JList<Customer> customerList;
    protected JList<Account> accountList;
    
    public AccountListener(DefaultListModel<Account> listModel, JList<Customer> custList, JList<Account> accList) {
        this.accountListModel = listModel;
        this.customerList = custList;
        this.accountList = accList;
    }

    public void actionPerformed(ActionEvent e) {
        Customer selectedCustomer = customerList.getSelectedValue();
        Account newAccount = new Account(0, selectedCustomer);
        accountListModel.insertElementAt(newAccount, 0);
        accountList.setSelectedIndex(0);
    }

    DefaultListModel<Account> getAccountListModel() {
        return this.accountListModel;
    }

    boolean setAccountListModel(DefaultListModel<Account> newObject) {
        this.accountListModel = newObject;
        return true;
    }

    JList<Customer> getCustomerList() {
        return this.customerList;
    }

    boolean setCustomerList(JList<Customer> newObject) {
        this.customerList = newObject;
        return true;
    }

    JList<Account> getAccountList() {
        return this.accountList;
    }

    boolean setAccountList(JList<Account> newObject) {
        this.accountList = newObject;
        return true;
    }
}

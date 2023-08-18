package vn.edu.hcmuaf.fit.model;

import java.io.Serializable;
import java.sql.Date;

public class Customer implements Serializable {
    private int id_customer;
    private String name;
    private String email;
    private String phone;
    private String address;
    private String username;
    private String password;
    private int permission;
    private boolean active;
    private Date create_date;
    private int typeAccount;
    public Customer() {
    }

    public Customer(int id_customer, String name, String email, String phone, String address, String username, String password, int permission, boolean active, Date create_date) {
        this.id_customer = id_customer;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.username = username;
        this.password = password;
        this.permission = permission;
        this.active = active;
        this.create_date = create_date;

    }

    public Customer(String name, String email, String phone, String address, int permission) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.permission = permission;
    }
    public Customer(String name, String email, String phone, String address, int permission, int typeAccount) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.permission = permission;
        this.typeAccount = typeAccount;
    }
    public int getTypeAccount() {
        return typeAccount;
    }

    public void setTypeAccount(int typeAccount) {
        this.typeAccount = typeAccount;
    }

    public int getId_customer() {
        return id_customer;
    }

    public void setId_customer(int id_customer) {
        this.id_customer = id_customer;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getPermission() {
        return permission;
    }

    public void setPermission(int permission) {
        this.permission = permission;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id_customer='" + id_customer + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", permission=" + permission +
                ", active=" + active +
                ", create_date=" + create_date +
                '}';
    }
}

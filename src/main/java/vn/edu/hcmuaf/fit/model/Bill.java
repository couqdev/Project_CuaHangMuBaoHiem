package vn.edu.hcmuaf.fit.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Bill {
    private int id;
    private Date date;
    private List<Integer> productList;
    private String status;
    private int id_cus;
    private String address;
    private String phone;

    public Bill(int id, Date date, List<Integer> list, String status, int id_cus, String address, String phone) {
        this.id = id;
        this.date = date;
        this.productList = list;
        this.status = status;
        this.id_cus = id_cus;
        this.address = address;
        this.phone = phone;
    }
    public Bill(){

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public List<Integer> getProductList() {
        return productList;
    }

    public void setProductList(List<Integer> productList) {
        this.productList = productList;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getId_cus() {
        return id_cus;
    }

    public void setId_cus(int id_cus) {
        this.id_cus = id_cus;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Bill{" +
                "id='" + id + '\'' +
                ", date=" + date +
                ", productList=" + productList +
                ", status='" + status + '\'' +
                ", id_cus='" + id_cus + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}

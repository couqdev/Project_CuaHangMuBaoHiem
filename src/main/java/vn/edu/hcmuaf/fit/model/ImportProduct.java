package vn.edu.hcmuaf.fit.model;

import java.util.Date;

public class ImportProduct {
    private int id;
    private int id_product;
    private long quantity;
    private long price;
    private Date date;
    private String name;
    private long totalQuantity;
    private long totalPrice;
    private String img;
    private String size;
    private String color;
    public ImportProduct(int id, int id_product, long quantity, long price, Date date) {
        this.id = id;
        this.id_product = id_product;
        this.quantity = quantity;
        this.price = price;
        this.date = date;
    }
    public ImportProduct(int id_product, String name, long totalQuantity, long totalPrice, String img) {
        this.id_product = id_product;
        this.name = name;
        this.totalPrice = totalPrice;
        this.totalQuantity = totalQuantity;
        this.img = img;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public ImportProduct(String size, String color, long price, long quantity, Date date) {
        this.date =date;
        this.size =size;
        this.color = color;
        this.price = price;
        this.quantity = quantity;
    }
    public ImportProduct(String size, String color, long quantity) {
        this.size =size;
        this.color = color;
        this.quantity = quantity;
    }
    public ImportProduct() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String toString(){
        return name+ " "+ totalQuantity + " " + totalPrice + " " +img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(long totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public long getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(long totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}

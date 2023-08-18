package vn.edu.hcmuaf.fit.model;

public class BillDetail {
    private int id_dp;
    private long quantitySold;
    private long price;
    private String name;
    public BillDetail() {
    }

    public BillDetail(int id_dp, long quantitySold, long price) {
        this.id_dp = id_dp;
        this.quantitySold = quantitySold;
        this.price = price;
    }

    public int getId_dp() {
        return id_dp;
    }

    public void setId_dp(int id_dp) {
        this.id_dp = id_dp;
    }

    public long getQuantitySold() {
        return quantitySold;
    }

    public void setQuantitySold(long quantitySold) {
        this.quantitySold = quantitySold;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

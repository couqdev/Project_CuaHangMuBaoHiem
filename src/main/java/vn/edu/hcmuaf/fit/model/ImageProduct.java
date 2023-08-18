package vn.edu.hcmuaf.fit.model;

public class ImageProduct {
    private int id_dp;
    private int id_product;
    private String img;
    private String isAllow;

    public ImageProduct() {
    }

    public ImageProduct(int id_dp, int id_product, String img, String isAllow) {
        this.id_dp = id_dp;
        this.id_product = id_product;
        this.img = img;
        this.isAllow = isAllow;
    }

    public int getId_dp() {
        return id_dp;
    }

    public void setId_dp(int id_dp) {
        this.id_dp = id_dp;
    }

    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getIsAllow() {
        return isAllow;
    }

    public void setIsAllow(String isAllow) {
        this.isAllow = isAllow;
    }

    @Override
    public String toString() {
        return "ImageProduct{" +
                "id_dp='" + id_dp + '\'' +
                ", id_product='" + id_product + '\'' +
                ", img='" + img + '\'' +
                ", isAllow='" + isAllow + '\'' +
                '}';
    }
    public String allow(String x){
        if(x.equalsIgnoreCase("1")){
            return "Hiển thị";
        }else{
            return "Không hiển thị";
        }
    }
    public String OppositionAllow(String x){
        if(x.equalsIgnoreCase("1")){
            return "Không hiển thị";
        }else{
            return "Hiển thị";
        }
    }
    public String OppoAllow(String x){
        if(x.equalsIgnoreCase("1")){
            return "0";
        }else{
            return "1";
        }
    }
}

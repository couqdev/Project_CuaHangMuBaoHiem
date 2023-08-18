package vn.edu.hcmuaf.fit.model;

public class SlideShow {
    private int id;
    private String img;
    private String allow;
    private double discount;
    private String content;
    private String name;
    public SlideShow(int id, String img, String allow) {
        this.id = id;
        this.img = img;
        this.allow = allow;
    }
    public SlideShow(int id, String img, String allow,String name) {
        this.id = id;
        this.img = img;
        this.allow = allow;
        this.name = name;
    }

    public SlideShow(int id, String img, String allow, double discount, String content) {
        this.id = id;
        this.img = img;
        this.allow = allow;
        this.discount = discount;
        this.content = content;
    }

    public SlideShow() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getAllow() {
        return allow;
    }

    public void setAllow(String allow) {
        this.allow = allow;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "SlideShow{" +
                "id='" + id + '\'' +
                ", img='" + img + '\'' +
                ", allow='" + allow + '\'' +
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

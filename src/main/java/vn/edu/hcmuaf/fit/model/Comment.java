package vn.edu.hcmuaf.fit.model;

public class Comment {
    private int id;

    private int id_customer;
    private int id_product;
    private int display;
    private String content;
    private String star;
    private String date;
    public Comment(int id_comt, int id_customer, int id_product, String content, String star, String date, int display) {
        this.id = id_comt;
        this.id_customer = id_customer;
        this.id_product = id_product;
        this.content = content;
        this.star = star;
        this.date = date;
        this.display = display;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStar() {
        return star;
    }

    public void setStar(String star) {
        this.star = star;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }

    public int getId_customer() {
        return id_customer;
    }

    public void setId_customer(int id_customer) {
        this.id_customer = id_customer;
    }

    public int getDisplay() {
        return display;
    }

    public void setDisplay(int display) {
        this.display = display;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", id_customer=" + id_customer +
                ", id_product=" + id_product +
                ", display=" + display +
                ", content='" + content + '\'' +
                ", star='" + star + '\'' +
                ", date='" + date + '\'' +
                '}';
    }

}

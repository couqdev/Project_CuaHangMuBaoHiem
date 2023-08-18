package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.model.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;


public class ProductService {
    public static List<Product> getData() {
        List<Product> list = new ArrayList<Product>();
        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
        try {
            ResultSet rs = statement.executeQuery("select id_product from products");
            while (rs.next()) {
                list.add(getProduct(rs.getInt("id_product")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static List<Product> getDatabyId(int index) {
        List<Product> list = new ArrayList<Product>();
        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
        try {
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("select id_product from products limit ?,10");
            ps.setInt(1, (index-1)*10);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(getProduct(rs.getInt("id_product")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static List<Product> findProduct(String para) {
        List<Product> list = new ArrayList<Product>();
        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
        try {
            ResultSet rs = statement.executeQuery("select id_product from products where name like '%" + para + "%'");
            while (rs.next()) {
                list.add(getProduct(rs.getInt("id_product")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static List<Product> filterProduct(String[] price, String[] star) {
        List<Product> result = new ArrayList<Product>();
        List<Integer> priceProduct = new ArrayList<Integer>();
        List<Integer> starProduct = new ArrayList<Integer>();
        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
        if (price == null) {
            try {
                ResultSet rs = statement.executeQuery("select id_product from products");
                while (rs.next()) {
                    priceProduct.add(rs.getInt("id_product"));
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else {
            for (String key : price) {
                switch (key) {
                    case "price-1": {
                        try {
                            ResultSet rs = statement.executeQuery("select id_product from products where (price-price*discount)>=0 and (price-price*discount)<=500000");
                            while (rs.next()) {
                                priceProduct.add(rs.getInt("id_product"));
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        break;
                    }
                    case "price-2": {
                        try {
                            ResultSet rs = statement.executeQuery("select id_product from products where (price-price*discount)>=500000 and (price-price*discount)<=1000000");
                            while (rs.next()) {
                                priceProduct.add(rs.getInt("id_product"));
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        break;
                    }
                    case "price-3": {
                        try {
                            ResultSet rs = statement.executeQuery("select id_product from products where (price-price*discount)>=1000000 and (price-price*discount)<=2000000");
                            while (rs.next()) {
                                priceProduct.add(rs.getInt("id_product"));
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        break;
                    }
                    case "price-4": {
                        try {
                            ResultSet rs = statement.executeQuery("select id_product from products where (price-price*discount)>=2000000 and (price-price*discount)<=5000000");
                            while (rs.next()) {
                                priceProduct.add(rs.getInt("id_product"));
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        break;
                    }
                    case "price-5": {
                        try {
                            ResultSet rs = statement.executeQuery("select id_product from products where (price-price*discount)>=5000000");
                            while (rs.next()) {
                                priceProduct.add(rs.getInt("id_product"));
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        break;
                    }
                    default:
                }
            }
        }
        if (star == null) {
            try {
                ResultSet rs = statement.executeQuery("select id_product from products");
                while (rs.next()) {
                    starProduct.add(rs.getInt("id_product"));
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else {
            for (String key : star) {
                switch (key) {
                    case "star-1": {
                        try {
                            ResultSet rs = statement.executeQuery("select id_product from star_votes where star>=0 and star<=1");
                            while (rs.next()) {
                                starProduct.add(rs.getInt("id_product"));
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        break;
                    }
                    case "star-2": {
                        try {
                            ResultSet rs = statement.executeQuery("select id_product from star_votes where star>1 and star<=2");
                            while (rs.next()) {
                                starProduct.add(rs.getInt("id_product"));
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        break;
                    }
                    case "star-3": {
                        try {
                            ResultSet rs = statement.executeQuery("select id_product from star_votes where star>2 and star<=3");
                            while (rs.next()) {
                                starProduct.add(rs.getInt("id_product"));
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        break;
                    }
                    case "star-4": {
                        try {
                            ResultSet rs = statement.executeQuery("select id_product from star_votes where star>3 and star<=4");
                            while (rs.next()) {
                                starProduct.add(rs.getInt("id_product"));
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        break;
                    }
                    case "star-5": {
                        try {
                            ResultSet rs = statement.executeQuery("select id_product from star_votes where star>4 and star<=5");
                            while (rs.next()) {
                                starProduct.add(rs.getInt("id_product"));
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        break;
                    }
                    default:
                }
            }
        }
        for (int st : priceProduct) {
            if (starProduct.contains(st)) {
                try {
                    result.add(getProduct(st));
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
        }
        return result;
    }

    public static Product getProduct(int idp) throws SQLException {
        Product p = new Product();
        p.setId(idp);
        p.setName(getname(idp));
        p.setPrice(getprice(idp));
        p.setBrand(getbrand(idp));
        p.setType(gettype(idp));
        p.setDiscount(getdiscount(idp));
        p.setImg(getimg(idp));
        p.setStar(getstar(idp));
        p.setAmount(getamount(idp));
        p.setRelease(getrelease(idp));
        p.setDecrispe(getdecrispe(idp));
        p.setDetail(getfirst(idp));
        return p;
    }

    public static List<ImageProduct> getimg(int id) throws SQLException {
        List<ImageProduct> img = new ArrayList<ImageProduct>();
        ImageProduct imgP = new ImageProduct();
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select id_img,id_product ,link_image, allow from images where id_product=? and allow=?");
        prs.setInt(1, id);
        prs.setString(2, "1");
        ResultSet rs = prs.executeQuery();
        while (rs.next()) {
            imgP = new ImageProduct(rs.getInt("id_img"), rs.getInt("id_product"), rs.getString("link_image"), rs.getString("allow"));
            img.add(imgP);
        }
        return img;
    }

    public static String getname(int id) throws SQLException {
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select name from products where id_product=?");
        prs.setInt(1, id);
        ResultSet rs = prs.executeQuery();
        if (rs.next()) {
            return rs.getString("name");
        }
        return null;
    }

    public static long getprice(int id) throws SQLException {
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select price from products where id_product=?");
        prs.setInt(1, id);
        ResultSet rs = prs.executeQuery();
        if (rs.next()) {
            return rs.getLong("price");
        }
        return 0;
    }

    public static String getbrand(int id) throws SQLException {
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select brand from products where id_product=?");
        prs.setInt(1, id);
        ResultSet rs = prs.executeQuery();
        if (rs.next()) {
            return rs.getString("brand");
        }
        return null;
    }

    public static String gettype(int id) throws SQLException {
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select type from products where id_product=?");
        prs.setInt(1, id);
        ResultSet rs = prs.executeQuery();
        if (rs.next()) {
            return rs.getString("type");
        }
        return null;
    }

    public static double getdiscount(int id) throws SQLException {
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select discount from products where id_product=?");
        prs.setInt(1, id);
        ResultSet rs = prs.executeQuery();
        if (rs.next()) {
            return rs.getDouble("discount");
        }
        return 0;
    }

    public static Double getstar(int id) throws SQLException {
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select star from star_votes where id_product=?");
        prs.setInt(1, id);
        ResultSet rs = prs.executeQuery();
        if (rs.next()) {
            return rs.getDouble("star");
        }
        return 0.0;
    }

    public static int getamount(int id) throws SQLException {
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select amount from star_votes where id_product=?");
        prs.setInt(1, id);
        ResultSet rs = prs.executeQuery();
        if (rs.next()) {
            return rs.getInt("amount");
        }
        return 0;
    }

    public static String getdecrispe(int id) throws SQLException {
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select decrispe from products where id_product=?");
        prs.setInt(1, id);
        ResultSet rs = prs.executeQuery();
        if (rs.next()) {
            return rs.getString("decrispe");
        }
        return null;
    }

    public static Date getrelease(int id) throws SQLException {
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select p.date from products p where p.id_product=?");

        prs.setInt(1, id);
        ResultSet rs = prs.executeQuery();
        if (rs.next()) {
            return rs.getDate("date");
        }
        return null;
    }

    public static int getStarComment(int id_comt){
        int result = 0;
        try {
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("select star from comments where id = ?");
            ps.setInt(1, id_comt);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                result+= rs.getInt(1);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return result;
    }
    public static String getDateComment(int id_comt) {
        String result = "";
        try {
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("select DAY(date),MONTH(date),YEAR(date) from comments where id = ?");
            ps.setInt(1, id_comt);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result += rs.getInt(1) + "/" + rs.getInt(2) + "/" + rs.getInt(3);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public static void addComment(int id_customer, int id_product, String content, int star, Date date, int display) {
        DBConnect dbConnect = DBConnect.getInstance();

        try {
            PreparedStatement prs = dbConnect.getConnection().prepareStatement("insert into comments (id_customer, id_product, comment, star, date, display) values(?, ?, ?, ?, NOW(), ?)");
            prs.setInt(1,id_customer);
            prs.setInt(2,id_product);
            prs.setString(3,content);
            prs.setInt(4,star);
//            prs.setDate(5, (java.sql.Date) date);
            prs.setInt(5, display);
            prs.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public static void deleteComment(int id_comt) {
        DBConnect dbConnect = DBConnect.getInstance();

        try {
            PreparedStatement prs = dbConnect.getConnection().prepareStatement("delete from comments where id = ?");
            prs.setInt(1, id_comt);
            prs.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public static List<Comment> getAllComment(){
        List<Comment> list = new ArrayList<>();
        try {
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("select id, id_customer, id_product, comment, star, date, display from comments");
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                list.add(new Comment(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return list;
    }
    public static List<Comment> getListCommentById(int id_pro){
        List<Comment> list = new ArrayList<>();
        try {
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("select  id, id_customer, id_product, comment, star, date, display from comments where id_product=?");
            ps.setInt(1,id_pro);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                list.add(new Comment(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return list;
    }


    public static List<Product> sort(String s) {
        List<Product> result = new ArrayList<Product>();
        try {
            DBConnect dbConnect = DBConnect.getInstance();
            switch (s) {
                case "new": {
                    ResultSet rs = dbConnect.get().executeQuery("select p.id_product from products p order by p.date desc ");
                    while (rs.next()) {
                        result.add(getProduct(rs.getInt("id_product")));
                    }
                    break;
                }
                case "popular": {
                    ResultSet rs = dbConnect.get().executeQuery("select dp.id_product, count(dp.id_product) from bills b join detail_bills db on b.id = db.id_bill join detail_products dp on db.id_dp = dp.id_dp group by dp.id_product order by count(dp.id_product) desc");
                    while (rs.next()) {
                        result.add(getProduct(rs.getInt("id_product")));
                    }
                    break;
                }
                case "rating": {
                    ResultSet rs = dbConnect.get().executeQuery("select p.id_product from products p join star_votes s on p.id_product = s.id_product order by s.star desc");
                    while (rs.next()) {
                        result.add(getProduct(rs.getInt("id_product")));
                    }
                    break;
                }
                default:
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static Product getDetailProduct(int idp) throws SQLException {
        Product p = new Product();
        p.setId(idp);
        p.setName(getname(idp));
        p.setPrice(getprice(idp));
        p.setBrand(getbrand(idp));
        p.setType(gettype(idp));
        p.setDiscount(getdiscount(idp));
        p.setImg(getimg(idp));
        p.setStar(getstar(idp));
        p.setAmount(getamount(idp));
        p.setRelease(getrelease(idp));
        p.setDecrispe(getdecrispe(idp));
        p.setDetail(getfirst(idp));
        return p;
    }

    public static List<DetailProduct> getfirst(int id) throws SQLException {
        List<DetailProduct> detail = new ArrayList<DetailProduct>();
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select id_dp, size, color, quantity from detail_products where id_product=? and quantity>0");
        prs.setInt(1, id);
        ResultSet rs = prs.executeQuery();
        while (rs.next()) {

            detail.add(new DetailProduct(rs.getInt("id_dp"), rs.getString("size"), rs.getString("color"), rs.getInt("quantity")));

        }
        return detail;
    }

    public static Product getDetailProduct(int idp, String size, String color) throws SQLException {
        Product p = new Product();
        p.setId(idp);
        p.setName(getname(idp));
        p.setPrice(getprice(idp));
        p.setBrand(getbrand(idp));
        p.setType(gettype(idp));
        p.setDiscount(getdiscount(idp));
        p.setImg(getimg(idp));
        p.setStar(getstar(idp));
        p.setAmount(getamount(idp));
        p.setRelease(getrelease(idp));
        p.setDecrispe(getdecrispe(idp));
        p.setDetail(getDetail(idp, size, color));
        return p;
    }

    public static List<DetailProduct> getDetail(int id, String size, String color) throws SQLException {
        List<DetailProduct> detail = new ArrayList<DetailProduct>();
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select id_dp, size, color, quantity from detail_products where id_product=? and size =? and color = ?");
        prs.setInt(1, id);
        prs.setString(2, size);
        prs.setString(3, color);
        ResultSet rs = prs.executeQuery();
        while (rs.next()) {
            detail.add(new DetailProduct(rs.getInt("id_dp"), rs.getString("size"), rs.getString("color"), rs.getInt("quantity")));
        }
        return detail;
    }

    public static Bill getBill(int id) throws SQLException {
        PreparedStatement prs = DBConnect.getInstance().getConnection().prepareStatement("select id_dp from detail_bills where id_bill=?");
        prs.setInt(1, id);
        List<Integer> list_product = new ArrayList<Integer>();
        ResultSet rs = prs.executeQuery();
        while (rs.next()) {
            list_product.add(rs.getInt("id_dp"));
        }
        PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("select id_customer, date, status, address, phone from bills where id=?");
        ps.setInt(1, id);
        ResultSet resultSet = ps.executeQuery();
        if (resultSet.next()) {
            return new Bill(id, resultSet.getDate("date"), list_product, resultSet.getString("status"), resultSet.getInt("id_customer"), resultSet.getString("address"), resultSet.getString("phone"));
        }
        return null;
    }

    public static List<Customer> findCustomer(String para) {
        List<Customer> list = new ArrayList<Customer>();
        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
        try {
            ResultSet rs = statement.executeQuery("select id_customer from customers where name like '%" + para + "%'");
            while (rs.next()) {
                list.add(getCustomer(rs.getInt("id_customer")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static Customer getCustomer(int idc) throws SQLException {
        Customer c = new Customer();
        PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("select name,email,phone,address,username,password,permission from customers where id_customer=?");
        ps.setInt(1, idc);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            c.setId_customer(idc);
            c.setName(rs.getString("name"));
            c.setEmail(rs.getString("email"));
            c.setPhone(rs.getString("phone"));
            c.setAddress(rs.getString("address"));
            c.setUsername(rs.getString("username"));
            c.setPassword(rs.getString("password"));
            c.setPermission(Integer.valueOf(rs.getString("permission")));
        }
        return c;
    }

    public static int addBill(int id_Customer, String status, List<BillDetail> id_dp, String address, String phone, String id_transport, String received_date, String fee, String total_cost) {
        int id_bill = 0;
        try {
            Date date = new Date();
            ResultSet resultSet = DBConnect.getInstance().get().executeQuery("select curdate()");
            if (resultSet.next()) {
                date = resultSet.getDate(1);
            }
            PreparedStatement prs = DBConnect.getInstance().getConnection().prepareStatement("INSERT into bills(id_customer,date,status,address,phone,id_transport, received_date,fee, total_cost ) values(?,?,?,?,?,?,?,?,?)");
            prs.setInt(1, id_Customer);
            prs.setDate(2, (java.sql.Date) date);
            prs.setString(3, status);
            prs.setString(4, address);
            prs.setString(5, phone);
            prs.setString(6, id_transport);
            prs.setString(7, received_date);
            prs.setInt(8, Integer.parseInt(fee));
            prs.setInt(9, Integer.parseInt(total_cost));
            prs.executeUpdate();

            ResultSet rs = DBConnect.getInstance().get().executeQuery("select id from bills");
            rs.last();
            id_bill = rs.getInt("id");

            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("INSERT into detail_bills(id_bill,id_dp, quantitySold, price) values(?,?,?,?)");
            for (BillDetail i : id_dp) {
                ps.setInt(1, id_bill);
                ps.setInt(2, i.getId_dp());
                ps.setLong(3, i.getQuantitySold());
                ps.setLong(4, i.getPrice());
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id_bill;
    }

    public static void cancel_bill(int id_bill) {
        try {
            String status = "Đã hủy";
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("UPDATE bills set status = ? where id =?");
            ps.setString(1, status);
            ps.setInt(2, id_bill);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<Product> listFullFace() {
        List<Product> list = new ArrayList<Product>();

        DBConnect dbConnect = DBConnect.getInstance();

        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product from products where type =?");
            ps.setString(1, "FULLFACE");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(getProduct(rs.getInt("id_product")));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static List<Customer> getData_Customer() {
        List<Customer> list = new ArrayList<Customer>();
        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
        try {
            ResultSet rs = statement.executeQuery("select id_customer from customers");
            while (rs.next()) {
                list.add(getCustomer(rs.getInt("id_customer")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static List<Product> list3_4() {
        List<Product> list = new ArrayList<Product>();

        DBConnect dbConnect = DBConnect.getInstance();

        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product from products where type =? ");
            ps.setString(1, "3/4");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(getProduct(rs.getInt("id_product")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static List<Product> listNuaDau() {
        List<Product> list = new ArrayList<Product>();

        DBConnect dbConnect = DBConnect.getInstance();

        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product from products where type =? ");
            ps.setString(1, "NUADAU");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(getProduct(rs.getInt("id_product")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static List<Product> listChildren() {
        List<Product> list = new ArrayList<Product>();

        DBConnect dbConnect = DBConnect.getInstance();

        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product from products where type =? ");
            ps.setString(1, "CHILDREN");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(getProduct(rs.getInt("id_product")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static int countProduct() {
        int count = 0;
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product from products");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                count++;
            }
        } catch (SQLException e) {
        }
        return count;
    }

    public static int countDetailProduct() {
        int count = 0;
        DBConnect dbConnect = DBConnect.getInstance();

        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_dp from detail_products");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                count++;
            }
        } catch (SQLException e) {
        }
        return count;
    }

    public static int insertProduct(String name, String price, String brand, String type, String discount, String decrispe) {
        int id = 0;
        String typeDB = type;
        if (type.equals("3_4")) {
            typeDB = "3/4";
        }
        int priceDB = Integer.parseInt(price);
        double discounta = Double.parseDouble(discount);
        double discountDB = discounta / 100;
        int count = countProduct();

        LocalDate localDate = LocalDate.now();
        int year = localDate.getYear();
        int mont = localDate.getMonthValue();
        int day = localDate.getDayOfMonth();

        String date = year + "-" + mont + "-" + day;
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("insert into products(name,price,brand,type,discount,decrispe,date) values (?,?,?,?,?,?,?)");

            ps.setString(1, name);
            ps.setInt(2, priceDB);
            ps.setString(3, brand);
            ps.setString(4, typeDB);
            ps.setDouble(5, discountDB);
            ps.setString(6, decrispe);
            ps.setString(7, date);
            ps.executeUpdate();
            ResultSet rs = DBConnect.getInstance().get().executeQuery("select id_product from products");
            rs.last();
            id = rs.getInt("id_product");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return id;
    }

    public static void insertDetailProduct(int id, String size, String color, String quantity) {
        int quantityDB = Integer.parseInt(quantity);

        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("insert into detail_products(id_product,size,color,quantity) values (?,?,?,?)");
            ps.setInt(1, id);
            ps.setString(2, size.toUpperCase());

            ps.setString(3, color.toLowerCase());
            ps.setInt(4, quantityDB);

            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static boolean checkDBContainSizeColor(int id, String size, String color) {
        boolean result = false;
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select size, color from detail_products where id_product=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getString(1).equalsIgnoreCase(size) && rs.getString(2).equalsIgnoreCase(color)) {
                    return true;
                }
            }
        } catch (SQLException e) {
        }
        return result;
    }

    public static int getIdDetailProductByCS(int id, String size, String color) {
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_dp, size, color from detail_products where id_product=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getString(2).equalsIgnoreCase(size) && rs.getString(3).equalsIgnoreCase(color)) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public static void updateSizeColorById(int id, String quantity) {
        int quantityDB = Integer.parseInt(quantity);
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("update detail_products set quantity = quantity+? where id_dp=?");
            ps.setInt(1, quantityDB);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("errp");
        }
    }

    public static void insertImg(int id, String img) {

        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("insert into images(id_product,link_image,allow) values (?,?,?)");

            ps.setInt(1, id);
            ps.setString(2, img);
            ps.setString(3, "1");
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void updateProduct(int id, String name, String price, String brand, String type, String discount, String decrispe) {
        String typeDB = type;
        if (type.equals("3_4")) {
            typeDB = "3/4";
        }
        int priceDB = Integer.parseInt(price);
        double discounta = Double.parseDouble(discount);
        double discountDB = discounta / 100;

        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("update products set name=?, price=?,brand=?,type=?,discount=?,decrispe=? where id_product=?");

            ps.setString(1, name);
            ps.setInt(2, priceDB);

            ps.setString(3, brand);
            ps.setString(4, typeDB);
            ps.setDouble(5, discountDB);
            ps.setString(6, decrispe);
            ps.setInt(7, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void removeProduct(int id) {
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("delete from products where id_product=?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void removeImage(int id) {
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("delete from images where id_img=?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void updateImage(int id, String allow) {
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("update images set allow = ? where id_img= ?");

            ps.setString(1, allow);

            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static Map<String, Integer> getListBrand() {
        Map<String, Integer> result = new HashMap<String, Integer>();
        try {
            ResultSet rs = DBConnect.getInstance().get().executeQuery("select brand,count(id_product)as SL from products group by brand");
            while (rs.next()) {
                result.put(rs.getString(1), Integer.parseInt(rs.getString(2)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static List<Product> getProductByBrand(String brand) {
        List<Product> result = new ArrayList<Product>();
        try {
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("select id_product from products where brand =?");
            ps.setString(1, brand);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                result.add(getProduct(rs.getInt("id_product")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static int getQuantityProduct(long starPrice, long endPrice) {
        int result = 0;
        try {
            if (endPrice == 0) {
                PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("select count(price) from products where (price-price*discount)>=?");
                ps.setLong(1, starPrice);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    result += rs.getInt(1);
                }
            } else {
                PreparedStatement prs = DBConnect.getInstance().getConnection().prepareStatement("select count(price) from products where (price-price*discount)>=? and (price-price*discount)<=?");
                prs.setLong(1, starPrice);
                prs.setLong(2, endPrice);
                ResultSet resultSet = prs.executeQuery();
                if (resultSet.next()) {
                    result += resultSet.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static int getQuantityStarProduct(int star) {
        int result = 0;
        try {
            if (star == 1) {
                PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("select count(star) from star_votes where star>=0 and star<=1");
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    result += rs.getInt(1);
                }
            } else {
                PreparedStatement prs = DBConnect.getInstance().getConnection().prepareStatement("select count(star) from star_votes where star>?-1 and star<=?");
                prs.setInt(1, star);
                prs.setInt(2, star);
                ResultSet resultSet = prs.executeQuery();
                if (resultSet.next()) {
                    result += resultSet.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static Product getProductFullImage(int idp) throws SQLException {
        Product p = new Product();
        p.setId(idp);
        p.setName(getname(idp));
        p.setPrice(getprice(idp));
        p.setBrand(getbrand(idp));
        p.setType(gettype(idp));
        p.setDiscount(getdiscount(idp));
        p.setImg(getimgAll(idp));
        p.setStar(getstar(idp));
        p.setAmount(getamount(idp));
        p.setRelease(getrelease(idp));
        p.setDecrispe(getdecrispe(idp));
        return p;
    }

    public static List<ImageProduct> getimgAll(int id) throws SQLException {
        List<ImageProduct> img = new ArrayList<ImageProduct>();
        ImageProduct imgP = new ImageProduct();
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select id_img,id_product ,link_image, allow from images where id_product=?");
        prs.setInt(1, id);
        ResultSet rs = prs.executeQuery();
        while (rs.next()) {
            imgP = new ImageProduct(rs.getInt("id_img"), rs.getInt("id_product"), rs.getString("link_image"), rs.getString("allow"));
            img.add(imgP);
        }
        return img;
    }

    public static void removeDetailProduct(int id) {
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("delete from detail_products where id_dp=?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void updateDetailPQuantity(int id, String quantity) {
        int quantityDB = Integer.parseInt(quantity);
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("update detail_products set quantity = ? where id_dp=?");
            ps.setInt(1, quantityDB);
            ps.setInt(2, id);

            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("errp");
        }
    }

    public static List<Product> getData(int a, int b) {
        List<Product> list = new ArrayList<Product>();
        DBConnect dbConnect = DBConnect.getInstance();

        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product from products limit ?,?");
            ps.setInt(1, a);
            ps.setInt(2, b);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(getProduct(rs.getInt("id_product")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public List<Product> pagination(int a, int b, List<Product> list) {
        List<Product> result = new ArrayList<Product>();
        for (int i = a; i < b + a; i++) {
            if (i < list.size()) {
                result.add(list.get(i));
            }
        }

        return result;
    }

    public static List<Product> listDiscount(String discount) {
        List<Product> list = new ArrayList<Product>();
        double discountDB = Double.parseDouble(discount);
        DBConnect dbConnect = DBConnect.getInstance();

        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product from products where discount =?");
            ps.setDouble(1, discountDB);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(getProduct(rs.getInt("id_product")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static void delete_customer(int id) {
        try {
            PreparedStatement preparedStatement = DBConnect.getInstance().getConnection().prepareStatement("delete from customers where id_customer=?");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void fix_customer(int id, String name, String phone, String email, String address) {
        try {
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("update customers set name=?,phone=?,email=?,address=? where id_customer=?");
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.setString(4, address);
            ps.setInt(5, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<Bill> getBillByDate(int month, int year) {
        List<Bill> result = new ArrayList<Bill>();
        try {
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("select id from bills where month(date)=? and year(date)=?");
            ps.setInt(1, month);
            ps.setInt(2, year);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                result.add(getBill(rs.getInt("id")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static int getIdProduct(int id_dp) {
        try {
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("select p.id_product from products p join detail_products dp on p.id_product = dp.id_product where dp.id_dp=?");
            ps.setInt(1, id_dp);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt("id_product");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static List<Bill> getListBill() {
        List<Bill> result = new ArrayList<Bill>();
        try {
            ResultSet rs = DBConnect.getInstance().get().executeQuery("select id from bills");
            while (rs.next()) {
                result.add(getBill(rs.getInt("id")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static List<Bill> findBill(String para) {
        List<Bill> list = new ArrayList<Bill>();
        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
        try {
            ResultSet rs = statement.executeQuery("select id from bills where id like '%" + para + "%'");
            while (rs.next()) {
                list.add(getBill(rs.getInt("id")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static List<Bill> getListBillByIdCustomer(int id_cus) {
        List<Bill> result = new ArrayList<Bill>();
        try {
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("select id from bills where id_customer=?");
            ps.setInt(1, id_cus);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                result.add(getBill(rs.getInt("id")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static List<Product> totalProductBill(int month, int year) throws SQLException {
        List<Product> list_product = new ArrayList<Product>();
        List<Bill> list = getBillByDate(month, year);
        for (Bill b : list) {
            for (int s : b.getProductList()) {
                list_product.add(getProduct(getIdProduct(s)));
            }
        }
        return list_product;
    }

    public static long totalPriceBill(int month, int year) {
        long result = 0;
        List<Product> list = new ArrayList<Product>();
        try {
            list = totalProductBill(month, year);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for (Product p : list) {
            result += (p.getPrice() * (1 - (long) p.getDiscount()));
        }
        return result;
    }

    public static String getSize(int id_dp) {
        String result = "";
        try {
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("select size from detail_products where id_dp=?");
            ps.setInt(1, id_dp);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result += rs.getString("size");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static String getColor(int id_dp) {
        String result = "";
        try {
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("select color from detail_products where id_dp=?");
            ps.setInt(1, id_dp);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result += rs.getString("color");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static int getQuantity(int id_bill, int id_dp) {
        int result = 0;
        try {
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("select id_bill,count(id_dp) as quantity from detail_bills where id_dp=? and id_bill=? group by id_bill");
            ps.setInt(1, id_dp);
            ps.setInt(2, id_bill);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) result += rs.getInt("quantity");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static void updateBill(int id, String address, String phone, String status) {
        try {
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("update bills set address=?,phone=?, status=? where id=? ");
            ps.setString(1, address);
            ps.setString(2, phone);
            ps.setString(3, status);
            ps.setInt(4, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void updateStatus(int id, String status) {
        try {
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("update bills set status=? where id=? ");
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void deleteBill(int id_bill) {
        try {
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("delete from bills where id=?");
            ps.setInt(1, id_bill);
            ps.executeUpdate();
            PreparedStatement prs = DBConnect.getInstance().getConnection().prepareStatement("delete from detail_bills where id_bill=?");
            prs.setInt(1, id_bill);
            prs.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<Product> listType(String type, int id) {
        List<Product> list = new ArrayList<Product>();

        DBConnect dbConnect = DBConnect.getInstance();

        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product from products where type =? and id_product not in(?)");
            ps.setString(1, type);
            ps.setInt(2, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(getProduct(rs.getInt("id_product")));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public static boolean idProduct(int id) {
        boolean result = false;
        try {
            DBConnect dbConnect = DBConnect.getInstance();
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product from products where id_product=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static boolean idDetaiProduct(int id) {
        boolean result = false;
        try {
            DBConnect dbConnect = DBConnect.getInstance();
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_dp from detail_products where id_dp=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static boolean idImg(int id) {
        boolean result = false;
        try {
            DBConnect dbConnect = DBConnect.getInstance();
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_img from images where id_img=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static int getIdProductByIddp(int id_dp) {
        int result = 0;
        try {
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("select id_product from detail_products where id_dp=?");
            ps.setInt(1, id_dp);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result += rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static int getIdCusByUserName(String username) {
        int result = 0;
        try {
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("select id_customer from customers where username=?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result += rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public static List<Log> onePageLog(int index) {
        List<Log> list = new ArrayList<>();
        int newindex = Math.abs(index - (getTotalLog()/10))*10+getTotalLog()%10;
        try {
            if(index==(getTotalLog()/10+1)){
                int du = getTotalLog()%10;
                PreparedStatement prs = DBConnect.getInstance().getConnection().prepareStatement("select id, level, user, src, content, createAt, status from logs limit ?,?");
                prs.setInt(1, 0);
                prs.setInt(2, du);
                ResultSet rs = prs.executeQuery();
                while (rs.next()) {
                    list.add(new Log(
                            rs.getInt("id"),
                            rs.getInt("level"),
                            rs.getString("user"),
                            rs.getString("src"),
                            rs.getString("content"),
                            rs.getDate("createAt"),
                            rs.getInt("status")));
                }
                Collections.reverse(list);
            }else{
                PreparedStatement prs = DBConnect.getInstance().getConnection().prepareStatement("select id, level, user, src, content, createAt, status from logs limit ?,10");
                prs.setInt(1, newindex);
                ResultSet rs = prs.executeQuery();
                while (rs.next()) {
                    list.add(new Log(
                            rs.getInt("id"),
                            rs.getInt("level"),
                            rs.getString("user"),
                            rs.getString("src"),
                            rs.getString("content"),
                            rs.getDate("createAt"),
                            rs.getInt("status")));
                }
                Collections.reverse(list);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public static int getTotalLog(){
        String query = "select count(distinct id) from logs";
        try{
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return 0;
    }
    public static List<Integer> getListCommentByProduct(int idpro,  int index) {
        List<Integer> list = new ArrayList<Integer>();
        try {
            PreparedStatement prs = DBConnect.getInstance().getConnection().prepareStatement("select id from comments where id_product=? limit ?,10");
            prs.setInt(1, idpro);
            prs.setInt(2, (index-1)*10);
            ResultSet rs = prs.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static int getTotalComment(int idPro){
        String query = "select count(distinct id) from comments where id_product = ?";
        try{
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement(query);
            ps.setInt(1, idPro);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return 0;
    }

    public static int getIdCustomerByIdComment(int id) {
        int result = 0;
        try {
            PreparedStatement prs = DBConnect.getInstance().getConnection().prepareStatement("select id_customer from comments where id=?");
            prs.setInt(1, id);
            ResultSet rs = prs.executeQuery();
            while (rs.next()) {
                result += rs.getInt("id_customer");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static String getCommentByIdComment(int id) {
        String result = "";
        try {
            PreparedStatement prs = DBConnect.getInstance().getConnection().prepareStatement("select comment from comments where id=?");
            prs.setInt(1, id);
            ResultSet rs = prs.executeQuery();
            while (rs.next()) {
                result += rs.getString("comment");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static int getStarByIdComment(int id) {
        int result = 0;
        try {
            PreparedStatement prs = DBConnect.getInstance().getConnection().prepareStatement("select star from comments where id=?");
            prs.setInt(1, id);
            ResultSet rs = prs.executeQuery();
            while (rs.next()) {
                result = rs.getInt("star");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static Date getDateByIdComment(int id) {
        String result = "";
        try {
            PreparedStatement prs = DBConnect.getInstance().getConnection().prepareStatement("select date from comments where id=?");
            prs.setInt(1, id);
            ResultSet rs = prs.executeQuery();
            if (rs.next()) {
                return rs.getDate("date");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static int getDisplayByIdComment(int id) {
        int result = 0;
        try {
            PreparedStatement prs = DBConnect.getInstance().getConnection().prepareStatement("select display from comments where id=?");
            prs.setInt(1, id);
            ResultSet rs = prs.executeQuery();
            if (rs.next()) {
                return rs.getInt("display");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static void changeDisplayComment(int id) {
        int dislay = getDisplayByIdComment(id);
        try {
            PreparedStatement prs = DBConnect.getInstance().getConnection().prepareStatement("update comments set display = ? where id =?");
            prs.setInt(2, id);
            if (dislay == 0) {
                prs.setInt(1, 1);
            } else {
                prs.setInt(1, 0);
            }
            prs.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void insertImportProduct(int id_product, String size, String color, String quantity, String price) {
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("insert into importproducts(id_product,size,color, quantity, price,date) values (?,?,?,?,?,?)");
            ps.setInt(1, id_product);
            ps.setString(2, size);
            ps.setString(3, color);
            ps.setLong(4, Long.parseLong(quantity));
            ps.setLong(5, Long.parseLong(price));
            ps.setString(6, LocalDateTime.now().toString());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static long maxPrice(String id) {
        DBConnect dbConnect = DBConnect.getInstance();
        long priceMax = 0;
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select max(price) from  importproducts where id_product= ?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                priceMax = rs.getLong(1);
            }
        } catch (SQLException e) {
        }
        return priceMax;
    }

    public static void updatePriceMax(String id) {
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("update products set price = ? where id_product= ?");
            ps.setInt(1, (int) (maxPrice(id)));
            ps.setString(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void getProductImport() {
        DBConnect dbConnect = DBConnect.getInstance();
        long priceMax = 0;
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product from  importproducts");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                priceMax = rs.getLong(1);
            }
        } catch (SQLException e) {
        }
    }

    public static long totalQuantity(int id) {
        DBConnect dbConnect = DBConnect.getInstance();
        long total = 0;
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select sum(quantity) from  detail_products where id_product= ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total += rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return total;
    }

    public static long totalPriceImport(int id) {
        long result = 0;
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select sum(price*quantity) from  importproducts where id_product=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getLong(1);
            }
        } catch (SQLException e) {
        }
        return result;
    }

    public static long totalQuantityImport(int id) {
        DBConnect dbConnect = DBConnect.getInstance();
        long total = 0;
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select sum(quantity) from  importproducts where id_product= ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total += rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return total;
    }

    public static List<ImportProduct> getProductInImport() {
        List<ImportProduct> list = new ArrayList<ImportProduct>();
        ImportProduct im = new ImportProduct();
        DBConnect dbConnect = DBConnect.getInstance();
        long priceMax = 0;
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select distinct i.id_product, p.name from  importproducts i join products p on i.id_product = p.id_product");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                im = new ImportProduct(rs.getInt("id_product"), rs.getString("name"), totalQuantityImport(rs.getInt("id_product")), totalPriceImport(rs.getInt("id_product")), getimgFirst(rs.getInt("id_product")));
                list.add(im);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public static String getimgFirst(int id) throws SQLException {
        String img = "";
        DBConnect dbConnect = DBConnect.getInstance();
        PreparedStatement prs = dbConnect.getConnection().prepareStatement("select link_image from images where id_product=? and allow=?");
        prs.setInt(1, id);
        prs.setString(2, "1");
        ResultSet rs = prs.executeQuery();
        if (rs.next()) {
            img = rs.getString("link_image");
        }
        return img;
    }

    public static List<ImportProduct> getDetailImport(int id) {
        List<ImportProduct> list = new ArrayList<ImportProduct>();

        ImportProduct im = new ImportProduct();
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select size, color, quantity, price, date from importproducts where id_product=? ");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                im = new ImportProduct(rs.getString("size"), rs.getString("color"), rs.getLong("price"), rs.getLong("quantity"), rs.getDate("date"));
                list.add(im);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public static List<Product> checkInventory() {
        List<Product> list = new ArrayList<Product>();
        DBConnect dbConnect = DBConnect.getInstance();
        Product p = new Product();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product, name from products");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product(rs.getInt("id_product"), rs.getString("name"), totalQuantityImport(rs.getInt("id_product")) - amountSold(rs.getInt("id_product")));
                p.setImg(getimg(rs.getInt("id_product")));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public static long amountSold(int id) {
        DBConnect dbConnect = DBConnect.getInstance();
        long count = 0;
        try {
            PreparedStatement ps = dbConnect.getConnection().
                    prepareStatement("select  SUM(db.quantitySold) sum from detail_products dp join detail_bills db on dp.id_dp = db.id_dp where dp.id_product=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("sum");
            }
        } catch (SQLException e) {
        }
        return count;
    }

    public static long amountSoldDetail(int id_product, String size, String color) {
        DBConnect dbConnect = DBConnect.getInstance();
        long count = 0;
        try {
            PreparedStatement ps = dbConnect.getConnection().
                    prepareStatement("select  SUM(db.quantitySold) sum from detail_products dp join detail_bills db on dp.id_dp = db.id_dp where dp.id_product=? and dp.size=? and dp.color=?");
            ps.setInt(1, id_product);
            ps.setString(2, size);
            ps.setString(3, color);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("sum");
            }
        } catch (SQLException e) {
        }
        return count;
    }

    public static long amountImportDetail(int id_product, String size, String color) {
        DBConnect dbConnect = DBConnect.getInstance();
        long count = 0;
        try {
            PreparedStatement ps = dbConnect.getConnection().
                    prepareStatement("select  SUM(quantity) sum from importproducts  where id_product=? and size=? and color=?");
            ps.setInt(1, id_product);
            ps.setString(2, size);
            ps.setString(3, color);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("sum");
            }
        } catch (SQLException e) {
        }
        return count;
    }

    public static List<ImportProduct> listInventoryDetail(String id_product) {
        List<ImportProduct> list = new ArrayList<ImportProduct>();
        DBConnect dbConnect = DBConnect.getInstance();
        ImportProduct i = new ImportProduct();
        try {
            PreparedStatement ps = dbConnect.getConnection().
                    prepareStatement("select distinct id_product, size, color from importproducts where id_product=? ");
            ps.setString(1, id_product);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                i = new ImportProduct(rs.getString("size"), rs.getString("color"), amountImportDetail(Integer.parseInt(rs.getString("id_product")), rs.getString("size"), rs.getString("color"))
                        - amountSoldDetail(Integer.parseInt(rs.getString("id_product")), rs.getString("size"), rs.getString("color")));
                list.add(i);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public static int getTotalProduct(){
        String query = "select count(id_product) from products";
        try{
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return 0;
    }

    public static List<Product> onePageProduct(int index){
        List<Product> list = new ArrayList<>();
        String  query = "select id_product from products  limit ?, 24";
        try{
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement(query);
            ps.setInt(1, (index-1)*24);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                list.add(getProduct(rs.getInt("id_product")));
            }
        }catch (SQLException e){
        }
        return list;
    }

    public static List<Product> onePageSalesRate(int index){
        List<Product> list = new ArrayList<Product>();
        DBConnect dbConnect = DBConnect.getInstance();
        Product p = new Product();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product, name from products limit ?, 10");
            ps.setInt(1, (index - 1)*10);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                p.setId(rs.getInt("id_product"));
                p.setName(rs.getString("name"));
                if (totalQuantityImport(rs.getInt("id_product")) == 0) {
                    p.setRate(totalQuantityImport(rs.getInt("id_product")));
                } else {
                    p.setRate(((double) amountSold(rs.getInt("id_product")) / (double) totalQuantityImport(rs.getInt("id_product"))) * 100);
                }
                p.setImg(getimg(rs.getInt("id_product")));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public static List<Product> onePageReturn(int index){
        List<Product> list = new ArrayList<Product>();
        DBConnect dbConnect = DBConnect.getInstance();
        Product p = new Product();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product, name from products limit ?, 10");
            ps.setInt(1, (index-1)*10);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                p.setId(rs.getInt("id_product"));
                p.setName(rs.getString("name"));
                if (paidRate(rs.getInt("id_product")) == 0) {
                    p.setRate(0);
                } else {
                    p.setRate(((double) paidRate(rs.getInt("id_product")) / (double) amountSold(rs.getInt("id_product"))) * 100);
                }
                p.setImg(getimg(rs.getInt("id_product")));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public static List<Product> onePageToBeImport(int index){
        List<Product> list = new ArrayList<Product>();
        Product product = new Product();
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select sl.id_product, sl.s from  (select distinct  p.id_product,sum(dp.quantity) s  from products p join detail_products dp on dp.id_product = p.id_product group by p.id_product ) sl where sl.s<=5 limit ?8");
            ps.setInt(1, (index-1)*8);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                product = getProduct(rs.getInt("id_product"));
                product.setRate(((double) amountSold(rs.getInt("id_product")) / (double) totalQuantityImport(rs.getInt("id_product"))) * 100);
                if(product.getRate()>=60){

                    product.setImg(getimg(rs.getInt("id_product")));
                    product.setQuantity(rs.getInt("s"));
                    list.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<Product> onePageIsNotForSale(int index){
        List<Product> list = new ArrayList<Product>();
        DBConnect dbConnect = DBConnect.getInstance();
        Product p = new Product();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product, name from products limit ?,10");
            ps.setInt(1, (index-1)*10);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                p.setId(rs.getInt("id_product"));
                p.setName(rs.getString("name"));
                p.setLatestSale(latestSale(rs.getInt("id_product")));
                p.setImg(getimg(rs.getInt("id_product")));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public static int getTotalBill(){
        String query = "select count(id) from bills";
        try{
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return 0;
    }

    public static List<Bill> onePageBill(int index){
        List<Bill> list = new ArrayList<>();
        String  query = "select id from bills  limit ?, 10";
        try{
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement(query);
            ps.setInt(1, (index-1)*10);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                list.add(getBill(rs.getInt("id")));
            }
        }catch (SQLException e){
        }
        return list;
    }

    public static int getTotalCost(int id_bill){
        String query = "select total_cost from bills where id= ?";
        try{
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement(query);
            ps.setInt(1, id_bill);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return 0;
    }

    public static int getTotalCustomer(){
        String query = "select count(id_customer) from customers";
        try{
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return 0;
    }

    public static List<Customer> onePageCustomer(int index){
        List<Customer> list = new ArrayList<>();
        String  query = "select id_customer from customers  limit ?, 10";
        try{
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement(query);
            ps.setInt(1, (index-1)*10);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                list.add(getCustomer(rs.getInt("id_customer")));
            }
        }catch (SQLException e){
        }
        return list;
    }

    public static int getTotalImport(){
        String query = "select count(distinct i.id_product) from  importproducts i join products p on i.id_product = p.id_product";
        try{
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return 0;
    }

    public static List<ImportProduct> onePageImport(int index){
        List<ImportProduct> list = new ArrayList<>();
        ImportProduct im = new ImportProduct();
        String  query = "select distinct i.id_product, p.name from  importproducts i join products p on i.id_product = p.id_product limit ?, 10";
        try{
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement(query);
            ps.setInt(1, (index-1)*10);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                im = new ImportProduct(rs.getInt("id_product"), rs.getString("name"), totalQuantityImport(rs.getInt("id_product")), totalPriceImport(rs.getInt("id_product")), getimgFirst(rs.getInt("id_product")));
                list.add(im);
            }
        }catch (SQLException e){
        }
        return list;
    }

    public static int getTotalInventory(){
        String query = "select count(distinct id_product) from products";
        try{
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return 0;
    }

    public static List<Product> onePageInventory(int index){
        List<Product> list = new ArrayList<>();
        Product p = new Product();
        String  query = "select id_product, name from products  limit ?, 10";
        try{
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement(query);
            ps.setInt(1, (index-1)*10);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                p = new Product(rs.getInt("id_product"), rs.getString("name"), totalQuantityImport(rs.getInt("id_product")) - amountSold(rs.getInt("id_product")));
                p.setImg(getimg(rs.getInt("id_product")));
                list.add(p);
            }
        }catch (SQLException e){
        }
        return list;
    }


    public static List<Product> getRecords(int start, int total) {
        List<Product> list = new ArrayList<Product>();
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement(
                    "select id_product from products limit " + (start - 1) + "," + total);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(getProduct(rs.getInt("id_product")));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static List<Product> getRecords(int start, int total, String text) {
        List<Product> list = new ArrayList<Product>();
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement(
                    "select id_product from products  where name like '%" + text + "%' limit ?,?");
            ps.setInt(1, start - 1);
            ps.setInt(2, total);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(getProduct(rs.getInt("id_product")));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static int quantityFindProduct(String para) {
        int result = 0;
        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
        try {
            ResultSet rs = statement.executeQuery("select  count(id_product) count from products where name like '%" + para + "%'");
            while (rs.next()) {
                result += rs.getInt("count");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    public static List<Product> salesRate() {
        List<Product> list = new ArrayList<Product>();
        DBConnect dbConnect = DBConnect.getInstance();
        Product p = new Product();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product, name from products");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                p.setId(rs.getInt("id_product"));
                p.setName(rs.getString("name"));
                if (totalQuantityImport(rs.getInt("id_product")) == 0) {
                    p.setRate(totalQuantityImport(rs.getInt("id_product")));
                } else {
                    p.setRate(((double) amountSold(rs.getInt("id_product")) / (double) totalQuantityImport(rs.getInt("id_product"))) * 100);
                }
                p.setImg(getimg(rs.getInt("id_product")));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public static int paidRate(int id) {
        DBConnect dbConnect = DBConnect.getInstance();
        int count = 0;
        try {
            PreparedStatement ps = dbConnect.getConnection().
                    prepareStatement("select  SUM(db.quantitySold) sum from detail_products dp join detail_bills db on dp.id_dp = db.id_dp join bills b on b.id= db.id_bill where dp.id_product=? and b.status=?");
            ps.setInt(1, id);
            ps.setString(2, "Đã hủy");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("sum");
            }
        } catch (SQLException e) {
        }
        return count;
    }

    public static List<Product> productReturn() {
        List<Product> list = new ArrayList<Product>();
        DBConnect dbConnect = DBConnect.getInstance();
        Product p = new Product();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product, name from products");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                p.setId(rs.getInt("id_product"));
                p.setName(rs.getString("name"));
                if (paidRate(rs.getInt("id_product")) == 0) {
                    p.setRate(0);
                } else {
                    p.setRate(((double) paidRate(rs.getInt("id_product")) / (double) amountSold(rs.getInt("id_product"))) * 100);
                }
                p.setImg(getimg(rs.getInt("id_product")));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public static List<Product> productIsNotForSale() {
        List<Product> list = new ArrayList<Product>();
        DBConnect dbConnect = DBConnect.getInstance();
        Product p = new Product();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product, name from products");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                p.setId(rs.getInt("id_product"));
                p.setName(rs.getString("name"));
                p.setLatestSale(latestSale(rs.getInt("id_product")));
                p.setImg(getimg(rs.getInt("id_product")));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public static String latestSale(int id) {
        String date = "";
        DBConnect dbConnect = DBConnect.getInstance();

        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select MAX(b.date) d from bills b join detail_bills db on db.id_bill = b.id join detail_products dp on dp.id_dp = db.id_dp where dp.id_product = ? and b.status = ?");
            ps.setInt(1, id);
            ps.setString(2, "Đã nhận");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                date += rs.getDate("d");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return date;
    }

    public static long[] chartLine(int year) {
        long[] result = new long[12];
        LocalDate localDate = LocalDate.now();
        long res = 0;
        for (int i = 1; i < 13; i++) {
//            result[i-1] = getRevenueByMonthYear(i, localDate.getYear());
            result[i-1] = getRevenueByMonthYear(i, year);
        }
        return result;
    }

    public static List<Product> topThreeByYear(String year) {
        List<Product> list = new ArrayList<Product>();
        Product product = new Product();
        DBConnect dbConnect = DBConnect.getInstance();
        int count = 0;
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select distinct  dp.id_product,sum(db.quantitySold) c from bills b join detail_bills db on db.id_bill = b.id join detail_products dp on dp.id_dp = db.id_dp where year(b.date) = ? and b.status=? group by dp.id_product order by c DESC");
            ps.setString(1, year);
            ps.setString(2, "Đã nhận");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if (count == 3) break;
                product = getProduct(rs.getInt("id_product"));
                product.setQuantity(rs.getInt("c"));
                list.add(product);
                count++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<Product> topThreeByMonth(String month, String year) {
        List<Product> list = new ArrayList<Product>();
        Product product = new Product();
        DBConnect dbConnect = DBConnect.getInstance();
        int count = 0;
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select distinct  dp.id_product,sum(db.quantitySold) c from bills b join detail_bills db on db.id_bill = b.id join detail_products dp on dp.id_dp = db.id_dp where month(b.date) = ? and year(b.date)=? and b.status=? group by dp.id_product order by c DESC");

            ps.setString(1, month);
            ps.setString(2, year);
            ps.setString(3, "Đã nhận");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if (count == 3) break;
                product = getProduct(rs.getInt("id_product"));
                System.out.println(rs.getInt(1) + " " + rs.getInt("c"));
                product.setQuantity(rs.getInt("c"));
                list.add(product);
                count++;
            }
            count=0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<Product> productsToBeImported() {
        List<Product> list = new ArrayList<Product>();
        Product product = new Product();
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select sl.id_product, sl.s from  (select distinct  p.id_product,sum(dp.quantity) s  from products p join detail_products dp on dp.id_product = p.id_product group by p.id_product ) sl where sl.s<=5");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                product = getProduct(rs.getInt("id_product"));
                product.setRate(((double) amountSold(rs.getInt("id_product")) / (double) totalQuantityImport(rs.getInt("id_product"))) * 100);
                if(product.getRate()>=60){

                    product.setImg(getimg(rs.getInt("id_product")));
                    product.setQuantity(rs.getInt("s"));
                    list.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public static long getRevenueByMonthYear(int month, int year){
        long total = 0;
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select sum(total_cost - fee) s from bills where status=? and month(date)=? and year(date) = ?");
            ps.setString(1, "Đã nhận");
            ps.setString(2, String.valueOf(month));
            ps.setString(3, String.valueOf(year));
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            total = rs.getInt("s");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }
    public static List<Product> onePageFindProduct(int index, List<Product> listPro){
        List<Product> list = new ArrayList<>();
        int start = (index-1)*10;
        int end = Math.min(start+10,listPro.size()-1);
        for(int i=start;i<end+1;i++){
            list.add(listPro.get(i));
        }
        return list;
    }
    public static List<Bill> onePageFindBill(int index, List<Bill> listBill){
        List<Bill> list = new ArrayList<>();
        int start = (index-1)*10;
        int end = Math.min(start+10,listBill.size()-1);
        for(int i=start;i<end+1;i++){
            list.add(listBill.get(i));
        }
        return list;
    }
    public static List<ImportProduct> findProductImport(String para){
        List<ImportProduct> list = new ArrayList<>();
        ImportProduct im = new ImportProduct();
        String  query = "select distinct i.id_product, p.name from  importproducts i join products p on i.id_product = p.id_product where p.name like '%" + para + "%'";
        try{
            ResultSet rs = DBConnect.getInstance().get().executeQuery(query);
            while (rs.next()){
                im = new ImportProduct(rs.getInt("id_product"), rs.getString("name"), totalQuantityImport(rs.getInt("id_product")), totalPriceImport(rs.getInt("id_product")), getimgFirst(rs.getInt("id_product")));
                list.add(im);
            }
        }catch (SQLException e){
        }
        return list;
    }
    public static List<Product> findProductReturn(int index,String para){
        List<Product> list = new ArrayList<Product>();
        List<Product> lists = new ArrayList<Product>();
        DBConnect dbConnect = DBConnect.getInstance();
        Product p = new Product();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product, name from products where LOWER(name) like LOWER(?)");
            ps.setString(1, "%" + para + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                p.setId(rs.getInt("id_product"));
                p.setName(rs.getString("name"));
                if (paidRate(rs.getInt("id_product")) == 0) {
                    p.setRate(0);
                } else {
                    p.setRate(((double) paidRate(rs.getInt("id_product")) / (double) amountSold(rs.getInt("id_product"))) * 100);
                }
                p.setImg(getimg(rs.getInt("id_product")));
                lists.add(p);
            }
            int begin = (index-1)*10;
            int end = Math.min(begin+10,lists.size());
            for(int i=begin;i<end;i++){
                list.add(lists.get(i));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    public static List<Product> findProductSalesRate(int index, String para){
        List<Product> lists = new ArrayList<Product>();
        List<Product> list = new ArrayList<Product>();
        DBConnect dbConnect = DBConnect.getInstance();
        Product p = new Product();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product, name from products where LOWER(name) like LOWER(?)");
            ps.setString(1, "%" + para + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                p.setId(rs.getInt("id_product"));
                p.setName(rs.getString("name"));
                if (totalQuantityImport(rs.getInt("id_product")) == 0) {
                    p.setRate(totalQuantityImport(rs.getInt("id_product")));
                } else {
                    p.setRate(((double) amountSold(rs.getInt("id_product")) / (double) totalQuantityImport(rs.getInt("id_product"))) * 100);
                }
                p.setImg(getimg(rs.getInt("id_product")));
                lists.add(p);
            }
            int begin = (index-1)*10;
            int end = Math.min(begin+10,lists.size());
            for(int i=begin;i<end;i++){
                list.add(lists.get(i));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    public static List<Product> findProductIsNotForSale(int index, String para){
        List<Product> lists = new ArrayList<Product>();
        List<Product> list = new ArrayList<Product>();
        DBConnect dbConnect = DBConnect.getInstance();
        Product p = new Product();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_product, name from products where LOWER(name) like LOWER(?)");
            ps.setString(1,"%" + para + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Product();
                p.setId(rs.getInt("id_product"));
                p.setName(rs.getString("name"));
                p.setLatestSale(latestSale(rs.getInt("id_product")));
                p.setImg(getimg(rs.getInt("id_product")));
                lists.add(p);
            }
            int begin = (index-1)*10;
            int end = Math.min(begin+10,lists.size());
            for(int i=begin;i<end;i++){
                list.add(lists.get(i));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public static List<Product> onePageDisplayProduct(int index, List<Product> listPro){
        List<Product> list = new ArrayList<>();
        int start = (index-1)*10;
        int end = Math.min(start+24,listPro.size()-1);
        for(int i=start;i<end+1;i++){
            list.add(listPro.get(i));
        }
        return list;
    }
    public static int getTotalImportProduct(){
        try{
            int count = 0;
            ResultSet rs = DBConnect.getInstance().get().executeQuery("select id from importproducts");
            while (rs.next()){
                count++;
            }
            return count;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return 0;
    }
    public static void removeQuantity(int iddp, long quantity){
        try {
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("UPDATE detail_products set quantity = quantity - ? where id_dp =?");
            ps.setLong(1, quantity);
            ps.setInt(2, iddp);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void removesQuantity(List<BillDetail> bill){
        for(BillDetail b : bill){
            removeQuantity(b.getId_dp(),b.getQuantitySold());
        }
    }
    public static void main(String[] args) throws SQLException {
        }
}

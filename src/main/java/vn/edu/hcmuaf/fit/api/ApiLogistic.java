package vn.edu.hcmuaf.fit.api;

import com.jayway.jsonpath.JsonPath;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import vn.edu.hcmuaf.fit.service.TransportService;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.*;

public class ApiLogistic {
    public static boolean Register() {
        try {
            // Khởi tạo đối tượng HttpClient và HttpPost
            HttpClient client = HttpClientBuilder.create().build();
//            HttpClient httpClient = HttpClients.createDefault();
            HttpPost post = new HttpPost("http://140.238.54.136/api/auth/register");

            // Thêm thông tin vào body của HttpPost
            List<NameValuePair> params = new ArrayList<NameValuePair>();
            params.add(new BasicNameValuePair("name", "quoc12345678"));
            params.add(new BasicNameValuePair("email", "trandangquoc271202@gmail.com"));
            params.add(new BasicNameValuePair("password", "12345678"));
            params.add(new BasicNameValuePair("password_confirmation", "12345678"));
            post.setEntity(new UrlEncodedFormEntity(params));

            // Thực hiện request HTTP POST
            HttpResponse apiResponse = client.execute(post);

            // Xử lý response
            int statusCode = apiResponse.getStatusLine().getStatusCode();
            if (statusCode == 200) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static String getTokenLogin() {
        try {
            HttpClient httpClient = HttpClients.createDefault();
            HttpPost httpPost = new HttpPost("http://140.238.54.136/api/auth/login");

            List<NameValuePair> params = new ArrayList<>();
            params.add(new BasicNameValuePair("email", "trandangquoc271202@gmail.com"));
            params.add(new BasicNameValuePair("password", "12345678"));

            httpPost.setEntity(new UrlEncodedFormEntity(params));
            httpPost.setHeader(HttpHeaders.CONTENT_TYPE, "application/x-www-form-urlencoded");

            HttpEntity httpEntity = httpClient.execute(httpPost).getEntity();
            String response = EntityUtils.toString(httpEntity);
            String token = response.replace("{\"access_token\":\"", "");
            String tokenResponse = token;
            int startIndex = tokenResponse.indexOf("token\":") + 1;
            int endIndex = tokenResponse.indexOf(",\"token_type\"") - 1;
            String token1 = tokenResponse.substring(startIndex, endIndex);
            return token1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static List<Address> getAllProvince() {
        List<Address> list = new ArrayList<Address>();
        Address address = new Address();
        try {
            // Tạo HTTP client
            CloseableHttpClient client = HttpClients.createDefault();

            // Tạo HTTP request có header Authorization chứa token
            String token = getTokenLogin();
            HttpUriRequest request = new HttpGet("http://140.238.54.136/api/province");
            request.addHeader("Authorization", "Bearer " + token);

            // Gửi HTTP request và nhận HTTP response
            HttpResponse response = client.execute(request);

            // Lấy ra HTTP response body dưới dạng String
            HttpEntity entity = response.getEntity();
            String responseBody = EntityUtils.toString(entity);

            // Chuyển đổi HTTP response body thành một object JSON
            List<String> provinceNames = JsonPath.read(responseBody, "$.original.data[*].ProvinceName");
            List<Integer> provinceID = JsonPath.read(responseBody, "$.original.data[*].ProvinceID");
            for (int i = 0; i < provinceID.size(); i++) {
                address = new Address(provinceID.get(i), provinceNames.get(i));
                list.add(address);
            }
            client.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<Address> getAllDistrict(int id) {
        List<Address> list = new ArrayList<Address>();
        Address address = new Address();
        try {
            // Tạo HTTP client
            CloseableHttpClient client = HttpClients.createDefault();

            // Tạo HTTP request có header Authorization chứa token
            String token = getTokenLogin();
            String urlString = "http://140.238.54.136/api/district?provinceID=" + id;
            HttpUriRequest request = new HttpGet(urlString);
            request.addHeader("Authorization", "Bearer " + token);
//            request.addHeader("Parameter", "provinceID:" + id);
            // Gửi HTTP request và nhận HTTP response
            HttpResponse response = client.execute(request);

            // Lấy ra HTTP response body dưới dạng String
            HttpEntity entity = response.getEntity();
            String responseBody = EntityUtils.toString(entity);
//            System.out.println(responseBody);
            List<String> districtNames = JsonPath.read(responseBody, "$.original.data[*].DistrictName");
            List<Integer> provinceIDs = JsonPath.read(responseBody, "$.original.data[*].ProvinceID");
            List<Integer> districtIDs = JsonPath.read(responseBody, "$.original.data[*].DistrictID");
            for (int i = 0; i < provinceIDs.size(); i++) {
                address = new Address(provinceIDs.get(i), districtIDs.get(i), districtNames.get(i));
                list.add(address);
            }
            client.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<Address> getAllWard(int id) {
        List<Address> list = new ArrayList<Address>();
        Address address = new Address();
        try {
            // Tạo HTTP client
            CloseableHttpClient client = HttpClients.createDefault();

            // Tạo HTTP request có header Authorization chứa token
            String token = getTokenLogin();
            String urlString = "http://140.238.54.136/api/ward?districtID=" + id;
            HttpUriRequest request = new HttpGet(urlString);
            request.addHeader("Authorization", "Bearer " + token);
//            request.addHeader("Parameter", "provinceID:" + id);
            // Gửi HTTP request và nhận HTTP response
            HttpResponse response = client.execute(request);

            // Lấy ra HTTP response body dưới dạng String
            HttpEntity entity = response.getEntity();
            String responseBody = EntityUtils.toString(entity);
//            System.out.println(responseBody);
            List<String> wardNames = JsonPath.read(responseBody, "$.original.data[*].WardName");
            List<String> wardCodes = JsonPath.read(responseBody, "$.original.data[*].WardCode");
            List<Integer> districtIDs = JsonPath.read(responseBody, "$.original.data[*].DistrictID");
            for (int i = 0; i < wardNames.size(); i++) {
                address = new Address(wardCodes.get(i), districtIDs.get(i), wardNames.get(i));
                list.add(address);
            }
            client.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<String> getTransferTime(int height, int lenght, int width, int weight, int from_district_id, int from_ward_id, int to_district_id, int to_ward_id) {
        String apiUrl = "http://140.238.54.136/api/leadTime";
        String authToken = getTokenLogin();
        StringBuilder response = null;
//        String result="";
        List<String> result = new ArrayList<String>();
        try {
            // Create the parameters for the request
            Map<String, String> params = new HashMap<>();
            params.put("height", height + "");
            params.put("length", lenght + "");
            params.put("width", width + "");
            params.put("weight", weight + "");
            params.put("from_district_id", from_district_id + "");
            params.put("from_ward_id", from_ward_id + "");
            params.put("to_district_id", to_district_id + "");
            params.put("to_ward_id", to_ward_id + "");

            // Encode the parameters and build the query string
            StringBuilder postData = new StringBuilder();
            for (Map.Entry<String, String> param : params.entrySet()) {
                if (postData.length() != 0) postData.append('&');
                postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
                postData.append('=');
                postData.append(URLEncoder.encode(param.getValue(), "UTF-8"));
            }

            // Create a URL object and open an HTTP connection
            URL url = new URL(apiUrl);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();

            // Set the HTTP request method, headers, and parameters
            con.setRequestMethod("POST");
            con.setRequestProperty("Authorization", "Bearer " + authToken);
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            con.setRequestProperty("Content-Length", Integer.toString(postData.toString().getBytes().length));
            con.setDoOutput(true);
            con.getOutputStream().write(postData.toString().getBytes(StandardCharsets.UTF_8));

            // Send the request and read the response
            int status = con.getResponseCode();
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            response = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            List<String> formattedDate = JsonPath.read(response.toString(), "$.data.[*].formattedDate");
            result.add(formattedDate.get(0));
            in.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static List<Integer> getCalculateFee(int height, int lenght, int width, int weight, int from_district_id, int from_ward_id, int to_district_id, int to_ward_id) {
        String apiUrl = "http://140.238.54.136/api/calculateFee";
        String authToken = getTokenLogin();
        StringBuilder response = null;
        List<Integer> result = new ArrayList<Integer>();
        try {
            // Create the parameters for the request
            Map<String, String> params = new HashMap<>();
            params.put("height", height + "");
            params.put("length", lenght + "");
            params.put("width", width + "");
            params.put("weight", weight + "");
            params.put("from_district_id", from_district_id + "");
            params.put("from_ward_id", from_ward_id + "");
            params.put("to_district_id", to_district_id + "");
            params.put("to_ward_id", to_ward_id + "");

            // Encode the parameters and build the query string
            StringBuilder postData = new StringBuilder();
            for (Map.Entry<String, String> param : params.entrySet()) {
                if (postData.length() != 0) postData.append('&');
                postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
                postData.append('=');
                postData.append(URLEncoder.encode(param.getValue(), "UTF-8"));
            }

            // Create a URL object and open an HTTP connection
            URL url = new URL(apiUrl);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();

            // Set the HTTP request method, headers, and parameters
            con.setRequestMethod("POST");
            con.setRequestProperty("Authorization", "Bearer " + authToken);
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            con.setRequestProperty("Content-Length", Integer.toString(postData.toString().getBytes().length));
            con.setDoOutput(true);
            con.getOutputStream().write(postData.toString().getBytes(StandardCharsets.UTF_8));

            // Send the request and read the response
            int status = con.getResponseCode();
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            response = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            List<Integer> formattedDate = JsonPath.read(response.toString(), "$.data.[*].service_fee");
            result.add(formattedDate.get(0));
            in.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static Transport registerTransport(int height, int lenght, int width, int weight, int from_district_id, int from_ward_id, int to_district_id, int to_ward_id) {
        String apiUrl = "http://140.238.54.136/api/registerTransport";
        String authToken =getTokenLogin();
        ArrayList<Transport> result = new ArrayList<>();
        Transport transport = new Transport();
        try {

            Map<String, String> params = new HashMap<>();
            params.put("height", height + "");
            params.put("length", lenght + "");
            params.put("width", width + "");
            params.put("weight", weight + "");
            params.put("from_district_id", from_district_id + "");
            params.put("from_ward_id", from_ward_id + "");
            params.put("to_district_id", to_district_id + "");
            params.put("to_ward_id", to_ward_id + "");

            // Encode the parameters and build the query string
            StringBuilder postData = new StringBuilder();
            for (Map.Entry<String, String> param : params.entrySet()) {
                if (postData.length() != 0) postData.append('&');
                postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
                postData.append('=');
                postData.append(URLEncoder.encode(param.getValue(), "UTF-8"));
            }

            // Create a URL object and open an HTTP connection
            URL url = new URL(apiUrl);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();

            // Set the HTTP request method, headers, and parameters
            con.setRequestMethod("POST");
            con.setRequestProperty("Authorization", "Bearer " + authToken);
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            con.setRequestProperty("Content-Length", Integer.toString(postData.toString().getBytes().length));
            con.setDoOutput(true);
            con.getOutputStream().write(postData.toString().getBytes(StandardCharsets.UTF_8));

            // Send the request and read the response
            int status = con.getResponseCode();
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            transport = new Transport();
            transport.setEmail(JsonPath.read(response.toString(), "$.Transport.email"));
            transport.setFromDistrictID(JsonPath.read(response.toString(), "$.Transport.fromDistrictID"));
            transport.setFromWardID(JsonPath.read(response.toString(), "$.Transport.fromWardID"));
            transport.setToDistrictID(JsonPath.read(response.toString(), "$.Transport.toDistrictID"));
            transport.setToWardID(JsonPath.read(response.toString(), "$.Transport.toWardID"));
            transport.setHeight(JsonPath.read(response.toString(), "$.Transport.height"));
            transport.setLength(JsonPath.read(response.toString(), "$.Transport.length"));
            transport.setWidth(JsonPath.read(response.toString(), "$.Transport.width"));
            transport.setWeight(JsonPath.read(response.toString(), "$.Transport.weight"));
            transport.setFee(JsonPath.read(response.toString(), "$.Transport.fee").toString());
            transport.setLeadTime(JsonPath.read(response.toString(), "$.Transport.leadTime").toString());
            transport.setActive(JsonPath.read(response.toString(), "$.Transport.active").toString());
            transport.setId(JsonPath.read(response.toString(), "$.Transport.id").toString());
            transport.setUpdated_at(JsonPath.read(response.toString(), "$.Transport.updated_at").toString());
            transport.setCreated_at(JsonPath.read(response.toString(), "$.Transport.created_at").toString());
            in.close();

            System.out.println(response);

        } catch (Exception e) {
            // TODO: handle exception
        }
        return transport;

    }

    public static void getInfoTransport(String id) {
        String apiUrl = "http://140.238.54.136/api/auth/getInfoTransport";
        String authToken =getTokenLogin();
        try {
            Map<String, String> params = new HashMap<>();
            params.put("id", id);
            // Encode the parameters and build the query string
            StringBuilder postData = new StringBuilder();
            for (Map.Entry<String, String> param : params.entrySet()) {
                if (postData.length() != 0) postData.append('&');
                postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
                postData.append('=');
                postData.append(URLEncoder.encode(param.getValue(), "UTF-8"));
            }

            // Create a URL object and open an HTTP connection
            URL url = new URL(apiUrl);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();

            // Set the HTTP request method, headers, and parameters
            con.setRequestMethod("POST");
            con.setRequestProperty("Authorization", "Bearer " + authToken);
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            con.setRequestProperty("Content-Length", Integer.toString(postData.toString().getBytes().length));
            con.setDoOutput(true);
            con.getOutputStream().write(postData.toString().getBytes(StandardCharsets.UTF_8));

            // Send the request and read the response
            int status = con.getResponseCode();
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
//            transport = new Transport();
//            transport.setEmail(JsonPath.read(response.toString(), "$.Transport.email"));
//            transport.setFromDistrictID(JsonPath.read(response.toString(), "$.Transport.fromDistrictID"));
//            transport.setFromWardID(JsonPath.read(response.toString(), "$.Transport.fromWardID"));
//            transport.setToDistrictID(JsonPath.read(response.toString(), "$.Transport.toDistrictID"));
//            transport.setToWardID(JsonPath.read(response.toString(), "$.Transport.toWardID"));
//            transport.setHeight(JsonPath.read(response.toString(), "$.Transport.height"));
//            transport.setLength(JsonPath.read(response.toString(), "$.Transport.length"));
//            transport.setWidth(JsonPath.read(response.toString(), "$.Transport.width"));
//            transport.setWeight(JsonPath.read(response.toString(), "$.Transport.weight"));
//            transport.setFee(JsonPath.read(response.toString(), "$.Transport.fee").toString());
//            transport.setLeadTime(JsonPath.read(response.toString(), "$.Transport.leadTime").toString());
//            transport.setActive(JsonPath.read(response.toString(), "$.Transport.active").toString());
//            transport.setId(JsonPath.read(response.toString(), "$.Transport.id").toString());
//            transport.setUpdated_at(JsonPath.read(response.toString(), "$.Transport.updated_at").toString());
//            transport.setCreated_at(JsonPath.read(response.toString(), "$.Transport.created_at").toString());
            in.close();

//            System.out.println("response");

        } catch (Exception e) {
           e.printStackTrace();
        }
    }
    public static String parseDate(String dateString){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss'Z'").withZone(ZoneId.of("UTC"));
        LocalDateTime dateTime = LocalDateTime.parse(dateString, formatter);
        String newPattern = "dd-MM-yyyy";
        DateTimeFormatter newFormatter = DateTimeFormatter.ofPattern(newPattern);
        String newDateString = dateTime.format(newFormatter);
        return newDateString;
    }
    public static String formatDateYMD(String date){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss'Z'").withZone(ZoneId.of("UTC"));
        LocalDateTime dateTime = LocalDateTime.parse(date, formatter);
        String newPattern = "yyyy-MM-dd";
        DateTimeFormatter newFormatter = DateTimeFormatter.ofPattern(newPattern);
        String newDateString = dateTime.format(newFormatter);
        return newDateString;
    }
    public static String getDateNow(){
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");

        String formattedDate = currentDate.format(formatter);
        return formattedDate;
    }
    public static String getAddress(int province,int district, String ward){
        String result = "";
        for(Address a : getAllWard(district)){
            if(a.getWardCode().equals(ward)){
                result+= a.getWardName()+" - ";
                break;
            }
        }
        for(Address a : getAllDistrict(province)){
            if(a.getDistrictID()==district){
                result+= a.getDistrictName()+" - ";
                break;
            }
        }
        for(Address a : getAllProvince()){
            if(a.getProvinceID()==province){
                result+= a.getProvinceName();
                break;
            }
        }
        return result;
    }
    public static String getAddressCurrent(){
        TransportService transportService =  TransportService.getInstance();
        int district = transportService.getDistrict();
        String ward = String.valueOf(transportService.getWard());
        int province = transportService.getProvince();
        String result = "";
        for(Address a : getAllWard(district)){
            if(a.getWardCode().equals(ward)){
                result+= a.getWardName()+" - ";
                break;
            }
        }
        for(Address a : getAllDistrict(province)){
            if(a.getDistrictID()==district){
                result+= a.getDistrictName()+" - ";
                break;
            }
        }
        for(Address a : getAllProvince()){
            if(a.getProvinceID()==province){
                result+= a.getProvinceName();
                break;
            }
        }
        return result;
    }
    public static void main(String[] args) {
      System.out.println(  getAddressCurrent());
    }
}

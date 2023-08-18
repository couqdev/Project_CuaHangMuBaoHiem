package vn.edu.hcmuaf.fit.google;

import java.io.IOException;
import java.text.Normalizer;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.ClientProtocolException;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import vn.edu.hcmuaf.fit.model.UserGoogle;

public class GoogleUtils {

    // Get token from Google
    public static String getToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri",Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    // Get user information from Google
    public static UserGoogle getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogle googlePojo = new Gson().fromJson(response, UserGoogle.class);
        return googlePojo;
    }
}

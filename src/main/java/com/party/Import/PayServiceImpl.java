package com.party.Import;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.text.ParseException;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.siot.IamportRestClient.IamportClient;

@Service("payService")
public class PayServiceImpl implements PayService {

   @Value("#")
   private String impKey;

   @Value("#")
   private String impSecret;

   public String getToken() throws Exception {

      HttpsURLConnection conn = null;
      URL url = new URL("https://api.iamport.kr/users/getToken");

      conn = (HttpsURLConnection) url.openConnection();

      conn.setRequestMethod("POST");
      conn.setRequestProperty("Content-type", "application/json");
      conn.setRequestProperty("Accept", "application/json");
      conn.setDoOutput(true);
      JsonObject json = new JsonObject();

      json.addProperty("imp_key", impKey);
      json.addProperty("imp_secret", impSecret);

      BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

      bw.write(json.toString());
      bw.flush();
      bw.close();

      BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

      Gson gson = new Gson();

      String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();

      String token = gson.fromJson(response, Map.class).get("access_token").toString();

      br.close();
      conn.disconnect();

      return token;
   }

   public void payMentCancle(String access_token, String imp_uid, String amount)//, String reason)
         throws IOException, ParseException {
      
      //System.out.println("환불 메소드 도착");
      
      //System.out.println("imp_uid = " + imp_uid);
      HttpsURLConnection conn = null;
      URL url = new URL("https://api.iamport.kr/payments/cancel");

      conn = (HttpsURLConnection) url.openConnection();

      conn.setRequestMethod("POST");

      conn.setRequestProperty("Content-type", "application/json");
      conn.setRequestProperty("Accept", "application/json");
      conn.setRequestProperty("Authorization", access_token);

      conn.setDoOutput(true);

      JsonObject json = new JsonObject();

      //json.addProperty("reason", reason);
      json.addProperty("imp_uid", imp_uid);
      json.addProperty("amount", amount);
      json.addProperty("checksum", amount);

      BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

      bw.write(json.toString());
      bw.flush();
      bw.close();

      BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
   }

}
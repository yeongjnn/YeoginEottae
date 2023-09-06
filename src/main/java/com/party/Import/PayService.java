package com.party.Import;

import java.io.IOException;
import java.text.ParseException;

import com.siot.IamportRestClient.IamportClient;

public interface PayService {

   void payMentCancle(String access_token, String imp_uid, String amount)
         throws IOException, ParseException;

   String getToken() throws Exception;
}
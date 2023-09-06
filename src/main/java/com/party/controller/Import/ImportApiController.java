package com.party.controller.Import;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.text.ParseException;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.party.Import.PayService;
import com.party.reservation.vo.Res_TimeVO;
import com.party.reservation.vo.ReservationVO;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class ImportApiController {

   private IamportClient api;

   @Resource(name = "payService")
   private PayService payService;

   public ImportApiController() {
      // REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
      this.api = new IamportClient("#",
            "#", true);
   }

   // 결제검증, 서버에서 결제된 금액 확인 위함
   @ResponseBody
   @RequestMapping(value = "/verifyIamport.do", method = RequestMethod.POST)
   public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session,
         @Param("imp_uid") String imp_uid) throws IamportResponseException, IOException {
      // System.out.println("iamport api 컨트롤러 도착");
      // System.out.println("imp_uid : " + imp_uid);
      try {
         api.paymentByImpUid(imp_uid);
      } catch (IamportResponseException e) {
         System.out.println(e.getMessage());

         switch (e.getHttpStatusCode()) {
         case 401:
            // TODO : 401 Unauthorized
            break;
         case 404:
            // TODO : imp_123412341234 에 해당되는 거래내역이 존재하지 않음
            break;
         case 500:
            // TODO : 서버 응답 오류
            break;
         }
      } catch (IOException e) {
         // 서버 연결 실패
         e.printStackTrace();
      }
      return api.paymentByImpUid(imp_uid);
   }

   @RequestMapping(value = "/reservationRefund.do")
   public String payMentCancle(ReservationVO reservationVO, Res_TimeVO res_timeVO, RedirectAttributes rttr)
         throws Exception {
      // System.out.println("환불 컨트롤러 도착");
      // System.out.println("예약번호 : " + reservationVO.getRes_num());

      int mem_num = reservationVO.getMem_num();
      // System.out.println("mem_num : " + mem_num);
      String imp_uid = reservationVO.getImp_uid();
      // System.out.println("imp_uid : " + imp_uid);
      String amount = Integer.toString(reservationVO.getCost());
      // System.out.println("실제 amount : " + amount);

      String token = payService.getToken();

      payService.payMentCancle(token, imp_uid, amount); // 실제
      //payService.payMentCancle(token, imp_uid, "100"); // 테스트용

      rttr.addFlashAttribute("reservationVO", reservationVO);
      rttr.addFlashAttribute("res_timeVO", res_timeVO);

      return "redirect:/resDelete.do";
   }

}
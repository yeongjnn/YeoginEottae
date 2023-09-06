package com.party.controller.review;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.party.controller.room.RoomController;
import com.party.member.vo.PageVO;
import com.party.reservation.vo.ReservationVO;
import com.party.review.service.ReviewService;
import com.party.review.vo.ReviewVO;

@Controller
public class ReviewController {

   private static final org.apache.logging.log4j.Logger log = org.apache.logging.log4j.LogManager
         .getLogger(RoomController.class);

   @Resource(name = "reviewService")
   private ReviewService reviewService;

   @RequestMapping(value = "/review_mngr.do", method = RequestMethod.GET)
   public String review_mngr(HttpServletRequest request, PageVO paging, Model model) throws Exception {

      int totalcount = reviewService.getTotalCountM();
      int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

      if (totalcount == 0)
         totalcount = 1;

      paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
      paging.setPageSize(5); // 한페이지에 불러낼 게시물의 개수 지정
      paging.setTotalCount(totalcount);

      page = (page - 1) * 5 + 1; // select해오는 기준을 구한다.
      int page2 = page + 4;

      ArrayList<ReviewVO> revlist = reviewService.getAllReview(page, page2);
      model.addAttribute("revlist", revlist);
      model.addAttribute("paging", paging);

      return "review_mngr";
   }

   @RequestMapping(value = "/reviewFilter_mngr.do", method = RequestMethod.POST)
   public String reviewFilter_mngr(HttpServletRequest request, PageVO paging, Model model,
         @Param("review_filter") String review_filter, @Param("review_search1") String review_search1,
         @Param("review_search2") String review_search2) throws Exception {
      // System.out.println(review_search);

      String review_search = null;
      if (review_filter.equals("rev.star")) {
         review_search = review_search1;
      } else if (review_filter.equals("res.room_num")) {
         review_search = "%" + review_search2 + "%";
      }

      int totalcount = reviewService.getFilterTotal(review_filter, review_search);
      int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

      if (totalcount == 0)
         totalcount = 1;

      paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
      paging.setPageSize(5); // 한페이지에 불러낼 게시물의 개수 지정
      paging.setTotalCount(totalcount);

      page = (page - 1) * 5 + 1; // select해오는 기준을 구한다.
      int page2 = page + 4;

      ArrayList<ReviewVO> revlist = reviewService.getFilterReview(page, page2, review_filter, review_search);
      System.out.println(revlist.size());
      model.addAttribute("revlist", revlist);
      model.addAttribute("paging", paging);

      return "review_mngr";
   }

   // 리뷰입력 입력폼으로 이동
   @RequestMapping(value = "/reviewInsertForm.do")
   public String noticeInsetForm(ReservationVO reservationVO, Model model) throws Exception {

      model.addAttribute("res", reservationVO);

      return "reviewInsert";
   }

   // =======================================================

   @RequestMapping(value = "/reviewInsert.do", method = RequestMethod.POST)
   public String reviewInsert(@RequestParam("rev_img") ArrayList<MultipartFile> files, ReviewVO reviewVO,
         HttpServletResponse response) throws IllegalStateException, IOException {

      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();

      // 여러 개의 원본 파일을 저장할 리스트 생성
      ArrayList<String> originalFileNameList = new ArrayList<String>();
      for (MultipartFile file : files) {
         String originalFileName = file.getOriginalFilename();
         originalFileNameList.add(originalFileName);
      }

      String rev_img_1 = originalFileNameList.get(0);
      String rev_img_2 = originalFileNameList.get(1);
      String rev_img_3 = originalFileNameList.get(2);

      reviewVO.setRev_img_1(rev_img_1);
      reviewVO.setRev_img_2(rev_img_2);
      reviewVO.setRev_img_3(rev_img_3);

      log.info(reviewVO.getRev_img_1());
      log.info(reviewVO.getRev_img_2());
      log.info(reviewVO.getRev_img_3());

      reviewService.reviewInsert(reviewVO);

      int mem_num = reviewVO.getMem_num();

      out.println(
            "<script>alert('리뷰 등록이 완료되었습니다.');window.location='reservation.do?mem_num=" + mem_num + "';</script>");
      out.flush();

      return null;

   }

   // 파일 업로드 처리
   @ResponseBody
   @RequestMapping(value = "/revImgInsert.do", method = RequestMethod.POST, produces = "application/json")
   public int revImgInsert(@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {

      int result = 0;

      if (file.getOriginalFilename() != null) {
         String path = "C:\\Project3_images\\";
         // Save the uploaded file to the specified path
         String originalFileName = file.getOriginalFilename();
         log.info(originalFileName);
         file.transferTo(new File(path + originalFileName));

         // File successfully saved, set the result to 1 to indicate success
         result = 1;
      }
      return result;
   }

   // 내리뷰보기
   @RequestMapping(value = "/myReview.do")
   public String myReview(ReviewVO reviewVO, Model model, PageVO paging, HttpServletRequest request,
         HttpServletResponse response) throws Exception {

      int mem_num = reviewVO.getMem_num();
      System.out.println("멤넘값은");
      System.out.println(mem_num);
      int totalcount = reviewService.getTotalCount2(reviewVO);
      int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

      if (totalcount == 0)
         totalcount = 1;

      paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
      paging.setPageSize(5); // 한페이지에 불러낼 게시물의 개수 지정
      paging.setTotalCount(totalcount);

      page = (page - 1) * 5 + 1; // select해오는 기준을 구한다.
      int page2 = page + 4;

      ArrayList<ReviewVO> revlist = reviewService.myReview(page, page2, mem_num);

      model.addAttribute("revlist", revlist);
      model.addAttribute("paging", paging);

      return "myReview";
   }

   // 리뷰상세페이지
   @RequestMapping(value = "/reviewGetOne.do")
   public String reviewGetOne(ReviewVO reviewVO, Model model) throws Exception {

      ReviewVO rev = reviewService.myReviewDetail(reviewVO); // 리뷰내용
      ReservationVO res = reviewService.myReviewDetail2(reviewVO); // 예약정보

      model.addAttribute("rev", rev);
      model.addAttribute("res", res);

      return "myReviewDetail";
   }

   // 리뷰 수정
   @RequestMapping(value = "/reviewUpdate.do", method = RequestMethod.POST)
   public String reviewUpdate(@RequestParam(value = "rev_img", required = false) ArrayList<MultipartFile> files,
         ReviewVO reviewVO, HttpServletResponse response) throws IllegalStateException, IOException {

      log.info("Review Update Test");

      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();

      String rev_img_1 = reviewVO.getRev_img_1();
      String rev_img_2 = reviewVO.getRev_img_2();
      String rev_img_3 = reviewVO.getRev_img_3();

      if (files != null && !files.isEmpty()) {
         String path = "C:\\Project3_images\\";
         ArrayList<String> originalFileNameList = new ArrayList<String>();

         for (MultipartFile file : files) {
            String originalFileName = file.getOriginalFilename();
            System.out.println(originalFileName);
            originalFileNameList.add(originalFileName);

            File destFile = new File(path + originalFileName);

            reviewVO.setRev_img_1(files.get(0).getOriginalFilename());
            reviewVO.setRev_img_2(files.get(1).getOriginalFilename());
            reviewVO.setRev_img_3(files.get(2).getOriginalFilename());
         }
         
      } else {
         reviewVO.setRev_img_1(reviewVO.getRev_img_1());
         reviewVO.setRev_img_2(reviewVO.getRev_img_2());
         reviewVO.setRev_img_3(reviewVO.getRev_img_3());
      }

      if (reviewVO.getRev_img_1().isEmpty()) {
         reviewVO.setRev_img_1(rev_img_1);
      }

      if (reviewVO.getRev_img_2().isEmpty()) {
         reviewVO.setRev_img_2(rev_img_2);
      }

      if (reviewVO.getRev_img_3().isEmpty()) {
         reviewVO.setRev_img_3(rev_img_3);
      }

      int mem_num = reviewVO.getMem_num();
      log.info(mem_num);

      log.info(reviewVO.getRev_img_1());
      log.info(reviewVO.getRev_img_2());
      log.info(reviewVO.getRev_img_3());
      
      reviewService.reviewUpdate(reviewVO);

      out.println("<script>alert('리뷰가 수정되었습니다.');window.location='myReview.do?mem_num=" + mem_num + "';</script>");
      out.flush();

      return null;
   }

   @RequestMapping(value = "/reviewDelete.do")
   public String reviewDelete(ReviewVO reviewVO, Model model) throws Exception {
      int mem_num = reviewVO.getMem_num();
      reviewService.reviewDelete(reviewVO);

      return "redirect:/myReview.do?mem_num=" + mem_num;
   }

}
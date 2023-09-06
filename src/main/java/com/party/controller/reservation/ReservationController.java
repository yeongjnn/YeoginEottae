package com.party.controller.reservation;

import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.party.member.service.MemberService;
import com.party.member.vo.MemberVO;
import com.party.member.vo.PageVO;
import com.party.reservation.service.Res_TimeService;
import com.party.reservation.service.ReservationService;
import com.party.reservation.vo.Res_TimeVO;
import com.party.reservation.vo.ReservationVO;
import com.party.review.vo.ReviewVO;
import com.party.room.vo.RoomVO;

@Controller
public class ReservationController {

	@Resource(name="memberService")  
	private MemberService memberService;
	
	@Resource(name = "reservationService")
	private ReservationService reservationService;
	
	@Resource(name = "res_timeService")
	private Res_TimeService res_timeService;
		
	private static final org.apache.logging.log4j.Logger log = org.apache.logging.log4j.LogManager
			.getLogger(ReservationController.class);
	
		// 예약 등록 화면으로 이동
	// 예약 등록 화면으로 이동
		@RequestMapping(value = "/reservationInsertForm.do", method = RequestMethod.POST)
		public String reservationInsertForm(@ModelAttribute("reservationVO") ReservationVO reservationVO,
				@ModelAttribute("roomVO") RoomVO roomVO, @ModelAttribute("memberVO")MemberVO memberVO, Model model, HttpSession ses1, HttpServletResponse res)
				throws Exception {

			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			
			
//			 로그아웃 상태이면
//			if (ses1.getAttribute("sid") == null) {
//				out.print("<script> var result = confirm('로그인이 필요한 서비스입니다. 로그인 페이지로 이동하겠습니까?');");
//				out.println("if (result == true) {");
//				out.println("window.location.href='login.jsp';");
//				out.println("} else {");
//				out.println("window.location.href='main.jsp';");
//				out.println("} </script>");
//			}
			
			log.info("방가격 : " + roomVO.getPrice());
			log.info("방이름 : " + roomVO.getRoom_name());
			
			MemberVO memberVO2 = memberService.getMyInfo(memberVO);
			model.addAttribute("memberVO",memberVO2);

			// 로그인 상태이면
			return "reservationInsertForm";

		}
		
		// 시간 체크
		@ResponseBody
		@RequestMapping(value = "/selectTime.do", method = RequestMethod.POST)
		public int[] selectTime(@Param("room_num") int room_num, @Param("reserve_date") String reserve_date, Model model,
				HttpSession ses1) throws Exception {

			// 해당 파티룸과 날짜에 예약된 시간 비활성화하기 위해
			int[] timeList = new int[24];

			for (int i = 0; i < timeList.length; i++) {
				timeList[i] = res_timeService.timeCheck(i, reserve_date, room_num);
				// log.info(i + "시의 예약 여부 : " + timeList[i]);
			}
			// log.info(Arrays.toString(timeList));
			// model.addAttribute("timeList", timeList);

			return timeList;
		}
		
		// 예약 등록 작업 진행
		@RequestMapping(value = "/reservationInsert.do", method = RequestMethod.POST)
		public String reservationInsert(@ModelAttribute("reservationVO") ReservationVO reservationVO,
				@ModelAttribute("total_cost")int total_cost,
				@ModelAttribute("roomVO") RoomVO roomVO, @ModelAttribute("res_timeVO") Res_TimeVO res_timeVO,
				@ModelAttribute("reserve_date") String reserve_date,@ModelAttribute("memberVO")MemberVO memberVO,
				@ModelAttribute("selectedTime") ArrayList<Integer> selectedTime, Model model,HttpSession session) throws Exception {

			log.info("예약날짜 : " + reserve_date);
			for (int i = 0; i < selectedTime.size(); i++) {
				log.info("예약시간 : " + selectedTime.get(i));
				int selecteTime_2 = selectedTime.get(i);
				res_timeVO.setReserve_time(selecteTime_2);
				res_timeService.insertRes_Time(res_timeVO);
			}
			
			
			res_timeVO.setReserve_time(selectedTime.get(selectedTime.size() - 1) + 1);
			res_timeService.insertRes_Time(res_timeVO);

			reservationVO.setStart_time(reserve_date + " " + (selectedTime.get(0)));
			reservationVO.setFinish_time(reserve_date + " " + (selectedTime.get(selectedTime.size() - 1)+1));
			int play_time = selectedTime.get(selectedTime.size() - 1) - selectedTime.get(0) + 1;
			reservationVO.setPlay_time(play_time);

			reservationVO.setCost(total_cost);
			
			reservationService.insertReservation(reservationVO);

			 
			
			
			return "reservationSubmit"; // 일단 main.jsp 로 이동
		}

	@RequestMapping(value = "/reservation_mngr.do", method = RequestMethod.GET)
	public String review_mngr(Model model) throws Exception {
		ArrayList<ReservationVO> reslist = reservationService.getAllReservation();
		
		for (int i = 0; i < reslist.size(); i++) {
			String res_time1 = reslist.get(i).getRes_time();

			SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			try {
				Date inputDate = inputDateFormat.parse(res_time1);

				String res_time2 = outputDateFormat.format(inputDate);

				//System.out.println("Input Date: " + res_time1);
				//System.out.println("Output Date: " + res_time2);
				reslist.get(i).setRes_time(res_time2);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		model.addAttribute("reslist", reslist);

		return "reservation_mngr";
	}
	
	//내 예약목록보기
	@RequestMapping(value = "/reservation.do", method = RequestMethod.GET)
	public String reservation(ReservationVO reservationVO, Model model,HttpServletRequest request,PageVO paging) throws Exception {
		
		
		int totalcount = reservationService.getTotalCount(reservationVO);
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

		if (totalcount == 0)
			totalcount = 1;

		paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
		paging.setPageSize(5); // 한페이지에 불러낼 게시물의 개수 지정
		paging.setTotalCount(totalcount);
		
		page = (page - 1) * 5 + 1; // select해오는 기준을 구한다.
		int page2 = page + 4;   
		
	
		Date date=new Date();
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyMMdd");
		String strdate=simpleDate.format(date);
		
		int mem_num=reservationVO.getMem_num();
		
		ArrayList<ReservationVO> reslist = reservationService.getMyReservation(mem_num,page, page2);
		ArrayList<ReviewVO> revlist = reservationService.revCheck(reservationVO);
		
		model.addAttribute("reslist", reslist);		
		model.addAttribute("strdate", strdate);
		model.addAttribute("revlist",revlist);
		model.addAttribute("paging",paging);

		return "reservation";
	}
	
	@RequestMapping(value = "/resDetail.do", method = RequestMethod.GET)
	public String resDetail(ReservationVO reservationVO, Model model) throws Exception {
		
		Date date=new Date();
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyMMdd");
		String todayDate=simpleDate.format(date);
		
		
		ReservationVO res = reservationService.resDetail(reservationVO);

		String a=res.getStart_time();
		String resDate=a.substring(2,4)+a.substring(5,7)+a.substring(8,10);
		
		model.addAttribute("res", res);
		model.addAttribute("todayDate", todayDate);
		model.addAttribute("resDate", resDate); 
		return "reservationDetail";
	}
	
	@RequestMapping(value = "/reservationfilter_mngr.do", method = RequestMethod.POST)
	public String reservationFilter_mngr(Model model, @Param("reservation_filter") String reservation_filter,
			@Param("reservation_search1") String reservation_search1,
			@Param("reservation_search2") String reservation_search2) throws Exception {
		System.out.println("들어온 검색어 : " + reservation_search1);
		System.out.println("들어온 검색어 : " + reservation_search2);
		String reservation_search = null;
		if (reservation_filter.equals("room_num")) {
			reservation_search = reservation_search1;
		} else if (reservation_filter.equals("start_time") || reservation_filter.equals("res_time")) {
			reservation_search = reservation_search2.substring(2, 4) + "/" + reservation_search2.substring(5, 7) + "/"
					+ reservation_search2.substring(8, 10);
			System.out.println("날짜 처리한 검색어 : " + reservation_search);
		}
		ArrayList<ReservationVO> reslist = reservationService.getFilterReservation(reservation_filter, reservation_search);
		for (int i = 0; i < reslist.size(); i++) {
			String res_time1 = reslist.get(i).getRes_time();

			SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			try {
				Date inputDate = inputDateFormat.parse(res_time1);

				String res_time2 = outputDateFormat.format(inputDate);

				//System.out.println("Input Date: " + res_time1);
				//System.out.println("Output Date: " + res_time2);
				reslist.get(i).setRes_time(res_time2);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		//System.out.println("처리하고 가지고온 배열 사이즈 : " + reslist.size());
		model.addAttribute("reslist", reslist);

		return "reservation_mngr";
	}
	
	//예약취소
	 @RequestMapping(value = "/resDelete.do")
	   public String resDelete(HttpServletResponse res, ReservationVO reservationVO, Res_TimeVO res_timeVO, Model model)
	         throws Exception {
	      res.setContentType("text/html; charset=UTF-8");
	      PrintWriter out = res.getWriter();

	      int resTime = 0;
	      int mem_num = reservationVO.getMem_num();
	      String resDate = reservationVO.getStart_time().substring(0, 10);
	      int playTime = reservationVO.getPlay_time() + 1;
	      if (reservationVO.getStart_time().substring(11, 12).equals("9")) { // 9시일 경우 1글자 자르고 (2글자 자르면 '9'가 아니고 '9시' 가 되기 때문)
	         resTime = Integer.parseInt(reservationVO.getStart_time().substring(11, 12));
	      } else { // 아니면 2글자 자름
	         resTime = Integer.parseInt(reservationVO.getStart_time().substring(11, 13));
	      }

	      res_timeVO.setReserve_date(resDate);

	      reservationService.resDelete(reservationVO);
	      for (int i = resTime; i <= resTime + playTime; i++) {
	         res_timeVO.setReserve_time(i);
	         System.out.println(res_timeVO.getReserve_date() + "\t" + res_timeVO.getReserve_time() + "시 삭제");
	         res_timeService.resTimeDelete(res_timeVO);
	      }
	      out.println("<script>alert('예약이 취소되었습니다.');window.location='reservation.do?mem_num=" + mem_num + "';</script>");
	      out.flush();

	      return null;
	   }
	
	

}

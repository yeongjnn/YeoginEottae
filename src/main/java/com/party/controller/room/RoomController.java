package com.party.controller.room;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.party.like.service.LikeService;
import com.party.like.vo.LikeVO;
import com.party.member.vo.PageVO;
import com.party.review.service.ReviewService;
import com.party.review.vo.ReviewVO;
import com.party.room.service.RoomService;
import com.party.room.vo.RoomVO;

@Controller
public class RoomController {

	@Autowired
	ServletContext context;
	
	@Resource(name="roomService")  
	private RoomService roomService;
	
	@Resource(name = "reviewService")
	private ReviewService reviewService;
	
	@Resource(name="likeService")
    private LikeService likeService;

	
	private static final org.apache.logging.log4j.Logger log = org.apache.logging.log4j.LogManager
			.getLogger(RoomController.class);
	
		// 파티룸 개별 조회
		@RequestMapping(value = "/roomGetOne.do")
		public String getOneRoom(@ModelAttribute("roomVO") RoomVO roomVO, @ModelAttribute("reviewVO") ReviewVO reviewVO,
				@RequestParam("room_num") int room_num, Model model) throws Exception {

			
			roomService.getOneRoom(roomVO);
			RoomVO roomVO2 = roomService.getOneRoom(roomVO);
			log.info(roomVO);
			
		
			ArrayList<ReviewVO> revArr = reviewService.reviewOneAll(room_num); // 리뷰는 ArrayList 로 출력
			model.addAttribute("revArr", revArr);
			model.addAttribute("roomVO" , roomVO2);
			log.info(reviewVO);
			
			return "roomGetOne";

		}

		//관리자 - 회원 전체보기 (페이징)
		@RequestMapping(value="/roomPage_mngr.do")
		public String roomPage_mngr(HttpServletRequest request,PageVO paging, Model model) throws Exception{
				
		int totalcount = roomService.getTotalCount();
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

		if (totalcount == 0)
			totalcount = 1;

		paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
		paging.setPageSize(10); // 한페이지에 불러낼 게시물의 개수 지정
		paging.setTotalCount(totalcount);
				
		page = (page - 1) * 10 + 1; // select해오는 기준을 구한다.
		int page2 = page + 9;   
				
				
		ArrayList <RoomVO> rlist = roomService.getList(page, page2);
		model.addAttribute("rlist",rlist);
		model.addAttribute("paging",paging);
				
		return "room_mngr"; 
		}
		
		
		
		@RequestMapping(value="/roomAllPage.do")
		public String roomAllPage(HttpServletRequest request,PageVO paging, Model model) throws Exception{
				
		int totalcount = roomService.getTotalCount();
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

		if (totalcount == 0)
			totalcount = 1;

		paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
		paging.setPageSize(8); // 한페이지에 불러낼 게시물의 개수 지정
		paging.setTotalCount(totalcount);
				
		page = (page - 1) * 8 + 1; // select해오는 기준을 구한다.
		int page2 = page + 7;   
				
				
		ArrayList <RoomVO> rlist = roomService.getList(page, page2);
		model.addAttribute("rlist",rlist);
		model.addAttribute("paging",paging);
				
		return "roomAll"; 
		}

		//관리자 - 방 추가 폼으로 이동
		@RequestMapping(value = "/roomInsertForm_mngr.do", method = RequestMethod.GET)
		   public String roominF_mngr() {
		      return "roominsert_mngr";
		   }
		
		//관리자 - 방 상세정보
		@RequestMapping(value = "/roomSearchOne_mngr.do", method = RequestMethod.GET)
		   public String roomSearchOne_mngr(@ModelAttribute("roomVO")RoomVO roomVO, Model model) {
			  
			model.addAttribute("roomVO", roomVO);
			
		      return "roomUpdate_mngr";
		   }
		
		// 베이직룸 전체 조회
		@RequestMapping(value = "/basic.do")
		public String roomBasicAll(@Param("bedOption") String bedOption,@Param("musicOption") String musicOption,Model model) throws Exception {
			

			ArrayList<RoomVO> alist = roomService.getAllBasic(bedOption,musicOption);
			model.addAttribute("alist", alist);
			return "roomBasicAll";
		}

		// 쿠킹룸 전체 조회
		@RequestMapping(value = "/cooking.do")
		public String roomCookingAll(@Param("bedOption") String bedOption,@Param("musicOption") String musicOption,Model model) throws Exception {

			ArrayList<RoomVO> alist = roomService.getAllCooking(bedOption,musicOption);
			model.addAttribute("alist", alist);
			return "roomCookingAll";
		}

		// 키즈룸 전체 조회
		@RequestMapping(value = "/kids.do")
		public String roomKidsAll(@Param("bedOption") String bedOption,@Param("musicOption") String musicOption,Model model) throws Exception {

			ArrayList<RoomVO> alist = roomService.getAllKids(bedOption,musicOption);
			model.addAttribute("alist", alist);
			return "roomKidsAll";
		}

		// 루프탑 전체 조회
		@RequestMapping(value = "/rooftop.do")
		public String roomRooftopAll(Model model) throws Exception {

			ArrayList<RoomVO> alist = roomService.getAllRooftop();
			model.addAttribute("alist", alist);
			return "roomRooftopAll";
		}
		
		@RequestMapping(value = "/roomInsert_mngr.do", method = RequestMethod.POST)
		public String roomin_mngr(@RequestParam("room_img") ArrayList<MultipartFile> files, RoomVO roomVO,
				HttpServletResponse response) throws IllegalStateException, IOException {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			System.out.println(files.get(0).getOriginalFilename());
			System.out.println(files.get(1).getOriginalFilename());
			System.out.println(files.get(2).getOriginalFilename());

			// if (files.get(0).getOriginalFilename() == null) {
			if (files.get(0).isEmpty() || files.get(1).isEmpty() || files.get(2).isEmpty()) {
				//out.println("<script>alert('사진을 모두 등록해주세요.'); history.go(-1);</script>");
				System.out.println("사진 전부 등록 안됨");
				out.flush();
			} else {
				// 여러 개의 원본 파일을 저장할 리스트 생성
				ArrayList<String> originalFileNameList = new ArrayList<String>();
				for (MultipartFile file : files) {
					String originalFileName = file.getOriginalFilename();
					originalFileNameList.add(originalFileName);
				}

				String room_img_1 = originalFileNameList.get(0);
				String room_img_2 = originalFileNameList.get(1);
				String room_img_3 = originalFileNameList.get(2);

				roomVO.setRoom_img_1(room_img_1);
				roomVO.setRoom_img_2(room_img_2);
				roomVO.setRoom_img_3(room_img_3);

				roomService.insertRoom(roomVO);

				out.println("<script>alert('파티룸이 추가되었습니다.'); window.location='roomPage_mngr.do';</script>");
				out.flush();
			}

			return null;
		}

		@ResponseBody
		@RequestMapping(value = "/roomImg_mngr.do", method = RequestMethod.POST, produces = "application/json")
		public int roomImg_mngr(@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
			int result = 0;

			if (file.getOriginalFilename() != null) {
				String path = "C:\\Project3_images\\";
				// Save the uploaded file to the specified path
				String originalFileName = file.getOriginalFilename();
				file.transferTo(new File(path + originalFileName));

				// File successfully saved, set the result to 1 to indicate success
				result = 1;
			}
			return result;
		}
		   
		   //관리자 - 방정보 업데이트
		   @RequestMapping(value = "/roomUpdate_mngr.do", method = RequestMethod.POST)
		   public String roomUpdate_mngr(@RequestParam(value = "room_img", required = false) ArrayList<MultipartFile> files, RoomVO roomVO,
		           HttpServletResponse response) throws IllegalStateException, IOException {
		       response.setContentType("text/html; charset=euc-kr");
		       PrintWriter out = response.getWriter();
		       
		       String img1=roomVO.getRoom_img_1();
		       String img2=roomVO.getRoom_img_2();
		       String img3=roomVO.getRoom_img_3();
		       	
		       // 파일을 업로드하는 경우에만 처리
		       if (files != null && !files.isEmpty()) {
		           String path = "C:\\Project3_images\\";
		           ArrayList<String> originalFileNameList = new ArrayList<String>();

		           for (MultipartFile file : files) {
		               String originalFileName = file.getOriginalFilename();
		               System.out.println(originalFileName);
		               originalFileNameList.add(originalFileName);

		               File destFile = new File(path + originalFileName);
		               
		              
		               roomVO.setRoom_img_1(files.get(0).getOriginalFilename());
		               roomVO.setRoom_img_2(files.get(1).getOriginalFilename());
		               roomVO.setRoom_img_3(files.get(2).getOriginalFilename());
		           }
		       }else {

		       	roomVO.setRoom_img_1(roomVO.getRoom_img_1());
		       	roomVO.setRoom_img_2(roomVO.getRoom_img_2());
		       	roomVO.setRoom_img_3(roomVO.getRoom_img_3());
		       }
		       
		       if(roomVO.getRoom_img_1().isEmpty()) {
		    	roomVO.setRoom_img_1(img1);  
		       }
		       
		       if(roomVO.getRoom_img_2().isEmpty()) {
			    	roomVO.setRoom_img_2(img2);  
			       }
		       
		       if(roomVO.getRoom_img_3().isEmpty()) {
			    	roomVO.setRoom_img_3(img3);  
			       }
		       roomService.updateRoom(roomVO);

		       out.println("<script>alert('파티룸이 변경되었습니다.'); window.location='roomPage_mngr.do';</script>");
		       out.flush();

		       return null;
		   }

		   //관리자 - 방 삭제
			@RequestMapping(value="/deleteRoom.do") 
			public String deleteRoom(@ModelAttribute("boardVO")RoomVO roomVO,Model model) {
				roomService.deleteRoom(roomVO);
				
				return "redirect:/answerOpen.do";
			}	
			
			
			
			@RequestMapping(value="/roomAllPageFilter.do")
			public String roomAllPageFilter(@Param("bedOption") String bedOption,@Param("musicOption") String musicOption,HttpServletRequest request,PageVO paging, Model model) throws Exception{
					
			int totalcount = roomService.getFilterTotal(bedOption,musicOption);
			int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

			if (totalcount == 0)
				totalcount = 1;

			paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
			paging.setPageSize(8); // 한페이지에 불러낼 게시물의 개수 지정
			paging.setTotalCount(totalcount);
					
			page = (page - 1) * 8 + 1; // select해오는 기준을 구한다.
			int page2 = page + 7;   
					
					
			ArrayList <RoomVO> rlist = roomService.getFilterList(bedOption,musicOption,page, page2);
			model.addAttribute("rlist",rlist);
			model.addAttribute("paging",paging);
					
			return "roomAll"; 
			}
			
			// 관리자-방 검색기능 (페이징)
			@RequestMapping(value = "/roomPageFilter.do")
			public String memberPageFilter(@Param("roomFilter") String roomFilter,
					@Param("roomSearch") String roomSearch, HttpServletRequest request, PageVO paging, Model model)
					throws Exception {

				String roomSearch2 = "%" + roomSearch.toUpperCase() + "%";

				int totalcount = roomService.getFilterTotalM(roomFilter, roomSearch2);

				int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

				if (totalcount == 0)
					totalcount = 1;

				paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
				paging.setPageSize(10); // 한페이지에 불러낼 게시물의 개수 지정
				paging.setTotalCount(totalcount);

				page = (page - 1) * 10 + 1; // select해오는 기준을 구한다.
				int page2 = page + 9;

				ArrayList<RoomVO> rlist = roomService.getFilterListM(roomFilter, roomSearch2, page, page2);
				model.addAttribute("rlist", rlist);
				model.addAttribute("paging", paging);

				return "room_mngr";
			}
			
			@GetMapping(value = "/checkLikeStatus.do")
			public ResponseEntity<Boolean> checkLikeStatus(@ModelAttribute("likeVO") LikeVO likeVO) {
			    return ResponseEntity.ok(likeService.checkLikeStatus(likeVO));
			}
			
}

package com.party.controller.like;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.party.like.service.LikeService;
import com.party.like.vo.LikeVO;
import com.party.room.vo.RoomVO;

@Controller
public class LikeController {
 
    @Resource(name="likeService")
    private LikeService likeService;

	/*
	 * @PostMapping(value = "/addLike.do") public String
	 * addLike(@RequestParam("roomNum") int roomNum) { int memNum = 1; LikeVO likeVO
	 * = new LikeVO(memNum, roomNum); likeService.addLike(likeVO); return
	 * "roomBasicAll"; }
	 * 
	 * @PostMapping(value = "/removeLike.do") public String
	 * removeLike(@RequestParam("roomNum") int roomNum, @RequestParam("likeNum") int
	 * likeNum) { int memNum = 1; // 로그인한 사용자의 멤버 번호로 변경해야 합니다. LikeVO likeVO = new
	 * LikeVO(memNum, roomNum); likeVO.setLikeNum(likeNum); // likeNum 값을 설정합니다.
	 * likeService.removeLike(likeVO); return "roomBasicAll"; }
	 */
    
   
    @PostMapping(value = "/addLike.do")
    @ResponseBody
    public ResponseEntity<String> addLike(@ModelAttribute("likeVO") LikeVO likeVO) {
       
        likeService.addLike(likeVO);
        return ResponseEntity.ok("success");
    }

    @RequestMapping(value = "/removeLike.do")
    @ResponseBody
    public ResponseEntity<String> removeLike(@ModelAttribute("likeVO") LikeVO likeVO) {
        likeService.removeLike(likeVO);
        return ResponseEntity.ok("success");
    }
	 
 

//	  @RequestMapping(value = "/likelist.do")
//	  public String likeListView(Model model, HttpSession session) {
//	      MemberVO member = (MemberVO) session.getAttribute("sid");
//			/*
//			 * if (member == null) { return "redirect:/loginForm.do"; // 로그인 페이지로 리디렉션 }
//			 */
//	      int mem_num = member.getMem_num();
//	      System.out.println("MEM_NUM: " + mem_num); // 값 확인
//	      ArrayList<LikeVO> likeList = likeService.likeListView(mem_num);
//	      model.addAttribute("likeList", likeList);
//	      return "likelist";
//	  }
	  
	
    @RequestMapping(value = "/likelist.do")
	public String likeListView(Model model, LikeVO likeVO) {

		System.out.println("회원번호 : " + likeVO.getMem_num());

		ArrayList<LikeVO> likeList = likeService.likeListView(likeVO); // 아이디로 찜목록(방번호) 배열 가져오기
		ArrayList<RoomVO> likedRoom = new ArrayList<RoomVO>(); // 방번호로 불러온 방정보를 담을 배열 만들기

		for (int i = 0; i < likeList.size(); i++) {
			likedRoom.add(likeService.getOneRoom(likeList.get(i).getRoom_num())); // 방번호로 방정보 조회해서 배열에 넣기
			System.out.println("찜한 방번호 : " + likedRoom.get(i).getRoom_num());
		}

		model.addAttribute("mem_num", likeVO.getMem_num());
		model.addAttribute("likedRoom", likedRoom);
		
		return "likelist";
	}
}

package com.project.ogg.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.ogg.admin.model.mapper.AdminMapper;
import com.project.ogg.admin.model.service.AdminService;
import com.project.ogg.admin.model.vo.Answer;
import com.project.ogg.admin.model.vo.MUser;
import com.project.ogg.admin.model.vo.MemberAD;
import com.project.ogg.admin.model.vo.Notice;
import com.project.ogg.admin.model.vo.OttAdmin;
import com.project.ogg.admin.model.vo.OttForPie;
import com.project.ogg.admin.model.vo.PhotoVo;
import com.project.ogg.admin.model.vo.Question;
import com.project.ogg.admin.model.vo.UsingOtt;
import com.project.ogg.common.util.MultipartFileUtil;
import com.project.ogg.common.util.MultipartFileUtil2;
import com.project.ogg.common.util.PageInfo;
import com.project.ogg.member.model.vo.Member;
import com.project.ogg.party.model.service.PartyService;
import com.project.ogg.party.model.vo.Ott;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {

	@Autowired
	private AdminService service;
	
	@Autowired
	private AdminMapper mapper;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@Autowired
	private PartyService service2;
	
	@GetMapping("/admin/home")
	public ModelAndView goAdmin(ModelAndView model,@AuthenticationPrincipal Member member) {
		MUser muser = new MUser();
		muser.setFebUser(service.getFebUserCount());
		muser.setMayUser(service.getMayUserCount());
		muser.setAugUser(service.getAugUserCount());
		muser.setOctUser(service.getOctUserCount());
		
		List<OttForPie> pielist = service.getPieList();
		int partyCount = mapper.getPartyCount();
		
		List<Ott> list2 = service2.getOttList();
		
		model.addObject("list2",list2);
		model.addObject("pc",partyCount);
		model.addObject("pielist",pielist);
		model.addObject("muser",muser);
		model.setViewName("admin/ad_main");
		
		return model;
	}
	
	@PostMapping("/admin/selectMember")
	@ResponseBody
	public MemberAD selectMember( @RequestParam("memberId") String memberId, 
			ModelAndView model) {
		MemberAD member = null;
		member = service.selectMember(memberId);
		
		model.addObject("member",member);
		System.out.println(member);
		return member;
	}
	
	@PostMapping("/admin/selectOtt")
	@ResponseBody
	public List<UsingOtt> selectOtt( @RequestParam("mid") String memberId, 
			ModelAndView model) {
		List<UsingOtt> otts = service.selectOtt(memberId);
		
		model.addObject("otts",otts);
		System.out.println(otts);
		return otts;
	}
	
	
	@GetMapping("/admin/OTT")
	public ModelAndView goOTT(ModelAndView model) {
		List<OttAdmin> list = service.getOTTList();
		List<Ott> list2 = service2.getOttList();
		model.addObject("list2",list2);
		
		model.addObject("list",list);
		model.setViewName("admin/ad_OTT");
		return model;
	}
	@GetMapping("/admin/addOTT")
	public String addOTT() {
		return "admin/addOTT";
	}
	
	@PostMapping("/admin/addOTT")
	public ModelAndView addOTT(ModelAndView model, 
								@ModelAttribute OttAdmin ott,
								@RequestParam("img") MultipartFile upfile) {
		
		int result = 0;
		
		if(upfile !=null &&  !upfile.isEmpty()) {
			//파일을 저장하는 로직 작성
			String location = null;
			String ott_thumb = null;
			try {
				location = resourceLoader.getResource("resources/images/party")
										 .getFile()
										 .getPath();
				
				ott_thumb = MultipartFileUtil2.save(upfile, location,ott.getOtt_name());
				
				System.out.println(location);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(ott_thumb != null) {
				ott.setOtt_thumb(ott_thumb);
			}
		}
		
		System.out.println("111board.getNo()"+ott.getOtt_no());
		result = service.addOTT(ott);
		System.out.println("222board.getNo()"+ott.getOtt_no());
		
		if(result > 0) {
			// 탈퇴 성공
    		model.addObject("msg", "정상적으로 OTT 추가 되었습니다.");
    		model.addObject("script", "opener.document.location.reload();self.close()");
		} else {
			// 탈퇴 실패
			model.addObject("msg", "OTT 추가 실패 하였습니다.");
			model.addObject("location", "/admin/addOTT");		
		}
		model.setViewName("common/msg");
		
		return model;
	}
	@GetMapping("/ott/delete")
	public ModelAndView ottDelete(ModelAndView model,@RequestParam int ott_no) {
		System.out.println(ott_no);
		int result = service.deleteOtt(ott_no);
		
		if(result > 0) {
			model.addObject("msg","ott 삭제 성공");
			model.addObject("location","/admin/OTT");
		}else {
			model.addObject("msg","ott 삭제 실패");
			model.addObject("location","/admin/OTT");
		}
		model.setViewName("common/msg");
		return model;
	}
	
	@GetMapping("/admin/member")
	public ModelAndView goMember(ModelAndView model) {
		
		List<MemberAD> list = service.getMemberList();
		MUser muser = new MUser();
		muser.setFebUser(service.getFebUserCount());
		muser.setMayUser(service.getMayUserCount());
		muser.setAugUser(service.getAugUserCount());
		muser.setOctUser(service.getOctUserCount());
		
		List<OttForPie> pielist = service.getPieList();
		int partyCount = mapper.getPartyCount();
		System.out.println(pielist);
		model.addObject("pc",partyCount);
		model.addObject("pielist",pielist);
		
		model.addObject("muser",muser);
		
		model.addObject("list", list);
		model.setViewName("party/createParty");
		model.setViewName("admin/ad_member");
		return model;
	}
	
	@GetMapping("/admin/notice")
	public ModelAndView goNotice(@RequestParam(value = "page", defaultValue="1") int page,ModelAndView model) {
		
		List<Notice> list = null;
		PageInfo pageInfo = null;
		pageInfo = new PageInfo(page, 5, service.getNoticeCount(), 5);
		
		list = service.getNoticeList(pageInfo);
		
		model.addObject("pageInfo",pageInfo);
		model.addObject("list",list);
		model.setViewName("admin/ad_notice");
		return model;
	}
	
	@GetMapping("/admin/notice/view")
	public ModelAndView noticeView(@RequestParam("no")int no,
							ModelAndView model,
							HttpServletRequest request,
							HttpServletResponse response) {
		
		Cookie[] cookies = request.getCookies();
    	String noticeHistory = ""; // 조회한 게시글 번호를 저장하는 변수
    	boolean hasRead = false; // 읽은 글이면 true, 안 읽었으면 false
    	
    	if(cookies != null) {
    		String name = null;
    		String value = null;
    		for (Cookie cookie : cookies) {
				name = cookie.getName();
				value = cookie.getValue();
				
				// boardHistory인 쿠키 값을 찾기
				if(name.equals("noticeHistory")) {
					noticeHistory = value;
					
					if(value.contains("|" + no + "|")) {
						hasRead = true;
						
						break;
					}
				}
			}
    	}
    	
    	// 2. 읽지 않은 게시글이면 cookie에 기록
    	if(!hasRead) {
    		Cookie cookie = new Cookie("noticeHistory", noticeHistory + "|" + no + "|");
        	
        	cookie.setMaxAge(-1); // 브라우저 종료 시 삭제
        	response.addCookie(cookie);
    	}    	
    	
		
		Notice notice = service.getNoticeView(no);
		
		if(notice != null && !hasRead) {
			 mapper.updateReadCount(notice);
		}
		
		notice = service.getNoticeView(no);
		
		model.addObject("notice",notice);
		model.setViewName("admin/ad_noticeView");
		
		return model;
	}
	
	@GetMapping("/notice/write")
	public ModelAndView noticeWrite(ModelAndView model,@AuthenticationPrincipal Member member) {
		System.out.println(member.getM_authority());
		if(member.getM_authority().equals("ROLE_ADMIN")) {
			model.setViewName("/admin/ad_noticeWrite");
			return model;
		}
		else {
			model.addObject("msg","관리자만 작성 가능합니다.");
			model.addObject("location","/");
			model.setViewName("common/msg");
			return model;
		}
	}
	
	@PostMapping("/notice/write")
	public ModelAndView noticeWrite(@ModelAttribute Notice notice,ModelAndView model,
			@AuthenticationPrincipal Member member) {
		
		
		String content = notice.getN_content();
		notice.setN_M_No(member.getM_no());
		
		if(content.indexOf("/img/smarteditor/") != -1) {
			String path = content.substring(content.indexOf("/img/smarteditor/")+17,content.indexOf("/img/smarteditor/")+(17+36));
			System.out.println(path);
			notice.setN_path(path);
			}
		
		int result = service.noticeSave(notice);
		if(result > 0) {
			model.addObject("msg","공지사항 작성 성공");
			model.addObject("location","/admin/notice/view?no="+notice.getN_no());
			
			
		}else {
			model.addObject("msg","게시글 작성 실패");
			model.addObject("location","/notice/write");
			
		}
		model.setViewName("common/msg");
		return model;
	}
	@GetMapping("/notice/update")
	public ModelAndView noticeUpdate(@RequestParam("no")int no, ModelAndView model,
			@AuthenticationPrincipal Member member) {
		
		Notice notice = service.getNoticeView(no);
		
		if(member.getM_authority().equals("ROLE_ADMIN")) {
			model.addObject("notice",notice);
			model.setViewName("admin/ad_noticeUpdate");
		}
		else {
			model.addObject("msg","관리자만 작성 가능합니다.");
			model.addObject("location","/");
			model.setViewName("common/msg");
		}
		
		return model;
	}
	
	@PostMapping("/notice/update")
	public ModelAndView noticeUpdate(@ModelAttribute Notice notice,
									ModelAndView model,
									HttpServletRequest rq) {
		
		System.out.println(notice);
		
		Notice beforeN = service.getNoticeView(notice.getN_no());
		System.out.println(beforeN);
		String bfpath = beforeN.getN_path();
		String content = notice.getN_content();
		
		// 사진을 올린기록이 있고, 사진을 올린 기록과 지운기록 or 새로올린기록이 같지 않다면 파일 삭제
		if(content.indexOf("/img/smarteditor/") == -1) {
			if(bfpath != null) {
				MultipartFileUtil.delete(rq.getServletContext().getRealPath("/img")+"/smarteditor/"+bfpath);
			}
		}else{
			if(bfpath != null && !bfpath .equals(content.substring(content.indexOf("/img/smarteditor/")+17,content.indexOf("/img/smarteditor/")+(17+36)))) {
				MultipartFileUtil.delete(rq.getServletContext().getRealPath("/img")+"/smarteditor/"+bfpath);
				
			}
		}
		
		if(content.indexOf("/img/smarteditor/") != -1) {
		String path = content.substring(content.indexOf("/img/smarteditor/")+17,content.indexOf("/img/smarteditor/")+(17+36));
		System.out.println(path);
		notice.setN_path(path);
		}
		System.out.println(notice.getN_no());
		
		int result = service.noticeSave(notice);
		
		if(result > 0) {
			model.addObject("msg","공지사항 작성 성공");
			model.addObject("location","/admin/notice/view?no="+notice.getN_no());
			
			
		}else {
			model.addObject("msg","게시글 작성 실패");
			model.addObject("location","/notice/write");
			
		}
		model.setViewName("common/msg");
		return model;
	}
	
	@GetMapping("/notice/delete")
	public ModelAndView deleteNotice(@RequestParam("no") int no,ModelAndView model,
			@AuthenticationPrincipal Member member) {
		if (member.getM_authority().equals("ROLE_ADMIN")) {

			System.out.println(no);
			int result = service.deleteNotice(no);

			if (result > 0) {
				model.addObject("msg", "공지사항 삭제 성공");
				model.addObject("location", "/admin/notice");
			} else {
				model.addObject("msg", "공지사항 삭제 실패");
				model.addObject("location", "/admin/notice/view?no=" + no);
			}
		} else {
			model.addObject("msg", "관리자만 삭제 가능합니다.");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");
		return model;
	}
	
	@GetMapping("/admin/question")
	public ModelAndView goQuestion(@RequestParam(value = "page", defaultValue="1") int page,ModelAndView model) {
		
		List<Question> list = null;
		PageInfo pageInfo = null;
		pageInfo = new PageInfo(page, 5, service.getQuestionCount(), 5);
		
		list = service.getQuestionList(pageInfo);
		
		model.addObject("pageInfo",pageInfo);
		model.addObject("list",list);
		model.setViewName("admin/ad_question");
		return model;
	}
	
	@GetMapping("/admin/question/view")
	public ModelAndView questionView(@RequestParam("no") int no, 
						ModelAndView model) {

		Question question = service.getQuestionView(no);

		//답변상태가 Y이면 답변을 찾는 로직
		if(question.getQ_status().equals("Y")) {
			Answer answer = service.getAnswer(question.getQ_no());
			model.addObject("answer",answer);
		}
		
		model.addObject("question", question);
		model.setViewName("admin/ad_questionView");

		return model;
	}
	
//	@GetMapping("/question/write")
//	public String questionWriting() {
//		
//		return "admin/ad_questionWrite";
//	}
//	
//	@PostMapping("/question/write")
//	public ModelAndView questionWriting(@ModelAttribute Question question,
//										ModelAndView model) {
//		
//		int result = service.writeQuestion(question);
//		int no = question.getQ_no();
//		System.out.println("no : "+no);
//		
//		if(result > 0) {
//			model.addObject("msg","문의 작성 완료");
//			model.addObject("location","/admin/question/view?no="+no);
//		}else{
//			model.addObject("msg","문의 작성 실패");
//			model.addObject("location","/admin/question/view?no="+no);
//		}
//
//		
//		model.setViewName("common/msg");
//		
//		return model;
//	}
//	@GetMapping("/admin/question/update")
//	public ModelAndView questionUpdate(@RequestParam int no,
//										ModelAndView model) {
//		
//		Question question = service.getQuestionView(no);
//		Answer answer = service.getAnswer(question.getQ_no());
//		
//		if(answer != null) {
//			model.addObject("msg","답변이 있을 경우 질문 수정이 불가능합니다.");
//			model.addObject("location","/admin/question/view?no="+no);
//			model.setViewName("common/msg");
//			return model;
//		}
//		
//		model.addObject("question",question);
//		model.setViewName("admin/ad_questionUpdate");
//		
//		return model;
//	}
//	@PostMapping("/admin/question/update")
//	public ModelAndView questionUpdate(@RequestParam int no,
//									ModelAndView model,
//									@ModelAttribute Question question) {
//		
//		System.out.println(question);
//		int result = service.updateQuestion(question);
//		
//		if(result > 0) {
//			model.addObject("msg","문의 수정 완료");
//			model.addObject("location","/admin/question/view?no="+no);
//		}else{
//			model.addObject("msg","문의 수정 실패");
//			model.addObject("location","/admin/question/view?no="+no);
//		}
//		model.setViewName("common/msg");
//		return model;
//	}
		
	@GetMapping("/admin/answer")
	public ModelAndView answering(@RequestParam("no")int no,ModelAndView model,
			@AuthenticationPrincipal Member member) {
		if (member.getM_authority().equals("ROLE_ADMIN")) {
			
		Question question = service.getQuestionView(no);
		model.addObject("question", question);
		model.setViewName("admin/ad_questionAnswer");
		
		}else {
			model.addObject("msg","관리자만 답변 가능합니다.");
			model.addObject("location","/");
		}
		
		return model;
	}
	
	@PostMapping("/admin/answer")
	public ModelAndView answering(@RequestParam("no")int no,
							ModelAndView model,
							@ModelAttribute Answer answer,
							@AuthenticationPrincipal Member member) {
		
		answer.setA_m_no(member.getM_no());
		answer.setQ_no(no);
		int result = service.insertAnswer(answer);
		
		if(answer.getA_no() != 0) {
			int updateQs = service.updateQnA(answer);
		}
		
		if(result > 0) {
			model.addObject("msg","답변 작성 완료");
			model.addObject("location","/admin/question/view?no="+no);
		}else{
			model.addObject("msg","답변 작성 실패");
			model.addObject("location","/admin/question/view?no="+no);
		}
		
		model.setViewName("common/msg");
		return model;
	}
	
	@GetMapping("/admin/answer/update")
	public ModelAndView answerUpdate(@RequestParam("no") int no, ModelAndView model) {

		Question question = service.getQuestionView(no);

		if (question.getQ_status().equals("Y")) {
			Answer answer = service.getAnswer(question.getQ_no());
			model.addObject("answer", answer);
		}

		model.addObject("question", question);
		model.setViewName("admin/ad_answerUpdate");

		return model;
	}
	
	@PostMapping("/admin/answer/update")
	public ModelAndView answerUpdate(@RequestParam("no") int no,
									ModelAndView model,
									@ModelAttribute Answer answer) {
		System.out.println(answer);
		
		int result = service.answerUpdate(answer);
		
		if(result > 0) {
			model.addObject("msg","답변 수정 완료");
			model.addObject("location","/admin/question/view?no="+no);
		}else{
			model.addObject("msg","답변 수정 실패");
			model.addObject("location","/admin/question/view?no="+no);
		}
		
		model.setViewName("common/msg");
		return model;
	}
	
	
	
	@RequestMapping(value = "/singlephoto", method = RequestMethod.POST)
	public String simpleImageUploader(
		HttpServletRequest req, PhotoVo smarteditorVO) 
        	throws UnsupportedEncodingException{
	String callback = smarteditorVO.getCallback();
	String callback_func = smarteditorVO.getCallback_func();
	String file_result = "";
	String result = "";
	MultipartFile multiFile = smarteditorVO.getFiledata();
	try{
		if(multiFile != null && multiFile.getSize() > 0){
			if(multiFile.getContentType().toLowerCase().startsWith("image/")){
            	String oriName = multiFile.getName();
                String uploadPath = req.getServletContext().getRealPath("/img");
                String path = uploadPath + "/smarteditor/";
                File file = new File(path);
                if(!file.exists()){
                file.mkdirs();
                }
                String fileName = UUID.randomUUID().toString();
                smarteditorVO.getFiledata().transferTo(new File(path + fileName));
//                int imgresult = service.updateImgname(fileName);
                file_result += "&bNewLine=true&sFileName=" + oriName + 
                			   "&sFileURL=/img/smarteditor/" + fileName;
			}else{
				file_result += "&errstr=error";
			}
		}else{
			file_result += "&errstr=error";
		}
	} catch (Exception e){
		e.printStackTrace();
	}
	result = "redirect:" + callback + 
			 "?callback_func=" + URLEncoder.encode(callback_func,"UTF-8") + file_result;
	System.out.println("rs="+result);
	return result;
}
	
	
}

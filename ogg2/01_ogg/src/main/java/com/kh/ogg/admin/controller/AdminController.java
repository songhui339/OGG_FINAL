package com.kh.ogg.admin.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ogg.admin.model.mapper.AdminMapper;
import com.kh.ogg.admin.model.service.AdminService;
import com.kh.ogg.admin.model.vo.Answer;
import com.kh.ogg.admin.model.vo.Notice;
import com.kh.ogg.admin.model.vo.PhotoVo;
import com.kh.ogg.admin.model.vo.Question;
import com.kh.ogg.common.util.MultipartFileUtil;
import com.kh.ogg.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {

	@Autowired
	private AdminService service;
	
	@Autowired
	private AdminMapper mapper;
	
	
	@GetMapping("/admin/home")
	public String goAdmin() {
//		List<MemberAD> list = service.getMemberList();
		
//		model.addObject("list",list);
//		model.setViewName("admin/ad_main");
		
		return "admin/ad_main";
	}
//	@GetMapping("/admin/home")
//	public ModelAndView goAdmin(ModelAndView model) {
////		List<MemberAD> list = service.getMemberList();
//		
////		model.addObject("list",list);
//		model.setViewName("admin/ad_main");
//		
//		return model;
//	}
	
	@GetMapping("/admin/OTT")
	public String goOTT() {
		
		return "admin/ad_OTT";
	}
	
	@GetMapping("/admin/member")
	public String goMember() {
		
		return "admin/ad_member";
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
	public String noticeWrite() {
		
		return "/admin/ad_noticeWrite";
	}
	
	@PostMapping("/notice/write")
	public ModelAndView noticeWrite(@ModelAttribute Notice notice,ModelAndView model) {
		
		System.out.println(notice);
		int result = service.noticeSave(notice);
		System.out.println(notice.getN_no());
		
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
	public ModelAndView noticeUpdate(@RequestParam("no")int no, ModelAndView model) {
		
		Notice notice = service.getNoticeView(no);
		
		model.addObject("notice",notice);
		model.setViewName("admin/ad_noticeUpdate");
		
		return model;
	}
	
	@PostMapping("/notice/update")
	public ModelAndView noticeUpdate(@ModelAttribute Notice notice,ModelAndView model, HttpServletRequest rq) {
		
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
	public ModelAndView deleteNotice(@RequestParam("no") int no,ModelAndView model) {
		
		System.out.println(no);
		int result = service.deleteNotice(no);
		
		if(result > 0) {
			model.addObject("msg","공지사항 삭제 성공");
			model.addObject("location","/admin/notice");
		}else{
			model.addObject("msg","공지사항 삭제 실패");
			model.addObject("location","/admin/notice/view?no="+no);
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

		if(question.getQ_status().equals("Y")) {
			Answer answer = service.getAnswer(question.getQ_no());
			model.addObject("answer",answer);
		}
		
		model.addObject("question", question);
		model.setViewName("admin/ad_questionView");

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

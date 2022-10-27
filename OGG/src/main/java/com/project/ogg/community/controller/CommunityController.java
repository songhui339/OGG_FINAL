package com.project.ogg.community.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.ogg.common.model.Common;
import com.project.ogg.common.util.MultipartFileUtil;
import com.project.ogg.common.util.PageInfo;
import com.project.ogg.community.model.service.CommunityReplyService;
import com.project.ogg.community.model.service.CommunityService;
import com.project.ogg.community.model.vo.Community;
import com.project.ogg.community.model.vo.CommunityReply;
import com.project.ogg.member.model.vo.Member;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService service;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@Autowired
	private CommunityReplyService replyService;
	
	// 게시글 리스트
	@GetMapping("/community/list.do")
	public ModelAndView list(ModelAndView model,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "sType", defaultValue = "") String sType,
			@RequestParam(value = "sValue", defaultValue = "") String sValue,
			HttpServletRequest request) {
		
		List<Community> list = null;
		PageInfo pageInfo = null;
		
		Common common = new Common();
		String preventSearchValue = "";
		String preventSearchType = "";
		
		// 조회 조건 설정
		common.setSType(sType);
		common.setSValue(sValue);
		
		// 페이징 설정
		pageInfo = new PageInfo(page, 10, service.getBoardCount(common), 10);
		
		// 조회 조건 기입 후 검색 시 직전 검색 데이터 jsp로 return
		if ( !StringUtils.isEmpty(sValue) ) {
			preventSearchType = sType;
			preventSearchValue = sValue;
		}
		list = service.getBoardList(pageInfo, common);
		
	    model.addObject("list", list);
	    model.addObject("pageInfo", pageInfo);
	    model.addObject("preventSearchType", preventSearchType);
	    model.addObject("preventSearchValue", preventSearchValue);
	    
	    model.setViewName("community/list");

	    return model;
	}
	
	// 게시글 상세보기
	@GetMapping("/community/view.do")
	public ModelAndView view (ModelAndView model, @RequestParam int c_no) {
		
		Community community = null;
		community = service.findCommunityByNo(c_no);
		
		// 댓글 수
		int cr_replyCount = service.replyCount(c_no);
		community.setCr_replyCount(cr_replyCount);
		
		// 댓글
		List<CommunityReply> communityReply = null;
		communityReply = replyService.communityReplyList(c_no);
		
		model.addObject("communityReply", communityReply);
		
		// 조회수
		int communityCount = service.communityViewcount(c_no);
		community.setC_viewCount(communityCount);
		
		// 화면 출력
		model.addObject("community", community);
		model.setViewName("community/view");
		
		return model;
	}
	
	// 게시글 작성
	@GetMapping("/community/goWrite.do")
	public String write(@AuthenticationPrincipal Member member) {
		
		return "community/write";
	}
	
	@PostMapping("/community/write.do")
	public ModelAndView write(ModelAndView model, 
							  @ModelAttribute Community community,
							  @RequestParam("upfile") MultipartFile upfile,
							  @AuthenticationPrincipal Member member) {

		int result = 0;
		
		if(upfile != null && !upfile.isEmpty()) {
			String location = null;
			String renamedFileName = null;
			
			try {
				location = resourceLoader.getResource("resources/upload/community").getFile().getPath();
				renamedFileName = MultipartFileUtil.save(upfile, location);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if (renamedFileName != null) {
				community.setC_file(upfile.getOriginalFilename());
				community.setC_fileRename(renamedFileName);
			}
		}
		
		// 게시글 저장
		community.setC_writerNo(member.getM_no());
		result = service.insertCommunity(community);
		
		if (result > 0) {
			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			model.addObject("location", "/community/view.do?c_no=" + community.getC_no());
		} else {
			model.addObject("msg", "게시글 등록을 실패하였습니다.");
			model.addObject("location", "/community/goWrite.do");
			
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	// 파일 다운
	@GetMapping("/community/fileDown.do")
	public ResponseEntity<Resource> fileDown(
			@RequestHeader("user-agent") String userAgent,
			@RequestParam String oname, @RequestParam String rname) {
		
		Resource resource = null;
		String downFileName = null;

		try {
			resource = resourceLoader.getResource("resources/upload/community/" + rname);

			if(userAgent.indexOf("MSIE") != -1 || userAgent.indexOf("Trident") != -1) {
				downFileName = URLEncoder.encode(oname, "UTF-8").replaceAll("\\+", "%20");
			} else {
				downFileName = new String(oname.getBytes("UTF-8"), "ISO-8859-1");
			}
			
			return ResponseEntity.ok()
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM_VALUE)
					.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + downFileName)
					.body(resource);
		} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
		}
		
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		
	}
	
	// 게시글 삭제
	@GetMapping("/community/delete.do")
	public ModelAndView delete(ModelAndView model,
							  @AuthenticationPrincipal Member member, // 현재 로그인한 회원 정보
							  @RequestParam int c_no) {
		
		int result = 0;
		Community community = null;
		community = service.findCommunityByNo(c_no);
		
		if(community.getC_writerNo() == member.getM_no()) { // 작성자 회원번호 = 로그인한 회원의 번호
			result = service.communityDelete(c_no);
			
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
				model.addObject("location", "/community/list.do");
			} else {
				model.addObject("msg", "게시글 삭제를 실패하였습니다.");
				model.addObject("location", "/community/view.do?c_no=" + c_no);
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/community/list.do");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	// 게시글 수정
	@GetMapping("/cummunity/goModify.do")
	public ModelAndView update(ModelAndView model,
							   @RequestParam("c_no")int c_no,
							   @AuthenticationPrincipal Member member) {
		
		Community community = null;
		
		community = service.findCommunityByNo(c_no);
		
		if(community.getC_writerNo() == member.getM_no()) {
			model.addObject("community", community);
			model.setViewName("community/modify");
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/community/list.do");
			model.setViewName("common/msg");
		}
		
		return model;
	}
	
	@PostMapping("/community/modify.do")
	public ModelAndView modify(ModelAndView model,
							   @ModelAttribute Community community,
							   @RequestParam("upfile") MultipartFile upfile,
							   @AuthenticationPrincipal Member member) {
		
		int result = 0;
		String location = null;
		String c_fileRename = null;
		
		// 작성자 확인
		if(community.getC_writerNo() == member.getM_no()) {
			
			// 파일 수정
			if(upfile != null && !upfile.isEmpty()) {
				try {
					
					location = resourceLoader.getResource("resources/upload/community").getFile().getPath(); 
					
					if(community.getC_fileRename() != null) {
						// 이전에 업로드 된 첨부 파일이 존재하면 삭제
						MultipartFileUtil.delete(location + "/" + community.getC_fileRename());
					}
					
					c_fileRename = MultipartFileUtil.save(upfile, location);
					
					if(c_fileRename != null) {
						community.setC_file(upfile.getOriginalFilename());
						community.setC_fileRename(c_fileRename);
					}
					
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			// DB
			result = service.insertCommunity(community);
			
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
				model.addObject("location", "/community/view.do?c_no=" + community.getC_no());
			} else {
				model.addObject("msg", "게시글 수정을 실패하였습니다.");
				model.addObject("location", "/community/view.do?c_no=" + community.getC_no());
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/community/goList.do");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@RequestMapping(value="resources/summerimages", method=RequestMethod.POST)
	public ResponseEntity<?> summerimage(@RequestParam("file") MultipartFile img, HttpServletRequest request) throws IOException {
		String path = request.getServletContext().getRealPath("resources/theme/summerimages");
		Random random = new Random();
	
		long currentTime = System.currentTimeMillis();
		int	randomValue = random.nextInt(100);
		String fileName = Long.toString(currentTime) + "_"+randomValue+"_a_"+img.getOriginalFilename();
		
		File file = new File(path , fileName);
		img.transferTo(file);
		return ResponseEntity.ok().body("resources/summerimages/"+fileName);

	}
	
}	
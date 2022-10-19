package com.project.ogg.review.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.ogg.review.model.mapper.ReviewCmtMapper;
import com.project.ogg.review.model.vo.ReviewCmt;

@Service
public class ReviewCmtServiceImpl implements ReviewCmtService {

	@Autowired
	private ReviewCmtMapper mapper;

	@Override
	public ReviewCmt getCmtByCmtNo(int cmtNo) {
		return mapper.selectCmtByCmtNo(cmtNo);
	}
	
	@Override
	@Transactional
	public int updateCmtCount(int rvNo) {
		return mapper.updateCmtCount(rvNo);
	}

	@Override
	@Transactional
	public int cmtWrite(ReviewCmt cmt) {
		return mapper.writeCmt(cmt);
	}

	@Override
	@Transactional
	public int cmtUpdate(ReviewCmt cmt) {
		return mapper.updateCmt(cmt);
	}
}

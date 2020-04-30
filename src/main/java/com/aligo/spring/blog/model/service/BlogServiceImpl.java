package com.aligo.spring.blog.model.service;

import static com.aligo.spring.common.BlogCommon.blogCode;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aligo.spring.blog.model.dao.BlogDao;
import com.aligo.spring.blog.model.vo.BFile;
import com.aligo.spring.blog.model.vo.Blog;
import com.aligo.spring.theme.model.vo.PageInfo;
import com.aligo.spring.theme.model.vo.SearchCondition;

@Service("blService")
public class BlogServiceImpl implements BlogService {
	
	@Autowired
	private BlogDao blDao = new BlogDao();
	
	public int insertImg(BFile bf) {
		int cl = blDao.getBCount(bf);
		if(cl == 0) {
			return  cl = blDao.insertImg(bf);
		}else if(cl >= 1) {
			return cl = blDao.updateImg(bf);
		}
		return cl;
	}

	@Override
	public int getBNum() {
		return blDao.getBNum();
	}

	@Override
	public int insertBlog(Blog b, int bNum){
			b = blogCode(b);
			
			if(BFile.getbModifyFile() != null) {
				b.setbFileStatus("Y");
				BFile.setbModifyFile(null);
				BFile.setbCodeNumber(0);
				BFile.setbOriginalFile(null);
				return blDao.insertBlog(b);
			}else {
				b.setbFileStatus("N");
				return blDao.insertBlog(b);
			}
	}

	@Override
	public int getListCount(SearchCondition sc) {
		return blDao.getListCount(sc);
	}

	@Override
	public ArrayList<Blog> selectList(PageInfo pi,SearchCondition sc) {
		return blDao.selectList(pi,sc);
	}

	@Override
	public void insertMyReview(Blog b) {
		blDao.insertMyReview(b);
	}

	@Override
	public Blog selectBlog(int bId) {
		blDao.updateCount(bId);
		return blDao.selectBlog(bId);
	}

	@Override
	public int getSearchListCount(SearchCondition sc) {
		return blDao.getSearchListCount(sc);
	}

	@Override
	public ArrayList<Blog> selectSearchList(PageInfo pi, SearchCondition sc) {
		return blDao.selectSearchList(pi,sc);
	}

	@Override
	public BFile getFile(int bId) {
		return blDao.getFile(bId);
	}

	@Override
	public int updateLike(HashMap<String, String> map) {
		return blDao.updateLike(map);
	}

	@Override
	public int updateBlog(Blog b) {
		return blDao.updateBlog(b);
	}

	@Override
	public int deleteBlog(Blog b) {
		return blDao.deleteBlog(b);
	}
}

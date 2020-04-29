package com.aligo.spring.blog.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aligo.spring.blog.model.dao.BlogDao;
import com.aligo.spring.blog.model.vo.BFile;
import com.aligo.spring.blog.model.vo.Blog;
import com.aligo.spring.common.AligoException;
import com.aligo.spring.theme.model.vo.PageInfo;

import static com.aligo.spring.common.BlogCommon.*;

import java.util.ArrayList;

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
			
			int chk = blDao.checkFile(bNum);
			
			BFile bf = fileCheck(b,bNum,chk);
			
			if(chk == 0) {
				if(bf != null) {
					blDao.insertImg(bf);
				}
			}
			return blDao.insertBlog(b);
	}

	@Override
	public int getListCount() {
		return blDao.getListCount();
	}

	@Override
	public ArrayList<Blog> selectList(PageInfo pi) {
		return blDao.selectList(pi);
	}
}

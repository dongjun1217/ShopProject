package com.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.MemberDAO;
import com.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	MemberDAO dao;
	
	public MemberDTO login(Map<String, String> map) {
		
		MemberDTO dto = dao.login(map);
		return dto;
	}//end idCheck
	
	
	public int idCheck(String userid) {
		int count = dao.idCheck(userid);
		return count;
	}// end idCheck

	public int memberAdd(MemberDTO dto) {

		int n = dao.memberAdd(dto);

		return n;
	}// end memberAdd
	
	public MemberDTO mypage(String userid) {

		MemberDTO dto = dao.mypage(userid);

		return dto;
	}// end idCheck
	
	public String idSearch(MemberDTO dto) {
		String  userid = dao.idSearch(dto);
	
		return userid;
	}

  public int memberUpdate(MemberDTO dto) {
		  
			 int n = dao.memberUpdate(dto);
			 
		  return n;
	   }//end memberUpdate
  
  public String passwdSearch(MemberDTO dto) {
		String  passwd = dao.passwdSearch(dto);
	
		return passwd;
	}
  
  public int memberDelete(String userid) {
	  int m  = dao.memberDelete(userid);
		return m;
	}
  

}// end class

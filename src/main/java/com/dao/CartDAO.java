package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.CartDTO;
import com.dto.OrderDTO;

@Repository
public class CartDAO {

	
	@Autowired
	SqlSessionTemplate session;

	public int cartAdd(CartDTO dto) {
		int n = session.insert("CartMapper.cartAdd", dto);
		return n;
	}
	
	public List<CartDTO> cartList(String userid) {
		List<CartDTO> list = session.selectList("CartMapper.cartList", userid);
		return list;
	}
	
	public int cartUpdate(Map<String, Integer> map) {
		int n = session.update("CartMapper.cartUpdate", map);
		return n;
	}
	
	public int cartDel(int num) {
		int n = session.delete("CartMapper.cartDel", num);
		return n;
	}
	
	public int cartDel2(int num) {
		int n = session.delete("CartMapper.cartDel2", num);
		return n;
	}
	
	public int cartDelAll(List<String> list) {
		int n = session.delete("CartMapper.cartDelAll", list);
		return n;
	}
	
	public CartDTO cartbyNum(String num) {
		CartDTO list = session.selectOne("CartMapper.cartbyNum", num);
		return list;
	}
	
	public int orderDone(OrderDTO dto) {
		int n = session.insert("CartMapper.orderDone", dto);
		return n;
	}

	public List<CartDTO> orderAllConfirm(List<String> list) {
		List<CartDTO> n = session.selectList("CartMapper.orderAllConfirm", list);
		return n;
	}
	
	public int orderAllDone(List<OrderDTO> x) {
		int n = session.insert("CartMapper.orderAllDone", x);
		return n;
	}
	public List<OrderDTO> orderListDetail(String userid) {
		List<OrderDTO> list = session.selectList("CartMapper.orderList2", userid);
		return list;
	}
	
	public List<OrderDTO> orderselect(int num) {
		List<OrderDTO> list = session.selectList("CartMapper.order", num);
		return list;
	}

}

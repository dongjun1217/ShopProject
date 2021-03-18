package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CartDAO;
import com.dto.CartDTO;
import com.dto.OrderDTO;

@Service
public class CartService {

	@Autowired
	CartDAO dao;

	public int cartAdd(CartDTO dto) {

		int n = dao.cartAdd(dto);

		return n;
	}// end cartAdd

	public List<CartDTO> cartList(String userid) {
		List<CartDTO> list = dao.cartList(userid);

		return list;
	}// end idCheck

	public int cartUpdate(Map<String, Integer> map) {

		int n = dao.cartUpdate(map);

		return n;
	}// end cartAdd

	public int cartDel(int num) {

		int n = dao.cartDel(num);

		return n;
	}// end cartAdd
	
	public int cartDel2(int num) {

		int n = dao.cartDel2(num);

		return n;
	}// end cartAdd

	public int cartDelAll(List<String> list) {

		int n = dao.cartDelAll(list);

		return n;
	}// end cartAdd

	public CartDTO cartbyNum(String num) {

		CartDTO dto = dao.cartbyNum(num);

		return dto;
	}// end idCheck

	public int orderDone(OrderDTO dto, String orderNum) {

		int n = dao.orderDone(dto); // order에 주문정보저장
		n = dao.cartDel(Integer.parseInt(orderNum)); // cart에서 해당 주문내역 삭제 장바구니 주문시 장비구니 목록에서 삭제

		return n;
	}// end cartAdd

	public List<CartDTO> orderAllConfirm(List<String> x) {

		List<CartDTO> list = dao.orderAllConfirm(x);

		return list;
	}// end idCheck

	public int orderAllDone(List<OrderDTO> x, List<String> nums) {

		int n = 0;
		n = dao.orderAllDone(x);
		n = dao.cartDelAll(nums);

		return n;
	}// end cartAdd
	
	
	public List<OrderDTO> orderListDetail(String userid) {
		List<OrderDTO> list = dao.orderListDetail(userid);

		return list;
	}// end idCheck
	
	public List<OrderDTO> orderselect(int num) {
		List<OrderDTO> list = dao.orderselect(num);

		return list;
	}// end idCheck
}// end class

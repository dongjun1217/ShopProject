package com.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.MemberDTO;
import com.dto.OrderDTO;
import com.service.CartService;
import com.service.GoodsService;
import com.service.MemberService;

@Controller
public class GoodsController {

	@Autowired
	GoodsService goodsService;

	@Autowired
	CartService cartService;

	@Autowired
	MemberService memberService;

	@RequestMapping("/cartOrderAllDone")
	// @ModelAttribute를사용해서 넘겨서 받는 파라미터의 이름을 설정가능 안쓰면 자동으로 기본것으로 설정
	public String cartOrderAllDone(HttpServletRequest request, HttpSession session, Model m) {
		String[] nums = request.getParameterValues("num");
		String orderName = request.getParameter("orderName");
		String post = request.getParameter("post");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String phone = request.getParameter("phone");
		String payMethod = request.getParameter("payMethod");
		List<String> list = Arrays.asList(nums);
		List<CartDTO> cList = cartService.orderAllConfirm(list);
		// 최종적으로 list에 저장
		List<OrderDTO> oList = new ArrayList<OrderDTO>();
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		String userid = dto.getUserid();
		for (CartDTO cDTO : cList) {
			OrderDTO oDTO = new OrderDTO();
			oDTO.setUserid(userid);
			oDTO.setNum(cDTO.getNum());
			oDTO.setgCode(cDTO.getgCode());
			oDTO.setgName(cDTO.getgName());
			oDTO.setgPrice(cDTO.getgPrice());
			oDTO.setgAmount(cDTO.getgAmount());
			oDTO.setgSize(cDTO.getgSize());
			oDTO.setgColor(cDTO.getgColor());
			oDTO.setgImage(cDTO.getgImage());
			oDTO.setOrderName(orderName);
			oDTO.setPost(post);
			oDTO.setAddr1(addr1);
			oDTO.setAddr2(addr2);
			oDTO.setPhone(phone);
			oDTO.setPayMethod(payMethod);
			System.out.println(oDTO);
			oList.add(oDTO);
		}
		int n = cartService.orderAllDone(oList, list);
		m.addAttribute("orderAllDone", oList);
		return "orderAllDone";
	}

	@RequestMapping("/cartOrderAllConfirm")
	// @ModelAttribute를사용해서 넘겨서 받는 파라미터의 이름을 설정가능 안쓰면 자동으로 기본것으로 설정
	public String cartOrderAllConfirm(HttpServletRequest request, HttpSession session, Model m) {
		String[] checks = request.getParameterValues("check");
		// 배열을 list로 변환
		List<String> list = Arrays.asList(checks);
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		String userid = dto.getUserid();
		////
		List<CartDTO> cList = cartService.orderAllConfirm(list);
		MemberDTO mDTO = memberService.mypage(userid);

		m.addAttribute("cartList", cList);
		m.addAttribute("memberDTO", mDTO);

		return "orderAllConfirm";
	}

	@RequestMapping("/cartOrderDone")
	// @ModelAttribute를사용해서 넘겨서 받는 파라미터의 이름을 설정가능 안쓰면 자동으로 기본것으로 설정
	public String cartOrderDone(@ModelAttribute("oDTO") OrderDTO oDTO, HttpSession session,
			@RequestParam("orderNum") String orderNum) {
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		String userid = dto.getUserid();
		oDTO.setUserid(userid);
		cartService.orderDone(oDTO, orderNum);
		return "orderDone";
	}

	@RequestMapping("/cartOrderConfirm")
	public ModelAndView cartOrderConfirm(@RequestParam("num") String num, HttpSession session) {
		CartDTO cDTO = cartService.cartbyNum(num);
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		String userid = dto.getUserid();
		MemberDTO mDTO = memberService.mypage(userid);

		ModelAndView mav = new ModelAndView();
		mav.addObject("cDTO", cDTO);
		mav.addObject("mDTO", mDTO);
		mav.setViewName("orderConfirm");

		return mav;
	}

	@RequestMapping("/cartDelAll")
	public String cartDelAll(HttpServletRequest request) {
		String[] checks = request.getParameterValues("check");
		System.out.println(Arrays.toString(checks));
		// 배열을 list로 변환
		List<String> list = Arrays.asList(checks);
		cartService.cartDelAll(list);
		return "redirect:/cartList";
	}

	@RequestMapping("/cartDelete")
	@ResponseBody
	public void cartDelete(@RequestParam("num") int num) {
		cartService.cartDel(num);
	}

	@RequestMapping("/cartUpdate")
	@ResponseBody // ajax는 필수
	public void cartUpdate(@RequestParam Map<String, Integer> map) {
		cartService.cartUpdate(map);

	}

	@RequestMapping("/cartList")
	public String cartList(HttpSession session, Model m) {
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		String page = "";
		if (mDTO != null) {
			List<CartDTO> cartList = cartService.cartList(mDTO.getUserid());
			m.addAttribute("cartList", cartList);
			page = "cartList";// cartList.jsp
		} else {
			m.addAttribute("mesg", "로그인이 필요한 기능입니다. 로그인 후 다시 요청 하세요");
			page = "loginForm";
		}
		return page;
	}

	@RequestMapping("/goodsCart")
	public String goodsCart(CartDTO cdto, HttpSession session, Model m) {
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		String page = "";
		if (mDTO != null) {
			cdto.setUserid(mDTO.getUserid());
			int num = cartService.cartAdd(cdto);
			page = "redirect:/goodsRetrieve?gCode=" + cdto.getgCode();
		} else {
			m.addAttribute("mesg", "로그인이 필요한 기능입니다. 로그인 후 다시 요청 하세요");
			page = "loginForm";
		}
		return page;
	}

	@RequestMapping("/goodsList")
	public String goodsList(@RequestParam(value = "gCategory", required = false, defaultValue = "top") String gCategory,
			Model m) {
		List<GoodsDTO> list = goodsService.goodsList(gCategory);
		m.addAttribute("goodsList", list);
		return "main";
	}

	@RequestMapping("/goodsRetrieve") // goodsRetrieve.jsp
	@ModelAttribute("goodsRetrieve")
	public GoodsDTO goodsRetrieve(@RequestParam("gCode") String gCode) {
		GoodsDTO gDTO = goodsService.goodsRetrieve(gCode);
		return gDTO;
	}

	@RequestMapping("/buyCart")
	public String buyCart(CartDTO cdto, HttpSession session, Model m) {
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		cdto.setUserid(mDTO.getUserid());
		int num = cartService.cartAdd(cdto);
		System.out.println(cdto.getNum());
		List<CartDTO> cartList = cartService.cartList(mDTO.getUserid());
		m.addAttribute("cartList", cartList);

		return "buyCart";
	}
	
	@RequestMapping("/orderListDetail")
	public String orderListDetail(HttpSession session, Model m) {
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		String page = "";
		if (mDTO != null) {
			List<OrderDTO> oDTO = cartService.orderListDetail(mDTO.getUserid());
			System.out.println(oDTO);
			m.addAttribute("oDTO", oDTO);
			page="orderListDetail";
			}
		 else {
			m.addAttribute("mesg", "로그인이 필요한 기능입니다. 로그인 후 다시 요청 하세요");
			page = "loginForm";
		}
		return page;
	}
	
	@RequestMapping("/cartDelete2")
	@ResponseBody
	public void cartDelete2(@RequestParam("num") int num) {
		cartService.cartDel2(num);
	}
	
	@RequestMapping("/orderselect")
	// @ModelAttribute를사용해서 넘겨서 받는 파라미터의 이름을 설정가능 안쓰면 자동으로 기본것으로 설정
	public String orderselect(@RequestParam("num") int num,HttpSession session, Model m) {
			MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
	String page = "";
	if (mDTO != null) {
		List<OrderDTO> oDTO = cartService.orderselect(num);
		System.out.println(oDTO);
		m.addAttribute("oDTO", oDTO);
		page = "orderselect";// cartList.jsp
	} else {
		m.addAttribute("mesg", "로그인이 필요한 기능입니다. 로그인 후 다시 요청 하세요");
		page = "loginForm";
	}
	return page;
	}
}

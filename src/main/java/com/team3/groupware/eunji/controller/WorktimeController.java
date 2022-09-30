package com.team3.groupware.eunji.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team3.groupware.common.model.EmployeeVO;
import com.team3.groupware.eunji.model.WorktimeVO;
import com.team3.groupware.eunji.service.WorktimeService;

@RestController
public class WorktimeController {

	@Inject
	WorktimeService worktimeService;
	
	// 근태관리 홈
	@GetMapping("/worktime")
	public ModelAndView worktime(WorktimeVO worktimeVo, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		
		int emp_num = 0;
		
		if(session.getAttribute("emp_num") != null) {
			String change = String.valueOf(session.getAttribute("emp_num"));
			System.out.println(change);
			emp_num = Integer.parseInt(change);
		}
		
		Map<String, Object> worktimeMap = worktimeService.select_vacation_days(emp_num);
		mv.addObject("worktimeMap", worktimeMap);
		mv.addObject("emp_num",session.getAttribute("emp_num"));
		mv.setViewName("/eunji/worktime/worktime");
		return mv;
	}
	
	// worktime 메인에서 출퇴근 현황 버튼 클릭 시 데이터가 출퇴근 현황 페이지에 출력될 수 있도록 
	@PostMapping("/worktime")
	public ModelAndView worktimeVies(WorktimeVO worktimeVo) {
		System.out.println(worktimeVo);
		Map<String, Object> worktimeMap = new HashMap<>();
		
		worktimeMap.put("worktime_go", worktimeVo.getWorktime_go());
		worktimeMap.put("worktime_out", worktimeVo.getWorktime_out());
		
		// 값이 있을 때 데이터 입력
		if(worktimeMap.values() != null) {
			worktimeService.insert(worktimeVo);
			return new ModelAndView("redirect:/worktime");
		// 값이 없을 때 데이터 입력 안됨
		} else {
			return new ModelAndView();
		}
		
	}
	
	// 출퇴근 현황
	@GetMapping("/worktime_view")
	public ModelAndView worktimeView(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		
		String change = String.valueOf(session.getAttribute("emp_num"));
		int emp_num = Integer.parseInt(change);
		
		List<WorktimeVO> list = worktimeService.worktime_view_select(emp_num);
		mv.addObject("worktime_view_list", list);
		mv.setViewName("/eunji/worktime/worktime_view");
		return mv;
	}
	
	// 휴가계 신청
	@GetMapping("/worktime_new")
	public ModelAndView worktimeNew(EmployeeVO employeeVo) {
		Map<String, Object> WorktimeNameMap = worktimeService.select_worktime_new_name(employeeVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("WorktimeNameMap", WorktimeNameMap);
		mv.setViewName("/eunji/worktime/worktime_new");
		return mv;
	}
	
	
	// 승인 대기중
	@GetMapping("/worktime_wait")
	public ModelAndView worktimeWait() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/eunji/worktime/worktime_wait");
		return mv;
	}
	
	// 진행준 문서
	@GetMapping("/worktime_ing")
	public ModelAndView worktimeIng() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/eunji/worktime/worktime_ing");
		return mv;
	}
	
	// 완료문서
	@GetMapping("/worktime_end")
	public ModelAndView worktimeEnd() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/eunji/worktime/worktime_end");
		return mv;
	}
	
	// 휴가계 신청 조직도 클릭 시 ajax
	@PostMapping("/worktime_dept")
	public ModelAndView deptList(@RequestBody Map<String, Object> map) {
		// 아래로부터 공통 내용 작성 이유 : 기안부서 DB에서 불러오기 위해
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", worktimeService.dept_name_list(map));
		mv.setViewName("/eunji/worktime/worktime_deptList");
		System.out.println(mv);
		return mv;
	}
	
	// 휴가계 종류 선택 시 휴가신청서 폼 변경
	// 연차
	@PostMapping("/worktime_vacation")
	public ModelAndView worktime_vacation(EmployeeVO employeeVo) {
		Map<String, Object> WorktimeNameMap = worktimeService.select_worktime_new_name(employeeVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("WorktimeNameMap", WorktimeNameMap);
		mv.setViewName("eunji/worktime/worktime_vacation");
		return mv;
	}
	// 반차
	@PostMapping("/worktime_halfway")
	public ModelAndView worktime_halfway(EmployeeVO employeeVo) {
		Map<String, Object> WorktimeNameMap = worktimeService.select_worktime_new_name(employeeVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("WorktimeNameMap", WorktimeNameMap);
		mv.setViewName("eunji/worktime/worktime_halfway");
		return mv;
	}
	// 병가
	@PostMapping("/worktime_sick_leave")
	public ModelAndView worktime_sick_leave(EmployeeVO employeeVo) {
		Map<String, Object> WorktimeNameMap = worktimeService.select_worktime_new_name(employeeVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("WorktimeNameMap", WorktimeNameMap);
		mv.setViewName("eunji/worktime/worktime_sick_leave");
		return mv;
	}
	// 조퇴
	@PostMapping("/worktime_early_departure")
	public ModelAndView worktime_early_departure(EmployeeVO employeeVo) {
		Map<String, Object> WorktimeNameMap = worktimeService.select_worktime_new_name(employeeVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("WorktimeNameMap", WorktimeNameMap);
		mv.setViewName("eunji/worktime/worktime_early_departure");
		return mv;
	}
	// 외출
	@PostMapping("/worktime_business_trip")
	public ModelAndView worktime_business_trip(EmployeeVO employeeVo) {
		Map<String, Object> WorktimeNameMap = worktimeService.select_worktime_new_name(employeeVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("WorktimeNameMap", WorktimeNameMap);
		mv.setViewName("eunji/worktime/worktime_business_trip");
		return mv;
	}
	
}

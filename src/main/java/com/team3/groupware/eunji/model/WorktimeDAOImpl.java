package com.team3.groupware.eunji.model;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.team3.groupware.common.model.EmployeeVO;

@Repository
public class WorktimeDAOImpl implements WorktimeDAO {
	
	@Inject
	SqlSessionTemplate session;

	@Override
	public void insert(WorktimeVO worktimeVo) {	
		session.insert("worktime.worktime_view_insert", worktimeVo);
		
	}

	@Override
	public List<WorktimeVO> worktime_view_select(int emp_num) {
		return session.selectList("worktime.worktime_view_select", emp_num);
	}

	
	@Override
	public Map<String, Object> select_vacation_days(int emp_num) {	
		return session.selectOne("worktime.worktime_vacation_days", emp_num);
	}

	// ajax dao 오버라이드
	@Override
	public List<EmployeeVO> dept_name_list(Map<String, Object> map ) {
		// TODO Auto-generated method stub
		return session.selectList("worktime.worktime_dept_info", map);
	}

	@Override
	public Map<String, Object> select_worktime_new_name(EmployeeVO employeeVo) {
		// TODO Auto-generated method stub
		return session.selectOne("worktime.worktime_emp_dept_name", employeeVo);
	}






}

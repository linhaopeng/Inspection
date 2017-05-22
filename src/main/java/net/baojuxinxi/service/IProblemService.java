package net.baojuxinxi.service;

import java.util.List;
import java.util.Map;

import net.baojuxinxi.pojo.PagedResult;
import net.baojuxinxi.pojo.Problem;
import net.baojuxinxi.pojo.ProblemAnnex;
import net.baojuxinxi.pojo.Result;

public interface IProblemService {

	List<ProblemAnnex> get_problem_img(String problemId);


	int saveattachmentList(List<ProblemAnnex> problemAnnexlist);

	PagedResult<Problem> selectPageList(Map<String, Object> map,
			Integer pageNo, Integer pageSize);

	int saveattachment(ProblemAnnex problemAnnex);

	Result save_problem(Problem problem);

}

package personal.wjb.csi.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import personal.wjb.csi.bean.DeptInf;
import personal.wjb.csi.bean.JobInf;
import personal.wjb.csi.common.util.AjaxResult;
import personal.wjb.csi.service.JobInfService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author wujiabin
 * @since 2019-09-09
 */
@Controller
@RequestMapping("/job")
public class JobInfController {

    @Autowired
    private JobInfService jobInfService;

    @RequestMapping("/toIndex")
    public String toIndex(){
        return "job/showJob";
    }

    @RequestMapping("/toAddJob")
    public String toAddJob(){
        return "job/addJob";
    }

    @RequestMapping("/toUpdateJob")
    public String toUpdateJob(Integer id, Map<String,Object> map){
        JobInf jobInf = jobInfService.selectById(id);
        map.put("jobInf",jobInf);
        return "job/updateJob";
    }


    @ResponseBody
    @RequestMapping("/getJobs")
    public AjaxResult getJobs(@RequestParam(value = "pageNo",defaultValue = "0") Integer pageNo,@RequestParam(value = "jobName",defaultValue = "") String jobName){
        try {
            PageHelper.startPage(pageNo,10);
            jobName = "%" + jobName + "%";
            List<JobInf> jobInfs = jobInfService.listAllJobInfs(jobName);
            PageInfo<JobInf> pageInfo = new PageInfo<>(jobInfs,5);
            return AjaxResult.success(null).add("pageInfo",pageInfo);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("获取职位列表失败！");
        }
    }

    @ResponseBody
    @RequestMapping("/checkJobName")
    public AjaxResult checkJobName(String name){
        try {
            if (name != null && name != "") {
                int b = jobInfService.selectCount(new EntityWrapper<JobInf>().eq("name",name));
                if(b == 0){
                    return AjaxResult.success(null);
                }else {
                    return AjaxResult.failed("职位名称已存在！");
                }
            }else{
                return AjaxResult.failed("职位名称不能为空！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("查询职位名称发生错误！");
        }
    }

    @ResponseBody
    @RequestMapping("/addNewJob")
    public AjaxResult addNewJob(JobInf jobInf){
        try {
            boolean insert = jobInfService.insert(jobInf);
            if (insert){
                return AjaxResult.success(null);
            }else{
                return AjaxResult.failed("添加职位失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("添加职位失败！");
        }
    }

    @ResponseBody
    @RequestMapping("/deleteJob")
    public AjaxResult deleteJob(String ids){
        boolean b = false;
        try {

            if(ids.contains("-")){
                String[] str = ids.split("-");
                List<Integer> idList = new ArrayList<>();
                for(String id : str){
                    idList.add(Integer.parseInt(id));
                }
                b = jobInfService.deleteBatchIds(idList);
                if(b){
                    return AjaxResult.success(null);
                }else{
                    return AjaxResult.failed("删除职位失败！");
                }
            }else{
                b = jobInfService.deleteById(Integer.parseInt(ids));
                if(b){
                    return AjaxResult.success(null);
                }else{
                    return AjaxResult.failed("删除职位失败！");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("删除职位失败！");
        }
    }

    @ResponseBody
    @RequestMapping("/updateJob")
    public AjaxResult updateJob(JobInf jobInf){
        try {
            boolean b = jobInfService.updateById(jobInf);
            if(b){
                return AjaxResult.success(null);
            }else{
                return AjaxResult.failed("更新职位失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("更新职位失败！");
        }
    }

    @ResponseBody
    @RequestMapping("/getJobsByDept")
    public AjaxResult getJobsByDept(Integer deptId){
        try {
            List<JobInf> jobInfs = jobInfService.selectList(new EntityWrapper<JobInf>().eq("dept_id", deptId));
            return AjaxResult.success(null).add("jobs",jobInfs);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("获取职位失败");
        }
    }

}


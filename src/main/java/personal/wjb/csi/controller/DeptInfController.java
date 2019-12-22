package personal.wjb.csi.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.aspectj.weaver.loadtime.Aj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import personal.wjb.csi.bean.DeptInf;
import personal.wjb.csi.common.util.AjaxResult;
import personal.wjb.csi.service.DeptInfService;

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
@RequestMapping("/dept")
public class DeptInfController {

    @Autowired
    private DeptInfService deptInfService;

    @RequestMapping("/toIndex")
    public String toIndex(){
        return "department/showDepartment";
    }

    @RequestMapping("/toAddDept")
    public String toAddDept(){
        return "department/addDepartment";
    }

    @RequestMapping("/toUpdateDept")
    public String toUpdateDept(Integer id, Map<String,Object> map){
        DeptInf deptInf = deptInfService.selectById(id);
        map.put("deptInf",deptInf);
        return "department/updateDepartment";
    }

    @ResponseBody
    @RequestMapping("/getDepts")
    public AjaxResult getDepts(){
        try {
            List<DeptInf> deptInfs = deptInfService.selectList(null);
            return AjaxResult.success(null).add("depts",deptInfs);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("获取部门列表失败");
        }
    }

    @ResponseBody
    @RequestMapping("/getDepartments")
    public AjaxResult getDepartments(@RequestParam(value = "pageNo",defaultValue = "1") Integer pageNo,String deptName){
        try {
            PageHelper.startPage(pageNo,10);
            deptName = "%"+deptName+"%";
            List<DeptInf> depts = deptInfService.listAllDepartments(deptName);
            PageInfo<DeptInf> pageInfo = new PageInfo<>(depts, 5);
            return AjaxResult.success(null).add("pageInfo",pageInfo);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("获取部门列表失败");
        }
    }

    @ResponseBody
    @RequestMapping("/checkDeptName")
    public AjaxResult checkDeptName(String name){
        try {
            if (name != null && name != "") {
                boolean b = deptInfService.getCountByDeptName(name);
                if(b){
                    return AjaxResult.success(null);
                }else {
                    return AjaxResult.failed("部门名已存在！");
                }
            }else{
                return AjaxResult.failed("部门名不能为空！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("查询部门名发生错误！");
        }
    }

    @ResponseBody
    @RequestMapping("/addNewDept")
    public AjaxResult addNewDept(DeptInf deptInf){
        try {
            boolean insert = deptInfService.addNewDept(deptInf);
            if (insert){
                return AjaxResult.success(null);
            }else{
                return AjaxResult.failed("添加部门失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("添加部门失败！");
        }
    }

    @ResponseBody
    @RequestMapping("/deleteDept")
    public AjaxResult deleteDept(String ids){
        boolean b = false;
        try {

            if(ids.contains("-")){
                String[] str = ids.split("-");
                List<Integer> idList = new ArrayList<>();
                for(String id : str){
                    idList.add(Integer.parseInt(id));
                }
                b = deptInfService.deleteBatchIds(idList);
                if(b){
                    return AjaxResult.success(null);
                }else{
                    return AjaxResult.failed("删除部门失败！");
                }
            }else{
                b = deptInfService.deleteById(Integer.parseInt(ids));
                if(b){
                    return AjaxResult.success(null);
                }else{
                    return AjaxResult.failed("删除部门失败！");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("删除部门失败！");
        }
    }

    @ResponseBody
    @RequestMapping("/updateDept")
    public AjaxResult updateDept(DeptInf deptInf){
        try {
            boolean b = deptInfService.updateById(deptInf);
            if(b){
                return AjaxResult.success(null);
            }else{
                return AjaxResult.failed("更新部门失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("更新部门失败！");
        }
    }
}


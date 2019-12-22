package personal.wjb.csi.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import personal.wjb.csi.bean.EmployeeInf;
import personal.wjb.csi.common.util.AjaxResult;
import personal.wjb.csi.service.EmployeeInfService;

import javax.validation.Valid;
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
@RequestMapping("/emp")
public class EmployeeInfController {

    @Autowired
    private EmployeeInfService employeeInfService;

    @RequestMapping("/toAddEmployee")
    public String toAddEmp(){
        return "employee/addEmployee";
    }

    @RequestMapping("/toIndex")
    public String toIndex(){
        return "employee/showEmployee";
    }

    @RequestMapping("/toUpdateEmp")
    public String toUpdateEmp(Integer id, Map<String,Object> map){
        EmployeeInf employeeInf = employeeInfService.getEmpById(id);
        map.put("empInf",employeeInf);
        return "employee/updateEmployee";
    }

    @ResponseBody
    @RequestMapping("/addNewEmp")
    public AjaxResult addNewEmp(@Valid EmployeeInf employeeInf, BindingResult result){
        try {
            if(result.hasErrors()){
                return AjaxResult.failed(result.getFieldError().getDefaultMessage());
            }else{
                boolean b = employeeInfService.addNewEmp(employeeInf);
                if(b){
                    return AjaxResult.success(null);
                }else{
                    return AjaxResult.failed("添加员工失败！");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("添加员工失败！");
        }

    }


    @ResponseBody
    @RequestMapping("/getEmp")
    public AjaxResult getEmp(@RequestParam(value = "pageNo",defaultValue = "1") Integer pageNo,EmployeeInf employeeInf){
        PageHelper.startPage(pageNo,10);
        List<EmployeeInf> employeeInfList = employeeInfService.listAllEmps(employeeInf);
        PageInfo<EmployeeInf> info = new PageInfo<>(employeeInfList, 5);
        return AjaxResult.success(null).add("pageInfo",info);
    }

    @ResponseBody
    @RequestMapping("/deleteEmp")
    public AjaxResult deleteEmp(String ids){
        boolean b = false;
        try {

            if(ids.contains("-")){
                String[] str = ids.split("-");
                List<Integer> idList = new ArrayList<>();
                for(String id : str){
                    idList.add(Integer.parseInt(id));
                }
                b = employeeInfService.deleteBatchIds(idList);
                if(b){
                    return AjaxResult.success(null);
                }else{
                    return AjaxResult.failed("删除员工失败！");
                }
            }else{
                b = employeeInfService.deleteById(Integer.parseInt(ids));
                if(b){
                    return AjaxResult.success(null);
                }else{
                    return AjaxResult.failed("删除员工失败！");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("删除员工失败！");
        }
    }

    @ResponseBody
    @RequestMapping("/updateEmp")
    public AjaxResult updateEmp(EmployeeInf employeeInf){
        try {
            boolean b = employeeInfService.updateById(employeeInf);
            if(b){
                return AjaxResult.success(null);
            }else{
                return AjaxResult.failed("更新员工信息失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("更新员工信息失败！");
        }
    }
}


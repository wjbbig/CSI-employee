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
import personal.wjb.csi.bean.NoticeInf;
import personal.wjb.csi.bean.UserInf;
import personal.wjb.csi.common.util.AjaxResult;
import personal.wjb.csi.common.util.Const;
import personal.wjb.csi.common.util.DateToStringUtil;
import personal.wjb.csi.service.NoticeInfService;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
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
@RequestMapping("/notice")
public class NoticeInfController {

    @Autowired
    private NoticeInfService noticeInfService;

    @RequestMapping("/toIndex")
    public String toIndex(){
        return "notice/showNotice";
    }

    @RequestMapping("/toAddNotice")
    public String toAddNotice(){
        return "notice/addNotice";
    }

    @RequestMapping("/toPreviewNotice")
    public String toPreviewNotice(Integer id,Map<String,Object> map){
        NoticeInf noticeInf = noticeInfService.selectById(id);
        map.put("noticeInf",noticeInf);
        return "notice/previewNotice";
    }

    @RequestMapping("/toUpdateNotice")
    public String toUpdateNotice(Integer id, Map<String,Object> map){
        NoticeInf noticeInf = noticeInfService.selectById(id);
        map.put("noticeInf",noticeInf);
        return "notice/updateNotice";
    }

    @ResponseBody
    @RequestMapping("/checkNoticeTitle")
    public AjaxResult checkNoticeTitle(String title){
        try {
            if (title != null && title != "") {
                int b = noticeInfService.selectCount(new EntityWrapper<NoticeInf>().eq("title",title));
                if(b == 0){
                    return AjaxResult.success(null);
                }else {
                    return AjaxResult.failed("公告已存在！");
                }
            }else{
                return AjaxResult.failed("公告名称不能为空！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("查询公告发生错误！");
        }
    }

    @ResponseBody
    @RequestMapping("/addNewNotice")
    public AjaxResult addNewNotice(NoticeInf noticeInf){
        try {
            noticeInf.setCreateDate(DateToStringUtil.dataToStringYMD(new Date()));
            boolean insert = noticeInfService.insert(noticeInf);
            if (insert){
                return AjaxResult.success(null);
            }else{
                return AjaxResult.failed("添加公告失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("添加公告失败！");
        }
    }

    @ResponseBody
    @RequestMapping("/getNotices")
    public AjaxResult getNotices(@RequestParam(value = "pageNo",defaultValue = "1") Integer pageNo,@RequestParam(value = "title",defaultValue = "") String title){
            PageHelper.startPage(pageNo,10);
            title = "%"+title+"%";
            List<DeptInf> notices = noticeInfService.listAllNotices(title);
            PageInfo<DeptInf> pageInfo = new PageInfo<>(notices, 5);
            return AjaxResult.success(null).add("pageInfo",pageInfo);

    }

    @ResponseBody
    @RequestMapping("/deleteNotice")
    public AjaxResult deleteNotice(String ids){
        boolean b = false;
        try {

            if(ids.contains("-")){
                String[] str = ids.split("-");
                List<Integer> idList = new ArrayList<>();
                for(String id : str){
                    idList.add(Integer.parseInt(id));
                }
                b = noticeInfService.deleteBatchIds(idList);
                if(b){
                    return AjaxResult.success(null);
                }else{
                    return AjaxResult.failed("删除公告失败！");
                }
            }else{
                b = noticeInfService.deleteById(Integer.parseInt(ids));
                if(b){
                    return AjaxResult.success(null);
                }else{
                    return AjaxResult.failed("删除公告失败！");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("删除公告失败！");
        }
    }

    @ResponseBody
    @RequestMapping("/updateNotice")
    public AjaxResult updateDept(NoticeInf noticeInf){
        try {
            boolean b = noticeInfService.updateById(noticeInf);
            if(b){
                return AjaxResult.success(null);
            }else{
                return AjaxResult.failed("更新公告失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("更新公告失败！");
        }
    }


}


package personal.wjb.csi.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import personal.wjb.csi.bean.DocumentInf;
import personal.wjb.csi.common.util.AjaxResult;
import personal.wjb.csi.common.util.DateToStringUtil;
import personal.wjb.csi.service.DocumentInfService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author wujiabin
 * @since 2019-09-09
 */
@Controller
@RequestMapping("/document")
public class DocumentInfController {

    @Autowired
    private DocumentInfService documentInfService;

    @RequestMapping("/toIndex")
    public String toIndex(){
        return "document/showDocument";
    }

    @RequestMapping("/toAddDocument")
    public String toAddDocument(){
        return "document/addDocument";
    }

    @RequestMapping("/toUpdateDocument")
    public String toUpdateDocument(Integer id, Map<String,Object> map){
        DocumentInf documentInf = documentInfService.selectById(id);
        map.put("documentInf",documentInf);
        return "document/updateDocument";
    }

    @ResponseBody
    @RequestMapping("/addDocument")
    public AjaxResult addDocument(DocumentInf documentInf, HttpServletRequest request, HttpSession session){
        try {
            MultipartHttpServletRequest req = (MultipartHttpServletRequest) request;
            MultipartFile file = req.getFile("document");
            String originalName = file.getOriginalFilename();
            String extName = originalName.substring(originalName.lastIndexOf(".")); //后缀名
            String fileName = UUID.randomUUID().toString() + extName; //重新拼装的名字，防止名字重复
            String realPath = session.getServletContext().getRealPath("/document");
            String path = realPath+ "\\word\\" + fileName;
            System.out.println(path);
            file.transferTo(new File(path));
            documentInf.setCreateDate(DateToStringUtil.dataToStringYMD(new Date()));
            documentInf.setFileName(fileName);
            boolean b = documentInfService.insert(documentInf);
            if(b){
                return AjaxResult.success(null);
            }else{
                return AjaxResult.failed("上传失败");
            }

        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("上传失败");
        }
    }

    @ResponseBody
    @RequestMapping("/getDocuments")
    public AjaxResult getDocuments(@RequestParam(value = "pageNo",defaultValue = "1") Integer pageNo , String documentName){
        try {
            PageHelper.startPage(pageNo,10);
            List<DocumentInf> documentInfs = documentInfService.ListAllDocuments("%"+ documentName+"%");
            PageInfo<DocumentInf> pageInfo = new PageInfo<>(documentInfs, 5);
            return AjaxResult.success(null).add("pageInfo",pageInfo);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("获取文档列表失败！");
        }

    }
    @ResponseBody
    @RequestMapping("/deleteDocument")
    public AjaxResult deleteDocument(String ids){
        try {
            boolean b;
            if(ids.contains("-")){
                String[] str = ids.split("-");
                List<Integer> idList = new ArrayList<>();
                for(String id : str){
                    idList.add(Integer.parseInt(id));
                }
                b = documentInfService.deleteBatchIds(idList);
                if(b){
                    return AjaxResult.success(null);
                }else{
                    return AjaxResult.failed("删除文档失败！");
                }
            }else{
                b = documentInfService.deleteById(Integer.parseInt(ids));
                if(b){
                    return AjaxResult.success(null);
                }else{
                    return AjaxResult.failed("删除文档失败！");
                }
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            return AjaxResult.failed("删除文档失败！");
        }
    }

    @RequestMapping("/downloadDocument")
    public ResponseEntity<byte[]> fileDownload(HttpServletRequest request,
                                               String fileName) throws Exception{
        String path = request.getServletContext().getRealPath("/document/word/");
        File file = new File(path+File.separator+fileName);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<>
                (FileUtils.readFileToByteArray(file),headers, HttpStatus.OK);
    }

    @ResponseBody
    @RequestMapping("/updateDocument")
    public AjaxResult updateDocument(HttpServletRequest request,DocumentInf documentInf,String oldFileName){
        try {
            MultipartHttpServletRequest req = (MultipartHttpServletRequest) request;
            MultipartFile file = req.getFile("document");
            String originalName = file.getOriginalFilename();
            String extName = originalName.substring(originalName.lastIndexOf(".")); //后缀名
            String fileName = UUID.randomUUID().toString() + extName; //重新拼装的名字，防止名字重复
            String realPath = request.getSession().getServletContext().getRealPath("/document");
            String path = realPath + "\\word\\" + fileName;
            String oldPath = realPath + "\\word\\" + oldFileName;
            new File(oldPath).delete();
            file.transferTo(new File(path));
            documentInf.setFileName(fileName);
            boolean b = documentInfService.updateById(documentInf);
            if(b){
                return AjaxResult.success(null);
            }else{
                return AjaxResult.failed("更新文档失败！");
            }

        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.failed("更新文档失败！");
        }
    }

}


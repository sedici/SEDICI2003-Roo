// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.web;

import ar.edu.unlp.sedici.sedici2003.model.DsiEmailLog;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect DsiEmailLogController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String DsiEmailLogController.create(@Valid DsiEmailLog dsiEmailLog, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("dsiEmailLog", dsiEmailLog);
            addDateTimeFormatPatterns(uiModel);
            return "dsiemaillogs/create";
        }
        uiModel.asMap().clear();
        dsiEmailLog.persist();
        return "redirect:/dsiemaillogs/" + encodeUrlPathSegment(dsiEmailLog.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String DsiEmailLogController.createForm(Model uiModel) {
        uiModel.addAttribute("dsiEmailLog", new DsiEmailLog());
        addDateTimeFormatPatterns(uiModel);
        return "dsiemaillogs/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String DsiEmailLogController.show(@PathVariable("id") Integer id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("dsiemaillog", DsiEmailLog.findDsiEmailLog(id));
        uiModel.addAttribute("itemId", id);
        return "dsiemaillogs/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String DsiEmailLogController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("dsiemaillogs", DsiEmailLog.findDsiEmailLogEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) DsiEmailLog.countDsiEmailLogs() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("dsiemaillogs", DsiEmailLog.findAllDsiEmailLogs());
        }
        addDateTimeFormatPatterns(uiModel);
        return "dsiemaillogs/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String DsiEmailLogController.update(@Valid DsiEmailLog dsiEmailLog, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("dsiEmailLog", dsiEmailLog);
            addDateTimeFormatPatterns(uiModel);
            return "dsiemaillogs/update";
        }
        uiModel.asMap().clear();
        dsiEmailLog.merge();
        return "redirect:/dsiemaillogs/" + encodeUrlPathSegment(dsiEmailLog.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String DsiEmailLogController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("dsiEmailLog", DsiEmailLog.findDsiEmailLog(id));
        addDateTimeFormatPatterns(uiModel);
        return "dsiemaillogs/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String DsiEmailLogController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        DsiEmailLog.findDsiEmailLog(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/dsiemaillogs";
    }
    
    @ModelAttribute("dsiemaillogs")
    public Collection<DsiEmailLog> DsiEmailLogController.populateDsiEmailLogs() {
        return DsiEmailLog.findAllDsiEmailLogs();
    }
    
    void DsiEmailLogController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("dsiEmailLog_fechahora_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String DsiEmailLogController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}

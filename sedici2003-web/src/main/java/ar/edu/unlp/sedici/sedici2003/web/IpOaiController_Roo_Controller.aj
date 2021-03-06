// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.web;

import ar.edu.unlp.sedici.sedici2003.model.IpOai;
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

privileged aspect IpOaiController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String IpOaiController.create(@Valid IpOai ipOai, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("ipOai", ipOai);
            addDateTimeFormatPatterns(uiModel);
            return "ipoais/create";
        }
        uiModel.asMap().clear();
        ipOai.persist();
        return "redirect:/ipoais/" + encodeUrlPathSegment(ipOai.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String IpOaiController.createForm(Model uiModel) {
        uiModel.addAttribute("ipOai", new IpOai());
        addDateTimeFormatPatterns(uiModel);
        return "ipoais/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String IpOaiController.show(@PathVariable("id") Integer id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("ipoai", IpOai.findIpOai(id));
        uiModel.addAttribute("itemId", id);
        return "ipoais/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String IpOaiController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("ipoais", IpOai.findIpOaiEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) IpOai.countIpOais() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("ipoais", IpOai.findAllIpOais());
        }
        addDateTimeFormatPatterns(uiModel);
        return "ipoais/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String IpOaiController.update(@Valid IpOai ipOai, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("ipOai", ipOai);
            addDateTimeFormatPatterns(uiModel);
            return "ipoais/update";
        }
        uiModel.asMap().clear();
        ipOai.merge();
        return "redirect:/ipoais/" + encodeUrlPathSegment(ipOai.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String IpOaiController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("ipOai", IpOai.findIpOai(id));
        addDateTimeFormatPatterns(uiModel);
        return "ipoais/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String IpOaiController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        IpOai.findIpOai(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/ipoais";
    }
    
    @ModelAttribute("ipoais")
    public Collection<IpOai> IpOaiController.populateIpOais() {
        return IpOai.findAllIpOais();
    }
    
    void IpOaiController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("ipOai_fechahora_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String IpOaiController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

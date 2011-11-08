// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.web;

import ar.edu.unlp.sedici.sedici2003.model.IpWebservice;
import ar.edu.unlp.sedici.sedici2003.model.IpWebservicePK;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.ConversionService;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect IpWebserviceController_Roo_Controller {
    
    private ConversionService IpWebserviceController.conversionService;
    
    @Autowired
    public IpWebserviceController.new(ConversionService conversionService) {
        this.conversionService = conversionService;
    }

    @RequestMapping(method = RequestMethod.POST)
    public String IpWebserviceController.create(@Valid IpWebservice ipWebservice, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("ipWebservice", ipWebservice);
            return "ipwebservices/create";
        }
        uiModel.asMap().clear();
        ipWebservice.persist();
        return "redirect:/ipwebservices/" + encodeUrlPathSegment(conversionService.convert(ipWebservice.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String IpWebserviceController.createForm(Model uiModel) {
        uiModel.addAttribute("ipWebservice", new IpWebservice());
        return "ipwebservices/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String IpWebserviceController.show(@PathVariable("id") IpWebservicePK id, Model uiModel) {
        uiModel.addAttribute("ipwebservice", IpWebservice.findIpWebservice(id));
        uiModel.addAttribute("itemId", conversionService.convert(id, String.class));
        return "ipwebservices/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String IpWebserviceController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("ipwebservices", IpWebservice.findIpWebserviceEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) IpWebservice.countIpWebservices() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("ipwebservices", IpWebservice.findAllIpWebservices());
        }
        return "ipwebservices/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String IpWebserviceController.update(@Valid IpWebservice ipWebservice, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("ipWebservice", ipWebservice);
            return "ipwebservices/update";
        }
        uiModel.asMap().clear();
        ipWebservice.merge();
        return "redirect:/ipwebservices/" + encodeUrlPathSegment(conversionService.convert(ipWebservice.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String IpWebserviceController.updateForm(@PathVariable("id") IpWebservicePK id, Model uiModel) {
        uiModel.addAttribute("ipWebservice", IpWebservice.findIpWebservice(id));
        return "ipwebservices/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String IpWebserviceController.delete(@PathVariable("id") IpWebservicePK id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        IpWebservice.findIpWebservice(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/ipwebservices";
    }
    
    @ModelAttribute("ipwebservices")
    public Collection<IpWebservice> IpWebserviceController.populateIpWebservices() {
        return IpWebservice.findAllIpWebservices();
    }
    
    String IpWebserviceController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.web;

import ar.edu.unlp.sedici.sedici2003.model.JerarquiasRelaciones;
import ar.edu.unlp.sedici.sedici2003.model.JerarquiasRelacionesPK;
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

privileged aspect JerarquiasRelacionesController_Roo_Controller {
    
    private ConversionService JerarquiasRelacionesController.conversionService;
    
    @Autowired
    public JerarquiasRelacionesController.new(ConversionService conversionService) {
        this.conversionService = conversionService;
    }

    @RequestMapping(method = RequestMethod.POST)
    public String JerarquiasRelacionesController.create(@Valid JerarquiasRelaciones jerarquiasRelaciones, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("jerarquiasRelaciones", jerarquiasRelaciones);
            return "jerarquiasrelacioneses/create";
        }
        uiModel.asMap().clear();
        jerarquiasRelaciones.persist();
        return "redirect:/jerarquiasrelacioneses/" + encodeUrlPathSegment(conversionService.convert(jerarquiasRelaciones.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String JerarquiasRelacionesController.createForm(Model uiModel) {
        uiModel.addAttribute("jerarquiasRelaciones", new JerarquiasRelaciones());
        return "jerarquiasrelacioneses/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String JerarquiasRelacionesController.show(@PathVariable("id") JerarquiasRelacionesPK id, Model uiModel) {
        uiModel.addAttribute("jerarquiasrelaciones", JerarquiasRelaciones.findJerarquiasRelaciones(id));
        uiModel.addAttribute("itemId", conversionService.convert(id, String.class));
        return "jerarquiasrelacioneses/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String JerarquiasRelacionesController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("jerarquiasrelacioneses", JerarquiasRelaciones.findJerarquiasRelacionesEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) JerarquiasRelaciones.countJerarquiasRelacioneses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("jerarquiasrelacioneses", JerarquiasRelaciones.findAllJerarquiasRelacioneses());
        }
        return "jerarquiasrelacioneses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String JerarquiasRelacionesController.update(@Valid JerarquiasRelaciones jerarquiasRelaciones, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("jerarquiasRelaciones", jerarquiasRelaciones);
            return "jerarquiasrelacioneses/update";
        }
        uiModel.asMap().clear();
        jerarquiasRelaciones.merge();
        return "redirect:/jerarquiasrelacioneses/" + encodeUrlPathSegment(conversionService.convert(jerarquiasRelaciones.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String JerarquiasRelacionesController.updateForm(@PathVariable("id") JerarquiasRelacionesPK id, Model uiModel) {
        uiModel.addAttribute("jerarquiasRelaciones", JerarquiasRelaciones.findJerarquiasRelaciones(id));
        return "jerarquiasrelacioneses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String JerarquiasRelacionesController.delete(@PathVariable("id") JerarquiasRelacionesPK id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        JerarquiasRelaciones.findJerarquiasRelaciones(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/jerarquiasrelacioneses";
    }
    
    @ModelAttribute("jerarquiasrelacioneses")
    public Collection<JerarquiasRelaciones> JerarquiasRelacionesController.populateJerarquiasRelacioneses() {
        return JerarquiasRelaciones.findAllJerarquiasRelacioneses();
    }
    
    String JerarquiasRelacionesController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

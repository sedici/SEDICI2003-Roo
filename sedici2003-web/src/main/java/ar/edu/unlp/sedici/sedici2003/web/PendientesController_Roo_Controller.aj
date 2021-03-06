// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.web;

import ar.edu.unlp.sedici.sedici2003.model.Pendientes;
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

privileged aspect PendientesController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String PendientesController.create(@Valid Pendientes pendientes, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("pendientes", pendientes);
            addDateTimeFormatPatterns(uiModel);
            return "pendienteses/create";
        }
        uiModel.asMap().clear();
        pendientes.persist();
        return "redirect:/pendienteses/" + encodeUrlPathSegment(pendientes.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String PendientesController.createForm(Model uiModel) {
        uiModel.addAttribute("pendientes", new Pendientes());
        addDateTimeFormatPatterns(uiModel);
        return "pendienteses/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String PendientesController.show(@PathVariable("id") Integer id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("pendientes", Pendientes.findPendientes(id));
        uiModel.addAttribute("itemId", id);
        return "pendienteses/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String PendientesController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("pendienteses", Pendientes.findPendientesEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Pendientes.countPendienteses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("pendienteses", Pendientes.findAllPendienteses());
        }
        addDateTimeFormatPatterns(uiModel);
        return "pendienteses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String PendientesController.update(@Valid Pendientes pendientes, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("pendientes", pendientes);
            addDateTimeFormatPatterns(uiModel);
            return "pendienteses/update";
        }
        uiModel.asMap().clear();
        pendientes.merge();
        return "redirect:/pendienteses/" + encodeUrlPathSegment(pendientes.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String PendientesController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("pendientes", Pendientes.findPendientes(id));
        addDateTimeFormatPatterns(uiModel);
        return "pendienteses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String PendientesController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Pendientes.findPendientes(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/pendienteses";
    }
    
    @ModelAttribute("pendienteses")
    public Collection<Pendientes> PendientesController.populatePendienteses() {
        return Pendientes.findAllPendienteses();
    }
    
    void PendientesController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("pendientes_fechaactualizacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("pendientes_fechacreacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String PendientesController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

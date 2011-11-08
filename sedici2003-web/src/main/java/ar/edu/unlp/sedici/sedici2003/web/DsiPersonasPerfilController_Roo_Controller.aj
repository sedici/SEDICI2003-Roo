// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.web;

import ar.edu.unlp.sedici.sedici2003.model.DsiPersonasPerfil;
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

privileged aspect DsiPersonasPerfilController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String DsiPersonasPerfilController.create(@Valid DsiPersonasPerfil dsiPersonasPerfil, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("dsiPersonasPerfil", dsiPersonasPerfil);
            addDateTimeFormatPatterns(uiModel);
            return "dsipersonasperfils/create";
        }
        uiModel.asMap().clear();
        dsiPersonasPerfil.persist();
        return "redirect:/dsipersonasperfils/" + encodeUrlPathSegment(dsiPersonasPerfil.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String DsiPersonasPerfilController.createForm(Model uiModel) {
        uiModel.addAttribute("dsiPersonasPerfil", new DsiPersonasPerfil());
        addDateTimeFormatPatterns(uiModel);
        return "dsipersonasperfils/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String DsiPersonasPerfilController.show(@PathVariable("id") Integer id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("dsipersonasperfil", DsiPersonasPerfil.findDsiPersonasPerfil(id));
        uiModel.addAttribute("itemId", id);
        return "dsipersonasperfils/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String DsiPersonasPerfilController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("dsipersonasperfils", DsiPersonasPerfil.findDsiPersonasPerfilEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) DsiPersonasPerfil.countDsiPersonasPerfils() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("dsipersonasperfils", DsiPersonasPerfil.findAllDsiPersonasPerfils());
        }
        addDateTimeFormatPatterns(uiModel);
        return "dsipersonasperfils/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String DsiPersonasPerfilController.update(@Valid DsiPersonasPerfil dsiPersonasPerfil, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("dsiPersonasPerfil", dsiPersonasPerfil);
            addDateTimeFormatPatterns(uiModel);
            return "dsipersonasperfils/update";
        }
        uiModel.asMap().clear();
        dsiPersonasPerfil.merge();
        return "redirect:/dsipersonasperfils/" + encodeUrlPathSegment(dsiPersonasPerfil.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String DsiPersonasPerfilController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("dsiPersonasPerfil", DsiPersonasPerfil.findDsiPersonasPerfil(id));
        addDateTimeFormatPatterns(uiModel);
        return "dsipersonasperfils/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String DsiPersonasPerfilController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        DsiPersonasPerfil.findDsiPersonasPerfil(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/dsipersonasperfils";
    }
    
    @ModelAttribute("dsipersonasperfils")
    public Collection<DsiPersonasPerfil> DsiPersonasPerfilController.populateDsiPersonasPerfils() {
        return DsiPersonasPerfil.findAllDsiPersonasPerfils();
    }
    
    void DsiPersonasPerfilController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("dsiPersonasPerfil_fechahora_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String DsiPersonasPerfilController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

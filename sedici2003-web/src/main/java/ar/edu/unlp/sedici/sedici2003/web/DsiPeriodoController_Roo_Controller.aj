// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.web;

import ar.edu.unlp.sedici.sedici2003.model.DsiPeriodo;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect DsiPeriodoController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String DsiPeriodoController.create(@Valid DsiPeriodo dsiPeriodo, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("dsiPeriodo", dsiPeriodo);
            return "dsiperiodoes/create";
        }
        uiModel.asMap().clear();
        dsiPeriodo.persist();
        return "redirect:/dsiperiodoes/" + encodeUrlPathSegment(dsiPeriodo.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String DsiPeriodoController.createForm(Model uiModel) {
        uiModel.addAttribute("dsiPeriodo", new DsiPeriodo());
        return "dsiperiodoes/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String DsiPeriodoController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("dsiperiodo", DsiPeriodo.findDsiPeriodo(id));
        uiModel.addAttribute("itemId", id);
        return "dsiperiodoes/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String DsiPeriodoController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("dsiperiodoes", DsiPeriodo.findDsiPeriodoEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) DsiPeriodo.countDsiPeriodoes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("dsiperiodoes", DsiPeriodo.findAllDsiPeriodoes());
        }
        return "dsiperiodoes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String DsiPeriodoController.update(@Valid DsiPeriodo dsiPeriodo, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("dsiPeriodo", dsiPeriodo);
            return "dsiperiodoes/update";
        }
        uiModel.asMap().clear();
        dsiPeriodo.merge();
        return "redirect:/dsiperiodoes/" + encodeUrlPathSegment(dsiPeriodo.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String DsiPeriodoController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("dsiPeriodo", DsiPeriodo.findDsiPeriodo(id));
        return "dsiperiodoes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String DsiPeriodoController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        DsiPeriodo.findDsiPeriodo(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/dsiperiodoes";
    }
    
    @ModelAttribute("dsiperiodoes")
    public Collection<DsiPeriodo> DsiPeriodoController.populateDsiPeriodoes() {
        return DsiPeriodo.findAllDsiPeriodoes();
    }
    
    String DsiPeriodoController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

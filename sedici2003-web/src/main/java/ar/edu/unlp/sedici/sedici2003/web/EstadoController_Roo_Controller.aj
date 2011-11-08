// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.web;

import ar.edu.unlp.sedici.sedici2003.model.Estado;
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

privileged aspect EstadoController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String EstadoController.create(@Valid Estado estado, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("estado", estado);
            return "estadoes/create";
        }
        uiModel.asMap().clear();
        estado.persist();
        return "redirect:/estadoes/" + encodeUrlPathSegment(estado.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String EstadoController.createForm(Model uiModel) {
        uiModel.addAttribute("estado", new Estado());
        return "estadoes/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String EstadoController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("estado", Estado.findEstado(id));
        uiModel.addAttribute("itemId", id);
        return "estadoes/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String EstadoController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("estadoes", Estado.findEstadoEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Estado.countEstadoes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("estadoes", Estado.findAllEstadoes());
        }
        return "estadoes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String EstadoController.update(@Valid Estado estado, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("estado", estado);
            return "estadoes/update";
        }
        uiModel.asMap().clear();
        estado.merge();
        return "redirect:/estadoes/" + encodeUrlPathSegment(estado.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String EstadoController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("estado", Estado.findEstado(id));
        return "estadoes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String EstadoController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Estado.findEstado(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/estadoes";
    }
    
    @ModelAttribute("estadoes")
    public Collection<Estado> EstadoController.populateEstadoes() {
        return Estado.findAllEstadoes();
    }
    
    String EstadoController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

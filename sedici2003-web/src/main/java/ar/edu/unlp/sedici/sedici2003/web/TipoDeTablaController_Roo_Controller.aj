// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.web;

import ar.edu.unlp.sedici.sedici2003.model.TipoDeTabla;
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

privileged aspect TipoDeTablaController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String TipoDeTablaController.create(@Valid TipoDeTabla tipoDeTabla, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("tipoDeTabla", tipoDeTabla);
            return "tipodetablas/create";
        }
        uiModel.asMap().clear();
        tipoDeTabla.persist();
        return "redirect:/tipodetablas/" + encodeUrlPathSegment(tipoDeTabla.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String TipoDeTablaController.createForm(Model uiModel) {
        uiModel.addAttribute("tipoDeTabla", new TipoDeTabla());
        return "tipodetablas/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String TipoDeTablaController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("tipodetabla", TipoDeTabla.findTipoDeTabla(id));
        uiModel.addAttribute("itemId", id);
        return "tipodetablas/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String TipoDeTablaController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("tipodetablas", TipoDeTabla.findTipoDeTablaEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) TipoDeTabla.countTipoDeTablas() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("tipodetablas", TipoDeTabla.findAllTipoDeTablas());
        }
        return "tipodetablas/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String TipoDeTablaController.update(@Valid TipoDeTabla tipoDeTabla, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("tipoDeTabla", tipoDeTabla);
            return "tipodetablas/update";
        }
        uiModel.asMap().clear();
        tipoDeTabla.merge();
        return "redirect:/tipodetablas/" + encodeUrlPathSegment(tipoDeTabla.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String TipoDeTablaController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("tipoDeTabla", TipoDeTabla.findTipoDeTabla(id));
        return "tipodetablas/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String TipoDeTablaController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        TipoDeTabla.findTipoDeTabla(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/tipodetablas";
    }
    
    @ModelAttribute("tipodetablas")
    public Collection<TipoDeTabla> TipoDeTablaController.populateTipoDeTablas() {
        return TipoDeTabla.findAllTipoDeTablas();
    }
    
    String TipoDeTablaController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

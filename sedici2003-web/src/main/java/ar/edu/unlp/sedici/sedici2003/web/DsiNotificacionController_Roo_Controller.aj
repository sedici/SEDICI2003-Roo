// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.web;

import ar.edu.unlp.sedici.sedici2003.model.DsiNotificacion;
import ar.edu.unlp.sedici.sedici2003.model.DsiNotificacionPK;
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

privileged aspect DsiNotificacionController_Roo_Controller {
    
    private ConversionService DsiNotificacionController.conversionService;
    
    @Autowired
    public DsiNotificacionController.new(ConversionService conversionService) {
        this.conversionService = conversionService;
    }

    @RequestMapping(method = RequestMethod.POST)
    public String DsiNotificacionController.create(@Valid DsiNotificacion dsiNotificacion, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("dsiNotificacion", dsiNotificacion);
            return "dsinotificacions/create";
        }
        uiModel.asMap().clear();
        dsiNotificacion.persist();
        return "redirect:/dsinotificacions/" + encodeUrlPathSegment(conversionService.convert(dsiNotificacion.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String DsiNotificacionController.createForm(Model uiModel) {
        uiModel.addAttribute("dsiNotificacion", new DsiNotificacion());
        return "dsinotificacions/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String DsiNotificacionController.show(@PathVariable("id") DsiNotificacionPK id, Model uiModel) {
        uiModel.addAttribute("dsinotificacion", DsiNotificacion.findDsiNotificacion(id));
        uiModel.addAttribute("itemId", conversionService.convert(id, String.class));
        return "dsinotificacions/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String DsiNotificacionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("dsinotificacions", DsiNotificacion.findDsiNotificacionEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) DsiNotificacion.countDsiNotificacions() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("dsinotificacions", DsiNotificacion.findAllDsiNotificacions());
        }
        return "dsinotificacions/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String DsiNotificacionController.update(@Valid DsiNotificacion dsiNotificacion, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("dsiNotificacion", dsiNotificacion);
            return "dsinotificacions/update";
        }
        uiModel.asMap().clear();
        dsiNotificacion.merge();
        return "redirect:/dsinotificacions/" + encodeUrlPathSegment(conversionService.convert(dsiNotificacion.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String DsiNotificacionController.updateForm(@PathVariable("id") DsiNotificacionPK id, Model uiModel) {
        uiModel.addAttribute("dsiNotificacion", DsiNotificacion.findDsiNotificacion(id));
        return "dsinotificacions/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String DsiNotificacionController.delete(@PathVariable("id") DsiNotificacionPK id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        DsiNotificacion.findDsiNotificacion(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/dsinotificacions";
    }
    
    @ModelAttribute("dsinotificacions")
    public Collection<DsiNotificacion> DsiNotificacionController.populateDsiNotificacions() {
        return DsiNotificacion.findAllDsiNotificacions();
    }
    
    String DsiNotificacionController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

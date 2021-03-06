// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.web;

import ar.edu.unlp.sedici.sedici2003.model.AbreviaturaPais;
import ar.edu.unlp.sedici.sedici2003.model.AbreviaturaPaisPK;
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

privileged aspect AbreviaturaPaisController_Roo_Controller {
    
    private ConversionService AbreviaturaPaisController.conversionService;
    
    @Autowired
    public AbreviaturaPaisController.new(ConversionService conversionService) {
        this.conversionService = conversionService;
    }

    @RequestMapping(method = RequestMethod.POST)
    public String AbreviaturaPaisController.create(@Valid AbreviaturaPais abreviaturaPais, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("abreviaturaPais", abreviaturaPais);
            return "abreviaturapaises/create";
        }
        uiModel.asMap().clear();
        abreviaturaPais.persist();
        return "redirect:/abreviaturapaises/" + encodeUrlPathSegment(conversionService.convert(abreviaturaPais.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String AbreviaturaPaisController.createForm(Model uiModel) {
        uiModel.addAttribute("abreviaturaPais", new AbreviaturaPais());
        return "abreviaturapaises/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String AbreviaturaPaisController.show(@PathVariable("id") AbreviaturaPaisPK id, Model uiModel) {
        uiModel.addAttribute("abreviaturapais", AbreviaturaPais.findAbreviaturaPais(id));
        uiModel.addAttribute("itemId", conversionService.convert(id, String.class));
        return "abreviaturapaises/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String AbreviaturaPaisController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("abreviaturapaises", AbreviaturaPais.findAbreviaturaPaisEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) AbreviaturaPais.countAbreviaturaPaises() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("abreviaturapaises", AbreviaturaPais.findAllAbreviaturaPaises());
        }
        return "abreviaturapaises/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String AbreviaturaPaisController.update(@Valid AbreviaturaPais abreviaturaPais, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("abreviaturaPais", abreviaturaPais);
            return "abreviaturapaises/update";
        }
        uiModel.asMap().clear();
        abreviaturaPais.merge();
        return "redirect:/abreviaturapaises/" + encodeUrlPathSegment(conversionService.convert(abreviaturaPais.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String AbreviaturaPaisController.updateForm(@PathVariable("id") AbreviaturaPaisPK id, Model uiModel) {
        uiModel.addAttribute("abreviaturaPais", AbreviaturaPais.findAbreviaturaPais(id));
        return "abreviaturapaises/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String AbreviaturaPaisController.delete(@PathVariable("id") AbreviaturaPaisPK id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        AbreviaturaPais.findAbreviaturaPais(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/abreviaturapaises";
    }
    
    @ModelAttribute("abreviaturapaises")
    public Collection<AbreviaturaPais> AbreviaturaPaisController.populateAbreviaturaPaises() {
        return AbreviaturaPais.findAllAbreviaturaPaises();
    }
    
    String AbreviaturaPaisController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

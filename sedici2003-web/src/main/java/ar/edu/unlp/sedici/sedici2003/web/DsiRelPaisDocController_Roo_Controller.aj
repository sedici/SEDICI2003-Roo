// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.web;

import ar.edu.unlp.sedici.sedici2003.model.DsiRelPaisDoc;
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

privileged aspect DsiRelPaisDocController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String DsiRelPaisDocController.create(@Valid DsiRelPaisDoc dsiRelPaisDoc, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("dsiRelPaisDoc", dsiRelPaisDoc);
            return "dsirelpaisdocs/create";
        }
        uiModel.asMap().clear();
        dsiRelPaisDoc.persist();
        return "redirect:/dsirelpaisdocs/" + encodeUrlPathSegment(dsiRelPaisDoc.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String DsiRelPaisDocController.createForm(Model uiModel) {
        uiModel.addAttribute("dsiRelPaisDoc", new DsiRelPaisDoc());
        return "dsirelpaisdocs/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String DsiRelPaisDocController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("dsirelpaisdoc", DsiRelPaisDoc.findDsiRelPaisDoc(id));
        uiModel.addAttribute("itemId", id);
        return "dsirelpaisdocs/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String DsiRelPaisDocController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("dsirelpaisdocs", DsiRelPaisDoc.findDsiRelPaisDocEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) DsiRelPaisDoc.countDsiRelPaisDocs() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("dsirelpaisdocs", DsiRelPaisDoc.findAllDsiRelPaisDocs());
        }
        return "dsirelpaisdocs/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String DsiRelPaisDocController.update(@Valid DsiRelPaisDoc dsiRelPaisDoc, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("dsiRelPaisDoc", dsiRelPaisDoc);
            return "dsirelpaisdocs/update";
        }
        uiModel.asMap().clear();
        dsiRelPaisDoc.merge();
        return "redirect:/dsirelpaisdocs/" + encodeUrlPathSegment(dsiRelPaisDoc.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String DsiRelPaisDocController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("dsiRelPaisDoc", DsiRelPaisDoc.findDsiRelPaisDoc(id));
        return "dsirelpaisdocs/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String DsiRelPaisDocController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        DsiRelPaisDoc.findDsiRelPaisDoc(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/dsirelpaisdocs";
    }
    
    @ModelAttribute("dsirelpaisdocs")
    public Collection<DsiRelPaisDoc> DsiRelPaisDocController.populateDsiRelPaisDocs() {
        return DsiRelPaisDoc.findAllDsiRelPaisDocs();
    }
    
    String DsiRelPaisDocController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.unlp.sedici.sedici2003.web;

import ar.edu.unlp.sedici.sedici2003.model.Productos;
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

privileged aspect ProductosController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String ProductosController.create(@Valid Productos productos, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("productos", productos);
            return "productoses/create";
        }
        uiModel.asMap().clear();
        productos.persist();
        return "redirect:/productoses/" + encodeUrlPathSegment(productos.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String ProductosController.createForm(Model uiModel) {
        uiModel.addAttribute("productos", new Productos());
        return "productoses/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String ProductosController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("productos", Productos.findProductos(id));
        uiModel.addAttribute("itemId", id);
        return "productoses/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String ProductosController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("productoses", Productos.findProductosEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Productos.countProductoses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("productoses", Productos.findAllProductoses());
        }
        return "productoses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ProductosController.update(@Valid Productos productos, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("productos", productos);
            return "productoses/update";
        }
        uiModel.asMap().clear();
        productos.merge();
        return "redirect:/productoses/" + encodeUrlPathSegment(productos.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String ProductosController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("productos", Productos.findProductos(id));
        return "productoses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String ProductosController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Productos.findProductos(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/productoses";
    }
    
    @ModelAttribute("productoses")
    public Collection<Productos> ProductosController.populateProductoses() {
        return Productos.findAllProductoses();
    }
    
    String ProductosController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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

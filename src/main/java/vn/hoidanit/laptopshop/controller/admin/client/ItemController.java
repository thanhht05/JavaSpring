package vn.hoidanit.laptopshop.controller.admin.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;

@Controller
public class ItemController {
    private final ProductService productService;

    ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/client/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("productDetail", product);
        return "client/product/show";
    }

}

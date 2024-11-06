package vn.hoidanit.laptopshop.controller.admin;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ProductController {
    private final ProductService productService;
    private final UploadService uploadService;

    ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getMethodName(Model model) {
        List<Product> products = this.productService.getAllProduct();
        model.addAttribute("products", products);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String postMethodName(Model model, @ModelAttribute("newProduct") Product product,
            @RequestParam("fileName") MultipartFile file) throws IOException {
        product.setName(product.getName());
        product.setPrice(product.getPrice());
        product.setDetailDesc(product.getDetailDesc());
        product.setShortDesc(product.getShortDesc());
        product.setTarget(product.getTarget());
        product.setSold(product.getSold());
        product.setFactory(product.getFactory());
        product.setQuantity(product.getQuantity());
        String nameImg = this.uploadService.handleUploadFile(file, "product");
        product.setImage(nameImg);
        this.productService.saveAProduct(product);

        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/update/{id}")
    public String GetUpdateProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String handleUpdateProductPage(Model model, @ModelAttribute("product") Product product,
            @RequestParam("productFile") MultipartFile file) throws IOException {
        Product updateProduct = this.productService.getProductById(product.getId());
        if (updateProduct != null) {
            updateProduct.setName(product.getName());
            updateProduct.setDetailDesc(product.getDetailDesc());
            updateProduct.setFactory(product.getFactory());
            updateProduct.setTarget(product.getTarget());
            updateProduct.setQuantity(product.getQuantity());
            updateProduct.setShortDesc(product.getShortDesc());
            updateProduct.setFactory(product.getFactory());
            updateProduct.setPrice(product.getPrice());

            if (!file.isEmpty()) {
                String img = this.uploadService.handleUploadFile(file, "product");
                updateProduct.setImage(img);
            }

        }
        this.productService.saveAProduct(updateProduct);

        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String handleRemoveProduct(Model model, @ModelAttribute("Product") Product product) {
        // Product currenProduct = this.productService.getProductById(product.getId());
        this.productService.deleteAProduct(product.getId());
        return "redirect:/admin/product";
    }

    

}

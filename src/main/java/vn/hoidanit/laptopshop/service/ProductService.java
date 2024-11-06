package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product saveAProduct(Product product) {
        Product newProduct = this.productRepository.save(product);
        return newProduct;
    }

    public List<Product> getAllProduct() {
        List<Product> products = this.productRepository.findAll();
        return products;
    }

    public Product getProductById(long id) {
        Product product = this.productRepository.findById(id);
        return product;
    }

    public void deleteAProduct(long id) {
        this.productRepository.deleteById(id);
    }
}
